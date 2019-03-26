## define functions
# calculate distance matrix
calcDists <- function(x, method = "euclidean") {
  switch(method,
    "canberra" = {
      dists <- matrix(NA, nrow = nrow(x), ncol = nrow(x))
      for (i in seq_len(nrow(x)))
        for (j in seq_len(nrow(x)))
        dists[i, j] <- sum( (abs(x[i, ] - x[j, ])) /
                            (abs(x[i, ]) + abs(x[j, ])))
      return(dists)
    },
    "minkowski" = {
      dists <- matrix(NA, nrow = nrow(x), ncol = nrow(x))
      for (i in seq_len(nrow(x)))
        for (j in seq_len(nrow(x)))
        dists[i, j] <- sum(abs(x[i, ] - x[j, ]) ^ ncol(x))
      return(dists ^ (1 / ncol(x)))
    },
    "mahalanobis" = {
      x <- apply(x, 2, function(x) x - mean(x))
      cov_mat <- var(x)
      dists <- matrix(NA, nrow = nrow(x), ncol = nrow(x))
      for (i in seq_len(nrow(x)))
        for (j in seq_len(nrow(x)))
        dists[i, j] <- sqrt(mahalanobis(x[i,, drop = FALSE],
                                        x[j,, drop = FALSE],
                                        cov = cov_mat, inverted = FALSE))
      return(dists)
    },
    "total_sums_of_squares" = {
      dists <- matrix(NA, nrow = nrow(x), ncol = nrow(x))
      for (i in seq_len(nrow(x)))
        for (j in seq_len(nrow(x)))
          dists[i,j] <- sum( (x[i, ] - x[j, ]) ^ 2)
      return(dists)
    },
    {
      return(unname(as.matrix(vegan::vegdist(x, method = method))))
    }
  )
}

# calculate amount.held
calcAmountHeld <- function(x, species, solution = NULL) {
  curr_df <- x@pu.species.probabilities[which(
    x@pu.species.probabilities[[1]] == species), ]
  if (is.null(solution))
    solution <- curr_df$pu
  curr_df$area <- x@pu$area[curr_df$pu]
  curr_df$benefit <- curr_df[[3]] * curr_df[[4]]
  # calculate metrics
  curr_max <- sum(curr_df$benefit)
  curr_amount <- sum(curr_df$benefit[curr_df$pu %in% solution])
  return(curr_amount / curr_max)
}

# calculate unreliable space.held
calcUnreliableSpaceHeld <- function(w, pus) {
  sum(apply(w[, pus, drop = FALSE], 1, min))
}

# calculate reliable space.held
calcReliableSpaceHeld <- function(w, p, maxr, pus) {
  ### init
  # set maxr
  maxr <- min(length(pus), maxr)
  value <- 0
  ### main proc
  for (k in seq_len(nrow(w))) {
    ## init
    # get sorted ids
    curr_pus <- pus[order(w[k, pus])]
    # set initial values
    curr_prob <- 1
    curr_value <- 0
    ## main
    # real pus
    for (r in seq_len(maxr)) {
      curr_value <- curr_value + (p[curr_pus[r]] * curr_prob *
                                  w[k, curr_pus[r]])
      curr_prob <- curr_prob * (1 - p[curr_pus[r]])
    }
    # failure pu
    curr_value <- curr_value + (curr_prob * w[k, ncol(w)])
    # update value
    value <- value + curr_value
  }
  # return value
  return(value)
}

# calculate unreliable distance metrics
calcUnreliableMetrics <- function(x, space, species, solution = NULL) {
  # extract valid pus
  curr_df <- x@pu.species.probabilities[which(
    x@pu.species.probabilities[[1]] == species), ]
  pu_pts <- x@attribute.spaces[[space]]@spaces[[species]]@
              planning.unit.points@coords
  pu_pts <- pu_pts[match(x@attribute.spaces[[space]]@spaces[[species]]@
                           planning.unit.points@ids,
                         curr_df$pu), ]
  # calculate distances
  pts <- rbind(pu_pts,
               apply(x@attribute.spaces[[space]]@spaces[[species]]@
                       demand.points@coords, 2, mean),
               x@attribute.spaces[[space]]@spaces[[species]]@demand.points@
                 coords)
  dists <- calcDists(pts, method = "total_sums_of_squares")
  wdist_mtx <- dists[nrow(pu_pts) + 1 +
                       seq_len(nrow(x@attribute.spaces[[space]]@
                       spaces[[species]]@demand.points@coords)),
                     seq_len(nrow(pu_pts))]
  wdist_mtx <- ( (wdist_mtx * matrix(
    rep(x@attribute.spaces[[space]]@spaces[[species]]@demand.points@weights,
        each = nrow(pu_pts)),
    byrow = TRUE, ncol = ncol(wdist_mtx), nrow = nrow(wdist_mtx))))
  # caclulate tss
  tss_mtx <- dists[
    nrow(pu_pts) + 1 + seq_len(nrow(x@attribute.spaces[[space]]@
                                      spaces[[species]]@demand.points@coords)),
    nrow(pu_pts) + 1]
  tss_mtx <- ( (tss_mtx * x@attribute.spaces[[space]]@spaces[[species]]@
                            demand.points@weights))
  # set defaults solution to include all plannnig units if no solution specified
  if (is.null(solution)) {
    solution <- seq_len(nrow(x@pu))
  }
  # calculate relative positions of pus
  relative_solution <- na.omit(match(solution,
    x@attribute.spaces[[space]]@spaces[[species]]@planning.unit.points@ids
  ))
  spaceheld <- calcUnreliableSpaceHeld(wdist_mtx, relative_solution)
  # exports
  list(wdist = wdist_mtx, tss = sum(tss_mtx), spaceheld = spaceheld,
       prop = 1 - (spaceheld / sum(tss_mtx)))
}

# generate reliable wdist matrix
calcReliableMetrics <- function(x, species, space, opts, solution = NULL) {
  ## init
  # extract coordinates
  curr_df <- x@pu.species.probabilities[which(
    x@pu.species.probabilities[[1]] == species), ]
  pu_pts <- x@attribute.spaces[[space]]@spaces[[species]]@
              planning.unit.points@coords
  dp_pts <- x@attribute.spaces[[space]]@spaces[[species]]@demand.points@coords
  dp_wts <- x@attribute.spaces[[space]]@spaces[[species]]@demand.points@weights
  # merge into single matrix
  pts <- rbind(pu_pts,
    apply(x@attribute.spaces[[space]]@spaces[[species]]@demand.points@coords,
          2, mean),
    x@attribute.spaces[[space]]@spaces[[species]]@demand.points@coords)
  ## wdist
  # calculate raw distances
  dists <- calcDists(pts, method = "total_sums_of_squares")
  wdist_mtx <- dists[
    nrow(pu_pts) + 1 + seq_len(nrow(x@attribute.spaces[[space]]@
                                      spaces[[species]]@demand.points@coords)),
    seq_len(nrow(pu_pts))]
  # scale + pad distances
  dp_wts_mtx <- matrix(rep(dp_wts, each = nrow(pu_pts)), byrow = TRUE,
                       ncol = nrow(pu_pts), nrow = length(dp_wts))
  wdist_mtx <- (wdist_mtx * dp_wts_mtx)
  # include failure pu
  wdist_mtx <- cbind(wdist_mtx, max(wdist_mtx) * opts@failure.multiplier)
  ## tss
  tss_mtx <- dists[
    nrow(pu_pts) + 1 + seq_len(nrow(x@attribute.spaces[[space]]@
                                      spaces[[species]]@demand.points@coords)),
    nrow(pu_pts) + 1
  ]
  tss_mtx <- (tss_mtx * dp_wts)
  # set default solution as all planning units if non-supplied
  if (is.null(solution)) {
    solution <- seq_len(nrow(x@pu))
  }
  # calculate relative positions of pus
  relative_solution <- na.omit(match(
    solution,
    x@attribute.spaces[[space]]@spaces[[species]]@planning.unit.points@ids))
  relative_probabilities <- na.omit(curr_df$value[match(
    curr_df$pu,
    x@attribute.spaces[[space]]@spaces[[species]]@planning.unit.points@ids)])

  ## calculate metrics
  spaceheld <- calcReliableSpaceHeld(wdist_mtx, relative_probabilities,
                                     opts@max.r.level, relative_solution)
  ## exports
  list(wdist = wdist_mtx, tss = sum(tss_mtx), spaceheld = spaceheld,
       prop = 1 - (spaceheld / sum(tss_mtx)))
}

# run all unreliable checks on RapSolved object
runUnreliableChecks <- function(x) {
  expect_true(all(round(c(amount.held(x)), 5) >= round(c(amount.target(x)), 5)))
  expect_true(all(c(space.held(x)) >= c(space.target(x))))
  ## check that amount.held is correct
  for (r in seq_len(nrow(summary(x)))) {
    pu_ids <- which(as.logical(x@results@selections[r, ]))
    for (i in seq_along(x@data@species$name)) {
      expect_equal(round(calcAmountHeld(x@data, species = i,
                                        solution = pu_ids), 5),
                   round(amount.held(x, y = r, species = i)[[1]], 5))
    }
  }
  ## check that space.held is correct
  # run tests
  for (r in seq_len(nrow(summary(x)))) {
    pu_ids <- which(as.logical(x@results@selections[r, ]))
    for (j in seq_along(x@data@attribute.spaces)) {
      for (i in seq_along(x@data@attribute.spaces[[j]]@spaces)) {
        # tests
        R_eval <- round(calcUnreliableMetrics(x@data, species = i, space = j,
                                              solution = pu_ids)$prop, 5)
        cpp_eval <- round(space.held(x, y = r, species = i, space = j)[1], 5)
        expect_equal(R_eval, cpp_eval)
      }
    }
  }
}

# run all reliable checks on RapSolved object
runReliableChecks <- function(x) {
  expect_true(all(round(c(amount.held(x)), 5) >= round(c(amount.target(x)), 5)))
  expect_true(all(c(space.held(x)) >= c(space.target(x))))
  # check that amount.held is correct
  for (r in seq_len(nrow(summary(x)))) {
    pu_ids <- which(as.logical(x@results@selections[r, ]))
    for (i in seq_along(x@data@species$name)) {
      R_eval <- round(calcAmountHeld(x@data, species = i, solution = pu_ids), 5)
      cpp_eval <- round(amount.held(x, y = r, species = i)[[1]], 5)
      expect_equal(R_eval, cpp_eval)
    }
  }
  ## check that space.held is correct
  # run tests
  for (r in seq_len(nrow(summary(x)))) {
    pu_ids <- which(as.logical(x@results@selections[r, ]))
    for (j in seq_along(x@data@attribute.spaces)) {
      for (i in seq_along(x@data@attribute.spaces[[j]]@spaces)) {
        # tests
        R_eval <- round(calcReliableMetrics(x@data, species = i, space = j,
                                            x@opts, solution = pu_ids)$prop, 5)
        cpp_eval <- round(space.held(x, y = r, species = i, space = j)[1], 5)
        expect_equal(R_eval, cpp_eval)
      }
    }
  }
}
