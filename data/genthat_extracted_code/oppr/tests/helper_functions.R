r_phylo_div_mip_formulation <- function(project_data, action_data, tree, budget,
                                        n_approx_points) {
  # Initialization
  ## calculate numbers
  n_projects <- nrow(project_data)
  n_actions <- nrow(action_data)
  n_shared_actions <- sum(as.matrix(project_data[, action_data$name,
                                                 drop = FALSE]))
  species_names <- tree$tip.label
  n_spp <- length(species_names)

  ## convert tree to branch matrix + vector of lengths
  T_bs <- branch_matrix(tree)
  T_bs <- as(T_bs, "dgTMatrix")
  L_b <- tree$edge.length
  bo <- rcpp_branch_order(T_bs)
  T_bs <- T_bs[, bo, drop = FALSE]
  L_b <- L_b[bo]

  ### calculate tree properties
  n_branches <- ncol(T_bs)
  branch_tip_indices <- which(Matrix::colSums(T_bs) == 1)
  branch_nontip_indices <- which(Matrix::colSums(T_bs) > 1)

  ## create variable names
  variable_names <- c(paste0("X_", seq_len(n_actions)),
                      paste0("Y_", seq_len(n_projects)),
                      paste0("Z_", outer(seq_len(n_projects),
                                         species_names,
                                         paste0)),
                      paste0("R_", seq_len(n_branches)))

  ## calculate number of variables
  n_v <- length(variable_names)

  # Build model
  ## initialize model
  model <- list(modelsense = "max")

  ## set objective function
  model$obj <- rep(0, n_v)
  model$obj[match(paste0("R_", branch_tip_indices), variable_names)] <-
    L_b[branch_tip_indices]

  ## set variable bounds
  model$lb <- rep(0, n_v)
  model$ub <- rep(1, n_v)
  model$ub[match(paste0("R_", branch_nontip_indices), variable_names)] <- Inf
  model$lb[match(paste0("R_", branch_nontip_indices), variable_names)] <- -Inf
  model$lb[which(action_data$locked_in)] <- 1
  model$ub[which(action_data$locked_out)] <- 0

  ## set variable types
  model$vtype <- rep("S", n_v)
  model$vtype[seq_len(n_actions)] <- "B"
  model$vtype[n_actions + seq_len(n_projects)] <- "B"
  model$vtype[n_actions + n_projects +
              seq_along(outer(species_names, seq_len(n_projects),
                              paste0))] <- "B"
  model$vtype[match(paste0("R_", branch_nontip_indices), variable_names)] <- "C"

  ## set linear constraints
  ### initialize constraints
  model$A <- Matrix::sparseMatrix(i = 1, j = 1, x = 0,
                                  dims = c(1 +
                                           n_shared_actions +
                                           (n_spp * n_projects) +
                                           n_spp +
                                           n_spp +
                                           length(branch_nontip_indices), n_v),
                                  dimnames = list(NULL, variable_names))
  model$A <- Matrix::drop0(model$A)
  model$rhs <- rep(NA_real_, nrow(model$A))
  model$sense <- rep(NA_character_, nrow(model$A))
  model$rownames <- rep(NA_character_, nrow(model$A))

  ### constraints to ensure that projects can only be funded if all of their
  ### actions are funded
  curr_row <- 0
  for (j in seq_len(n_projects)) {
    for (i in seq_len(n_actions)) {
      if (project_data[[action_data$name[i]]][j]) {
        curr_row <- curr_row + 1
        model$A[curr_row, paste0("X_", i)] <- 1
        model$A[curr_row, paste0("Y_", j)] <- -1
        model$sense[curr_row] <- ">="
        model$rhs[curr_row] <- 0
        model$rownames[curr_row] <- "C2"
      }
    }
  }

  ### constraints to ensure that species can only be allocated to funded
  ### projects
  for (s in species_names) {
    for (j in seq_len(n_projects)) {
      curr_row <- curr_row + 1
      model$A[curr_row, paste0("Y_", j)] <- 1
      model$A[curr_row, paste0("Z_", j, s)] <- -1
      model$sense[curr_row] <- ">="
      model$rhs[curr_row] <- 0
      model$rownames[curr_row] <- "C3"
    }
  }

  ### constraints to ensure that each species can only be allocated to a single
  ### project
  for (s in species_names) {
    curr_row <- curr_row + 1
    for (j in seq_len(n_projects)) {
      if (project_data[[s]][j] > 1.0e-15) {
        model$A[curr_row, paste0("Z_", j, s)] <- 1
      }
    }
    model$sense[curr_row] <- "="
    model$rhs[curr_row] <- 1
    model$rownames[curr_row] <- "C3"
  }

  ### species persistence probability constraints
  for (s in species_names) {
    curr_row <- curr_row + 1
    curr_projects_for_spp <- which(project_data[[s]] > 0)
    b <- which((Matrix::colSums(T_bs) == 1) &
               (T_bs[match(s, species_names), ] == 1))
    model$A[curr_row, paste0("Z_", curr_projects_for_spp, s)] <-
      project_data[[s]][curr_projects_for_spp] *
      project_data$success[curr_projects_for_spp]
    model$A[curr_row, paste0("R_", b)] <- -1
    model$sense[curr_row] <- "="
    model$rhs[curr_row] <- 0
    model$rownames[curr_row] <- "C4"
  }

  ## set constraints to specify log-sum probabilities for branches associated
  ## with multiple species
  if (length(branch_nontip_indices) > 0) {
    ### initialize variables
    model$pwlobj <- list()
    curr_pwl <- 0
    for (b in branch_nontip_indices) {
      ### increment counters
      curr_row <- curr_row + 1
      curr_pwl <- curr_pwl + 1
      ### apply linear constraints
      for (s in species_names[which(T_bs[, b] > 0.5)]) {
        curr_projects_for_spp <- which(project_data[[s]] > 0)
        model$A[curr_row, paste0("Z_", curr_projects_for_spp, s)] <-
          log(1 - (project_data[[s]][curr_projects_for_spp] *
                   project_data$success[curr_projects_for_spp]))
      }
      model$A[curr_row, paste0("R_", b)] <- -1
      model$sense[curr_row] <- "="
      model$rhs[curr_row] <- 0
      model$rownames[curr_row] <- "C5"
      ### apply piecewise linear approximation constraints
      #### calculate extinction probabilities for each spp and project
      curr_probs <- as.matrix(project_data[, species_names[T_bs[, b] > 0.5]])
      curr_probs <- curr_probs * matrix(project_data$success, byrow = FALSE,
                                        ncol = ncol(curr_probs),
                                        nrow = nrow(curr_probs))
      curr_probs[curr_probs < 1e-15] <- NA_real_
      curr_probs <- 1 - curr_probs
      #### calculate log-sum value of extinction probabilities if best project
      ### funded for each species
      curr_min_value <- sum(log(apply(curr_probs, 2, min, na.rm = TRUE)))
      #### calculate log-sum value of extinction probabilities if worst project
      ### funded for each species
      curr_max_value <- sum(log(apply(curr_probs, 2, max, na.rm = TRUE)))
      model$pwlobj[[curr_pwl]] <- list()
      model$pwlobj[[curr_pwl]]$var <- match(paste0("R_", b), variable_names)
      model$pwlobj[[curr_pwl]]$x <- seq(curr_min_value * 0.99,
                                        curr_max_value * 1.01,
                                        length.out = n_approx_points)
      model$pwlobj[[curr_pwl]]$y <- L_b[b] * (1 -
                                              exp(model$pwlobj[[curr_pwl]]$x))
    }
  }

  ### budget constraint
  curr_row <- curr_row + 1
  model$A[curr_row, paste0("X_", seq_len(n_actions))] <- action_data$cost
  model$sense[curr_row] <- "<="
  model$rhs[curr_row] <- budget
  model$rownames[curr_row] <- "C1"

  # Exports
  model
}
