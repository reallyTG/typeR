context("add_max_richness_objective")

test_that("compile (no weights)", {
  # create data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions()
  # create optimization problem
  o <- compile(p)
  # tests
  expect_equal(o$modelsense(), "max")
  expect_equal(o$obj(), c(rep(0, ncol(o$A()) - nrow(features)),
                          rep(1, nrow(features))))
  expect_equal(o$ub(), rep(1, ncol(o$A())))
  expect_equal(o$lb(), rep(0, ncol(o$A())))
  expect_equal(o$vtype(), c(rep("B", nrow(actions) + nrow(projects) +
                                     nrow(projects) * nrow(features)),
                            rep("S", nrow(features))))
  expect_equal(o$pwlobj(), list())
  expect_equal(o$col_ids(), c(rep("i", nrow(actions)), rep("j", nrow(projects)),
                              rep("fj", nrow(projects) * nrow(features)),
                              rep("f", nrow(features))))
  expect_equal(o$rhs(), c(rep(0, sum(p$pa_matrix() > 0)),
                          rep(0, nrow(features) * nrow(projects)),
                          rep(1, nrow(features)),
                          rep(0, nrow(features)),
                          0.16))
  expect_equal(o$sense(), c(rep(">=", sum(p$pa_matrix() > 0)),
                            rep(">=", nrow(features) * nrow(projects)),
                            rep("=", nrow(features)),
                            rep("=", nrow(features)),
                            "<="))
  expect_equal(o$row_ids(), c(rep("c1", sum(p$pa_matrix() > 0)),
                            rep("c2", nrow(features) * nrow(projects)),
                            rep("c3", nrow(features)),
                            rep("c4", nrow(features)),
                            "m"))
  A <- Matrix::sparseMatrix(i = 1, j = 1, x = 0,
    dims = c(sum(p$pa_matrix() > 0) + (nrow(features) * nrow(projects)) +
             nrow(features) + nrow(features) + 1,
             nrow(actions) + nrow(projects) +
             (nrow(projects) * nrow(features)) + nrow(features)),
    dimnames = list(NULL, c(paste0("X_", seq_len(nrow(actions))),
                            paste0("Y_", seq_len(nrow(projects))),
                            paste0("Z_", outer(seq_len(nrow(projects)),
                                               seq_len(nrow(features)),
                                               paste0)),
                            paste0("F_", seq_len(nrow(features))))))
  A <- Matrix::drop0(A)
  curr_row <- 0
  for (j in seq_len(nrow(projects))) {
    for (i in seq_len(nrow(actions))) {
      if (projects[[actions$name[i]]][j]) {
        curr_row <- curr_row + 1
        A[curr_row, paste0("X_", i)] <- 1
        A[curr_row, paste0("Y_", j)] <- -1
      }
    }
  }
  for (f in seq_len(nrow(features))) {
    for (j in seq_len(nrow(projects))) {
      curr_row <- curr_row + 1
      A[curr_row, paste0("Y_", j)] <- 1
      A[curr_row, paste0("Z_", j, f)] <- -1
    }
  }
  for (f in seq_len(nrow(features))) {
    curr_row <- curr_row + 1
    for (j in seq_len(nrow(projects))) {
      if (isTRUE(projects[[features$name[f]]][j] > 1e-15)) {
        A[curr_row, paste0("Z_", j, f)] <- 1
      }
    }
  }
  for (f in seq_len(nrow(features))) {
    curr_row <- curr_row + 1
    curr_projects_for_f <- which(projects[[f]] > 0)
    A[curr_row, paste0("Z_", curr_projects_for_f, f)] <-
      projects[[features$name[f]]][curr_projects_for_f] *
      projects$success[curr_projects_for_f]
    A[curr_row, paste0("F_", f)] <- -1
  }
  curr_row <- curr_row + 1
  A[curr_row, seq_len(nrow(actions))] <- actions$cost
  expect_true(all(o$A() == A))
})

test_that("compile (weights)", {
  # create data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"),
                             weight = seq_len(3) * 90)
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_feature_weights(weight = features$weight) %>%
       add_binary_decisions()
  # create optimization problem
  o <- compile(p)
  # tests
  expect_equal(o$modelsense(), "max")
  expect_equal(o$obj(), c(rep(0, ncol(o$A()) - nrow(features)),
                          features$weight))
  expect_equal(o$ub(), rep(1, ncol(o$A())))
  expect_equal(o$lb(), rep(0, ncol(o$A())))
  expect_equal(o$vtype(), c(rep("B", nrow(actions) + nrow(projects) +
                                     nrow(projects) * nrow(features)),
                            rep("S", nrow(features))))
  expect_equal(o$pwlobj(), list())
  expect_equal(o$col_ids(), c(rep("i", nrow(actions)), rep("j", nrow(projects)),
                              rep("fj", nrow(projects) * nrow(features)),
                              rep("f", nrow(features))))
  expect_equal(o$rhs(), c(rep(0, sum(p$pa_matrix() > 0)),
                          rep(0, nrow(features) * nrow(projects)),
                          rep(1, nrow(features)),
                          rep(0, nrow(features)),
                          0.16))
  expect_equal(o$sense(), c(rep(">=", sum(p$pa_matrix() > 0)),
                            rep(">=", nrow(features) * nrow(projects)),
                            rep("=", nrow(features)),
                            rep("=", nrow(features)),
                            "<="))
  expect_equal(o$row_ids(), c(rep("c1", sum(p$pa_matrix() > 0)),
                            rep("c2", nrow(features) * nrow(projects)),
                            rep("c3", nrow(features)),
                            rep("c4", nrow(features)),
                            "m"))
  A <- Matrix::sparseMatrix(i = 1, j = 1, x = 0,
    dims = c(sum(p$pa_matrix() > 0) + (nrow(features) * nrow(projects)) +
             nrow(features) + nrow(features) + 1,
             nrow(actions) + nrow(projects) +
             (nrow(projects) * nrow(features)) + nrow(features)),
    dimnames = list(NULL, c(paste0("X_", seq_len(nrow(actions))),
                            paste0("Y_", seq_len(nrow(projects))),
                            paste0("Z_", outer(seq_len(nrow(projects)),
                                               seq_len(nrow(features)),
                                               paste0)),
                            paste0("F_", seq_len(nrow(features))))))
  A <- Matrix::drop0(A)
  curr_row <- 0
  for (j in seq_len(nrow(projects))) {
    for (i in seq_len(nrow(actions))) {
      if (projects[[actions$name[i]]][j]) {
        curr_row <- curr_row + 1
        A[curr_row, paste0("X_", i)] <- 1
        A[curr_row, paste0("Y_", j)] <- -1
      }
    }
  }
  for (f in seq_len(nrow(features))) {
    for (j in seq_len(nrow(projects))) {
      curr_row <- curr_row + 1
      A[curr_row, paste0("Y_", j)] <- 1
      A[curr_row, paste0("Z_", j, f)] <- -1
    }
  }
  for (f in seq_len(nrow(features))) {
    curr_row <- curr_row + 1
    for (j in seq_len(nrow(projects))) {
      if (isTRUE(projects[[features$name[f]]][j] > 1e-15)) {
        A[curr_row, paste0("Z_", j, f)] <- 1
      }
    }
  }
  for (f in seq_len(nrow(features))) {
    curr_row <- curr_row + 1
    curr_projects_for_f <- which(projects[[f]] > 0)
    A[curr_row, paste0("Z_", curr_projects_for_f, f)] <-
      projects[[features$name[f]]][curr_projects_for_f] *
      projects$success[curr_projects_for_f]
    A[curr_row, paste0("F_", f)] <- -1
  }
  curr_row <- curr_row + 1
  A[curr_row, seq_len(nrow(actions))] <- actions$cost
  expect_true(all(o$A() == A))
})

test_that("exact solver (simple problem, single solution)", {
  skip_on_cran()
  skip_if_not(any_solvers_installed())
  # make data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p1 <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions()
  p2 <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0.26) %>%
       add_binary_decisions()
  # solve problem
  s1 <- solve(p1)
  s2 <- solve(p2)
  # tests
  ## s1
  expect_is(s1, "tbl_df")
  expect_equal(nrow(s1), 1L)
  expect_equal(s1$solution, 1L)
  expect_true(s1$status %in% c("OPTIMAL", "TM_OPTIMAL_SOLUTION_FOUND",
                               "optimal solution found"))
  expect_equal(s1$obj, s1$F1 + s1$F2 + s1$F3)
  expect_equal(s1$cost, 0.15)
  expect_equal(s1$A1, 0)
  expect_equal(s1$A2, 0)
  expect_equal(s1$A3, 1)
  expect_equal(s1$A4, 1)
  expect_equal(s1$F1, 0.94 * 0.8)
  expect_equal(s1$F2, 0.94 * 0.8)
  expect_equal(s1$F3, 1 * 0.1)
  ## s2
  expect_is(s2, "tbl_df")
  expect_equal(nrow(s2), 1L)
  expect_equal(s2$solution, 1L)
  expect_true(s2$status %in% c("OPTIMAL", "TM_OPTIMAL_SOLUTION_FOUND",
                               "optimal solution found"))
  expect_equal(s2$obj, s2$F1 + s2$F2 + s2$F3)
  expect_equal(s2$cost, 0.2)
  expect_equal(s2$A1, 1)
  expect_equal(s2$A2, 1)
  expect_equal(s2$A3, 0)
  expect_equal(s2$A4, 1)
  expect_equal(s2$F1, 0.95 * 0.91)
  expect_equal(s2$F2, 0.96 * 0.92)
  expect_equal(s2$F3, 1 * 0.1)
})

test_that("exact solver (tricky problem, single solution)", {
  skip_on_cran()
  skip_if_not(any_solvers_installed())
  # make data
  projects <- tibble::tibble(name = letters[1:4],
                             success =  c(0.9, 0.9, 0.9, 1.00),
                             F1 =       c(0.3, 0.2, 0.1, 0.01),
                             F2 =       c(0, 0, 0, 0.01),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(TRUE, TRUE, FALSE, FALSE),
                             A3 =       c(TRUE, TRUE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.5, 0.5, 0.5, 0))
  features <- tibble::tibble(name = c("F1", "F2"), weight = c(5, 5))
  # make problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 1.0) %>%
       add_binary_decisions()
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_equal(nrow(s), 1L)
  expect_equal(s$cost, 1)
  expect_true(s$status %in% c("OPTIMAL", "TM_OPTIMAL_SOLUTION_FOUND",
                               "optimal solution found"))
  expect_equal(s$obj, 0.19)
  expect_equal(s$F1, 0.18)
  expect_equal(s$F2, 0.01)
  expect_equal(s$A2, 1)
  expect_equal(s$A3, 1)
  expect_equal(s$A4, 1)
})

test_that("exact solver (simple problem, multiple solutions)", {
  skip_on_cran()
  skip_if_not_installed("gurobi", "8.0.0")
  skip_if_not(any_solvers_installed())
  # make data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions() %>%
       add_gurobi_solver(number_solutions = 100)
  # solve problem
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_gt(nrow(s), 1)
  expect_true(all(s$obj <= (0.752 + 0.752 + 0.100)))
  expect_true(all(s$cost <= 0.16))
  expect_equal(s$cost, (s$A1 * actions$cost[1]) +
                       (s$A2 * actions$cost[2]) +
                       (s$A3 * actions$cost[3]) +
                       (s$A4 * actions$cost[4]))
  expect_equal(s$status, ifelse(abs(s$obj - max(s$obj)) < 1e-10,
                                "OPTIMAL", "SUBOPTIMAL"))
  expect_is(s$A1, "numeric")
  expect_is(s$A2, "numeric")
  expect_is(s$A3, "numeric")
  expect_is(s$A4, "numeric")
  expect_is(s$F1, "numeric")
  expect_is(s$F2, "numeric")
  expect_is(s$F3, "numeric")
  expect_true(all(rowSums(as.matrix(s[, actions$name])) >= 1))
})

test_that("exact solver (locked constraints, multiple solutions)", {
  skip_on_cran()
  skip_if_not_installed("gurobi", "8.0.0")
  skip_if_not(any_solvers_installed())
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 100) %>%
       add_locked_in_constraints(1) %>%
       add_locked_out_constraints(2) %>%
       add_binary_decisions() %>%
       add_gurobi_solver(number_solutions = 100)
  # solve problem
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_gt(nrow(s), 1)
  expect_true(all(s$obj <= ((0.95 * 0.91) + (0.94 * 0.8) + 0.100)))
  expect_true(all(s$cost <= 0.25))
  expect_equal(s$cost, (s$A1 * actions$cost[1]) +
                       (s$A2 * actions$cost[2]) +
                       (s$A3 * actions$cost[3]) +
                       (s$A4 * actions$cost[4]))
  expect_equal(s$status, ifelse(abs(s$obj - max(s$obj)) < 1e-10,
                                "OPTIMAL", "SUBOPTIMAL"))
  expect_is(s$A1, "numeric")
  expect_true(all(s$A1 > 0.5))
  expect_is(s$A2, "numeric")
  expect_true(all(s$A2 < 0.5))
  expect_is(s$A3, "numeric")
  expect_is(s$A4, "numeric")
  expect_is(s$F1, "numeric")
  expect_is(s$F2, "numeric")
  expect_is(s$F3, "numeric")
  expect_true(all(rowSums(as.matrix(s[, actions$name])) >= 1))
})

test_that("heuristic solver (simple problem, single solution)", {
  # make data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p1 <- problem(projects, actions, features, "name", "success", "name", "cost",
                "name", FALSE) %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(verbose = FALSE)
  p2 <- problem(projects, actions, features, "name", "success", "name", "cost",
                "name", FALSE) %>%
       add_max_richness_objective(budget = 0.26) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(verbose = FALSE)
  # solve problem
  s1 <- solve(p1)
  s2 <- solve(p2)
  # tests
  ## s1
  expect_is(s1, "tbl_df")
  expect_equal(nrow(s1), 1L)
  expect_equal(s1$solution, 1L)
  expect_equal(s1$status, NA_character_)
  expect_equal(s1$obj, s1$F1 + s1$F2 + s1$F3)
  expect_equal(s1$cost, 0.1)
  expect_equal(s1$A1, 0)
  expect_equal(s1$A2, 1)
  expect_equal(s1$A3, 0)
  expect_equal(s1$A4, 1)
  expect_equal(s1$F1, 1 * 0.1)
  expect_equal(s1$F2, 0.96 * 0.92)
  expect_equal(s1$F3, 1 * 0.1)
  ## s2
  expect_is(s2, "tbl_df")
  expect_equal(nrow(s2), 1L)
  expect_equal(s2$solution, 1L)
  expect_equal(s2$status, NA_character_)
  expect_equal(s2$obj, s2$F1 + s2$F2 + s2$F3)
  expect_equal(s2$cost, 0.2)
  expect_equal(s2$A1, 1)
  expect_equal(s2$A2, 1)
  expect_equal(s2$A3, 0)
  expect_equal(s2$A4, 1)
  expect_equal(s2$F1, 0.95 * 0.91)
  expect_equal(s2$F2, 0.96 * 0.92)
  expect_equal(s2$F3, 1 * 0.1)
})

test_that("heuristic solver (shared actions, single solution)", {
  # make data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, TRUE, TRUE, FALSE),
                             A5 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4", "A5"),
                            cost =      c(0.10, 0.10, 0.15, 0.05, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(verbose = FALSE)
  # solve problem
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_equal(nrow(s), 1L)
  expect_equal(s$solution, 1L)
  expect_equal(s$status, NA_character_)
  expect_equal(s$obj, s$F1 + s$F2 + s$F3)
  expect_equal(s$cost, 0.1)
  expect_equal(s$A1, 1)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 0)
  expect_equal(s$A4, 0)
  expect_equal(s$A5, 1)
  expect_equal(s$F1, 0.95 * 0.91)
  expect_equal(s$F2, 1 * 0.1)
  expect_equal(s$F3, 1 * 0.1)
})

test_that("heuristic solver (shared actions, multiple solutions)", {
  # make data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, TRUE, TRUE, FALSE),
                             A5 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4", "A5"),
                            cost =      c(0.10, 0.10, 0.15, 0.05, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0.26) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(verbose = FALSE, number_solutions = 100)
  # solve problem
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_equal(nrow(s), 3L)
  expect_equal(s$solution, seq_len(3))
  expect_equal(s$status, rep(NA_character_, 3))
  expect_equal(s$obj, s$F1 + s$F2 + s$F3)
  expect_equal(s$cost, c(0.25, 0.1, 0))
  expect_equal(s$A1, c(1, 1, 0))
  expect_equal(s$A2, c(1, 0, 0))
  expect_equal(s$A3, c(0, 0, 0))
  expect_equal(s$A4, c(1, 0, 0))
  expect_equal(s$A5, c(1, 1, 1))
})

test_that("heuristic solver (locked constraints, multiple solutions)", {
  # make data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 100) %>%
       add_locked_in_constraints(1) %>%
       add_locked_out_constraints(2) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(number_solutions = 100)
  # solve problem
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_gt(nrow(s), 1)
  expect_true(all(s$obj <= ((0.95 * 0.91) + (0.94 * 0.8) + 0.100)))
  expect_true(all(s$cost <= 0.25))
  expect_equal(s$cost, (s$A1 * actions$cost[1]) +
                       (s$A2 * actions$cost[2]) +
                       (s$A3 * actions$cost[3]) +
                       (s$A4 * actions$cost[4]))
  expect_equal(s$status, rep(NA_character_, nrow(s)))
  expect_is(s$A1, "numeric")
  expect_true(all(s$A1 > 0.5))
  expect_is(s$A2, "numeric")
  expect_true(all(s$A2 < 0.5))
  expect_is(s$A3, "numeric")
  expect_is(s$A4, "numeric")
  expect_is(s$F1, "numeric")
  expect_is(s$F2, "numeric")
  expect_is(s$F3, "numeric")
  expect_true(all(rowSums(as.matrix(s[, actions$name])) >= 1))
})

test_that("heuristic solver (zero budget)", {
  # make data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(number_solutions = 100)
  # solve problem
  s <- solve(p)
  # tests
  expect_is(s, "tbl_df")
  expect_equal(nrow(s), 1)
  expect_equal(s$obj, 0.3)
  expect_equal(s$cost, 0)
  expect_equal(s$status, rep(NA_character_, nrow(s)))
  expect_equal(s$A1, 0)
  expect_equal(s$A2, 0)
  expect_equal(s$A3, 0)
  expect_equal(s$A4, 1)
})

test_that("heuristic solver (large problem, inc budgets)", {
  # make data
  set.seed(1000)
  sim_data <- simulate_ptm_data(number_projects = 70, number_actions = 30,
                                number_features = 40)
  projects <- sim_data$projects
  actions <- sim_data$actions
  features <- sim_data$features
  features$weight <- exp(runif(nrow(features), 1, 15))
  # solutions and tests
  for (p in seq(0, 1, length.out = 5)) {
    # generate solutions
    b <- sum(actions$cost) * p
    s <- problem(projects = projects, actions = actions, features = features,
                 "name", "success", "name", "cost", "name") %>%
         add_max_richness_objective(budget = b) %>%
         add_feature_weights("weight") %>%
         add_binary_decisions() %>%
         add_heuristic_solver(verbose = FALSE, number_solutions = 100) %>%
         solve()
    # tests
    expect_is(s, "tbl_df")
    expect_gte(nrow(s), 1)
    expect_equal(s$status, rep(NA_character_, nrow(s)))
    expect_true(all(s$cost <= b))
  }
})

test_that("heuristic solver (large problem, inc budgets, locked constraints)", {
  # make data
  set.seed(1000)
  sim_data <- simulate_ptm_data(number_projects = 70, number_actions = 30,
                                number_features = 40)
  projects <- sim_data$projects
  actions <- sim_data$actions
  features <- sim_data$features
  features$weight <- exp(runif(nrow(features), 1, 15))
  # solutions and tests
  for (p in seq(0.15, 1, length.out = 5)) {
    # generate solutions
    b <- sum(actions$cost) * p
    s <- problem(projects = projects, actions = actions, features = features,
                 "name", "success", "name", "cost", "name") %>%
         add_max_richness_objective(budget = b) %>%
         add_feature_weights("weight") %>%
         add_locked_in_constraints(c(1, 2, 3)) %>%
         add_locked_out_constraints(c(4, 5)) %>%
         add_binary_decisions() %>%
         add_heuristic_solver(verbose = FALSE, number_solutions = 100) %>%
         solve()
    # tests
    expect_is(s, "tbl_df")
    expect_gte(nrow(s), 1)
    expect_equal(s$status, rep(NA_character_, nrow(s)))
    expect_true(all(s$action_1 == 1))
    expect_true(all(s$action_2 == 1))
    expect_true(all(s$action_3 == 1))
    expect_true(all(s$action_4 == 0))
    expect_true(all(s$action_5 == 0))
    expect_true(all(s$cost <= b))
  }
})

test_that("heuristic solver (large problem, low budget)", {
  # make data
  set.seed(1000)
  sim_data <- simulate_ptm_data(number_projects = 70, number_actions = 30,
                                number_features = 40)
  projects <- sim_data$projects
  actions <- sim_data$actions
  features <- sim_data$features
  features$weight <- exp(runif(nrow(features), 1, 15))
  b <- sum(actions$cost) * 0.2
  # generate solutions
  s <- problem(projects = projects, actions = actions, features = features,
               "name", "success", "name", "cost", "name") %>%
       add_max_richness_objective(budget = b) %>%
       add_feature_weights("weight") %>%
       add_locked_in_constraints(c(1, 2, 3)) %>%
       add_locked_out_constraints(c(4, 5)) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(verbose = FALSE, number_solutions = 100) %>%
       solve()
  # tests
  expect_is(s, "tbl_df")
  expect_gt(nrow(s), 1)
  expect_equal(s$status, rep(NA_character_, nrow(s)))
  expect_true(all(s$action_1 == 1))
  expect_true(all(s$action_2 == 1))
  expect_true(all(s$action_3 == 1))
  expect_true(all(s$action_4 == 0))
  expect_true(all(s$action_5 == 0))
  expect_true(all(s$cost <= b))
})

test_that("invalid arguments", {
  data(sim_projects, sim_actions, sim_features)
  p <- problem(sim_projects, sim_actions, sim_features,
               "name", "success", "name", "cost", "name", FALSE)
  expect_error({
     add_max_richness_objective(p, NA_real_)
  })
  expect_error({
     add_max_richness_objective(p, c(1, 1))
  })
  expect_error({
     add_max_richness_objective(p, "a")
  })
  expect_error({
     add_max_richness_objective(p, TRUE)
  })
})

test_that("solution_statistics", {
  # create data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"),
                             weight = c(100, 4, 9))
  # create problem
  p <- problem(projects, actions, features, "name", "success", "name", "cost",
               "name", FALSE) %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_feature_weights("weight") %>%
       add_binary_decisions()
  # create solutions
  s <- data.frame(A1 = c(1, 0, 0, 1),
                  A2 = c(1, 1, 0, 1),
                  A3 = c(0, 0, 1, 1),
                  A4 = c(1, 1, 1, 1))
  # evaluate solutions
  ss <- solution_statistics(p, s)
  # tests
  expect_equal(ss$cost, c(0.1 + 0.1 + 0,
                          0.1 + 0,
                          0.15 + 0,
                          0.1 + 0.1 + 0.15 + 0))
  expect_equal(ss$obj, (ss$F1 * 100) + (ss$F2 * 4) + (ss$F3 * 9))
  expect_equal(ss$F1, c(0.95 * 0.91,
                        0.1 * 1,
                        0.94 * 0.8,
                        0.95 * 0.91))
  expect_equal(ss$F2, c(0.96 * 0.92,
                        0.96 * 0.92,
                        0.94 * 0.8,
                        0.96 * 0.92))
  expect_equal(ss$F3, c(0.1 * 1,
                        0.1 * 1,
                        0.1 * 1,
                        0.1 * 1))
})

test_that("heuristic solver (simple problem, single solution, no sweep)", {
  # make data
  projects <- tibble::tibble(name = c("P1", "P2", "P3", "P4"),
                             success =  c(0.95, 0.96, 0.94, 1.00),
                             F1 =       c(0.91, 0.00, 0.80, 0.10),
                             F2 =       c(0.00, 0.92, 0.80, 0.10),
                             F3 =       c(0.00, 0.00, 0.00, 0.10),
                             A1 =       c(TRUE, FALSE, FALSE, FALSE),
                             A2 =       c(FALSE, TRUE, FALSE, FALSE),
                             A3 =       c(FALSE, FALSE, TRUE, FALSE),
                             A4 =       c(FALSE, FALSE, FALSE, TRUE))
  actions <- tibble::tibble(name =      c("A1", "A2", "A3", "A4"),
                            cost =      c(0.10, 0.10, 0.15, 0))
  features <- tibble::tibble(name = c("F1", "F2", "F3"))
  # create problem
  p1 <- problem(projects, actions, features, "name", "success", "name", "cost",
                "name", FALSE) %>%
       add_max_richness_objective(budget = 0.16) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(initial_sweep = FALSE, verbose = FALSE)
  p2 <- problem(projects, actions, features, "name", "success", "name", "cost",
                "name", FALSE) %>%
       add_max_richness_objective(budget = 0.26) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(initial_sweep = FALSE, verbose = FALSE)
  # solve problem
  s1 <- solve(p1)
  s2 <- solve(p2)
  # tests
  ## s1
  expect_is(s1, "tbl_df")
  expect_equal(nrow(s1), 1L)
  expect_equal(s1$solution, 1L)
  expect_equal(s1$status, NA_character_)
  expect_equal(s1$obj, s1$F1 + s1$F2 + s1$F3)
  expect_equal(s1$cost, 0.1)
  expect_equal(s1$A1, 0)
  expect_equal(s1$A2, 1)
  expect_equal(s1$A3, 0)
  expect_equal(s1$A4, 1)
  expect_equal(s1$F1, 1 * 0.1)
  expect_equal(s1$F2, 0.96 * 0.92)
  expect_equal(s1$F3, 1 * 0.1)
  ## s2
  expect_is(s2, "tbl_df")
  expect_equal(nrow(s2), 1L)
  expect_equal(s2$solution, 1L)
  expect_equal(s2$status, NA_character_)
  expect_equal(s2$obj, s2$F1 + s2$F2 + s2$F3)
  expect_equal(s2$cost, 0.2)
  expect_equal(s2$A1, 1)
  expect_equal(s2$A2, 1)
  expect_equal(s2$A3, 0)
  expect_equal(s2$A4, 1)
  expect_equal(s2$F1, 0.95 * 0.91)
  expect_equal(s2$F2, 0.96 * 0.92)
  expect_equal(s2$F3, 1 * 0.1)
})

test_that("heuristic solver (large problem, low budget, no sweep)", {
  # make data
  set.seed(1000)
  sim_data <- simulate_ptm_data(number_projects = 70, number_actions = 30,
                                number_features = 40)
  projects <- sim_data$projects
  actions <- sim_data$actions
  features <- sim_data$features
  features$weight <- exp(runif(nrow(features), 1, 15))
  b <- sum(actions$cost) * 0.6
  # generate solutions
  s <- problem(projects = projects, actions = actions, features = features,
               "name", "success", "name", "cost", "name") %>%
       add_max_richness_objective(budget = b) %>%
       add_feature_weights("weight") %>%
       add_locked_in_constraints(c(1, 2, 3)) %>%
       add_locked_out_constraints(c(4, 5)) %>%
       add_binary_decisions() %>%
       add_heuristic_solver(initial_sweep = FALSE, verbose = FALSE,
                            number_solutions = 100) %>%
       solve()
  # tests
  expect_is(s, "tbl_df")
  expect_gt(nrow(s), 1)
  expect_equal(s$status, rep(NA_character_, nrow(s)))
  expect_true(all(s$action_1 == 1))
  expect_true(all(s$action_2 == 1))
  expect_true(all(s$action_3 == 1))
  expect_true(all(s$action_4 == 0))
  expect_true(all(s$action_5 == 0))
  expect_true(all(s$cost <= b))
})
