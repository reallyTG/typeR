context("scaleSpeciesvalues")

test_that("scaleSpeciesvalues: use",{
  skip_on_cran()
  x <- generate.Artificial.Data(n_species = 3, n_traits = 2, n_communities = 3,
                                occurence_distribution = 1,
                                average_richness = 1,
                                sd_richness = 1,
                                mechanism_random = FALSE)

  traitmatrix <- x$traits;
  traitmatrix$trait1 <- c(1,2,3)
  traitmatrix$trait2 <- c(2,3,4)

  v <- scaleSpeciesvalues(traitmatrix,n_traits = 2)
  expect_equal(
    v$trait1,
    c(-1,0,1),
    tolerance = 0.1
  )
  expect_equal(
    v$trait2,
    c(-1,0,1),
    tolerance = 0.1
  )
})

test_that("scaleSpeciesvaluess: abuse", {
  skip_on_cran()
  x1 <- c(1,2,3)
  x2 <- c(2,3,4)
  traitmatrix <- cbind(x1,x2)

  expect_error(
    scaleSpeciesvalues(traitmatrix,n_traits = 2),
    "incorrect trait matrix dimensions"
  )

  x <- generate.Artificial.Data(n_species = 3, n_traits = 2, n_communities = 3,
                                occurence_distribution = 1,
                                average_richness = 1,
                                sd_richness = 1,
                                mechanism_random = FALSE)

  traitmatrix <- x$traits;
  traitmatrix$trait1 <- c(1,1,2)
  traitmatrix$trait2 <- c(2,2,2)
  expect_error(
    scaleSpeciesvalues(traitmatrix,n_traits = 2),
    "one of your traits has no variation "
  )
})
