context("Testing scanonevar")

set.seed(27599)
test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(20, 5), eq.spacing = FALSE, include.x = FALSE),
                             n.ind = 200)
test.cross[['pheno']][['sex']] <- sample(x = c(0, 1),
                                         size = qtl::nind(test.cross),
                                         replace = TRUE)
test.cross[['pheno']][['sire']] <- factor(x = sample(x = 1:20,
                                                     size = qtl::nind(test.cross),
                                                     replace = TRUE))

test.cross <- qtl::calc.genoprob(cross = test.cross, step = 5)

sire_effects <- rnorm(n = 20)
test.cross[['pheno']][['phenotype']] <- sire_effects[test.cross[['pheno']][['sire']]] + rnorm(n = qtl::nind(test.cross))
test.cross[['pheno']][['count_pheno']] <- rpois(n = qtl::nind(object = test.cross), lambda = 5)

test_that(
  desc = 'testing scanonevar with dglm with gaussian model',
  code = {

    sov <- scanonevar(cross = test.cross,
                      mean.formula = phenotype ~ sex + mean.QTL.add + mean.QTL.dom,
                      var.formula = ~ sex + var.QTL.add + var.QTL.dom)

    # should be a scanonevar object
    expect_true(is.scanonevar(sov))

    # LODs should be positive
    expect_true(all(sov$result$mQTL.lod >= 0, na.rm = TRUE))
    expect_true(all(sov$result$vQTL.lod >= 0, na.rm = TRUE))
    expect_true(all(sov$result$mvQTL.lod >= 0, na.rm = TRUE))

    # joint lods should be pointwise higher than mean and variance lods
    expect_true(all(sov$result$mvQTL.lod >= sov$result$mQTL.lod, na.rm = TRUE))
    expect_true(all(sov$result$mvQTL.lod >= sov$result$vQTL.lod, na.rm = TRUE))


    x <- summary(object = sov, units = 'lod')

    # components of summary
    expect_true(all(c('mQTL', 'vQTL', 'mvQTL') %in% names(x)))

    # absolute maximum size of each component of summary is size of result
    expect_true(nrow(x$mQTL) <= nrow(sov$result))
    expect_true(nrow(x$vQTL) <= nrow(sov$result))
    expect_true(nrow(x$mvQTL) <= nrow(sov$result))

    # should be no randomness in summary -- recalculate it and it's the same
    expect_identical(object = x, expected = summary(object = sov, units = 'lod'))

  }
)


test_that(
  desc = 'testing conditional scanonevar with dglm with gaussian model',
  code = {

    sov <- scanonevar(cross = test.cross,
                      mean.formula = phenotype ~ sex + D1M2 + mean.QTL.add + mean.QTL.dom,
                      var.formula = ~ sex + D2M3 + var.QTL.add + var.QTL.dom)

    # should be a scanonevar object
    expect_true(is.scanonevar(sov))

    # joint lods should be pointwise higher than mean and variance lods
    expect_true(all(sov$result$mvQTL.lod >= sov$result$mQTL.lod, na.rm = TRUE))
    expect_true(all(sov$result$mvQTL.lod >= sov$result$vQTL.lod, na.rm = TRUE))


    x <- summary(object = sov, units = 'lod')

    # components of summary
    expect_true(all(c('mQTL', 'vQTL', 'mvQTL') %in% names(x)))

    # absolute maximum size of each component of summary is size of result
    expect_true(nrow(x$mQTL) <= nrow(sov$result))
    expect_true(nrow(x$vQTL) <= nrow(sov$result))
    expect_true(nrow(x$mvQTL) <= nrow(sov$result))

    # should be no randomness in summary -- recalculate it and it's the same
    expect_identical(object = x, expected = summary(object = sov, units = 'lod'))

  }
)



test_that(
  desc = 'testing scanonevar with dglm with poisson model',
  code = {

    sov <- scanonevar(cross = test.cross,
                      mean.formula = count_pheno ~ sex + mean.QTL.add + mean.QTL.dom,
                      var.formula = ~ sex + var.QTL.add + var.QTL.dom,
                      glm_family = 'poisson')

    # should be a scanonevar object
    expect_true(is.scanonevar(sov))

    # joint lods should be pointwise higher than mean and variance lods
    expect_true(all(sov$result$mvQTL.lod >= sov$result$mQTL.lod, na.rm = TRUE))
    expect_true(all(sov$result$mvQTL.lod >= sov$result$vQTL.lod, na.rm = TRUE))


    x <- summary(object = sov, units = 'lod')

    # components of summary
    expect_true(all(c('mQTL', 'vQTL', 'mvQTL') %in% names(x)))

    # absolute maximum size of each component of summary is size of result
    expect_true(nrow(x$mQTL) <= nrow(sov$result))
    expect_true(nrow(x$vQTL) <= nrow(sov$result))
    expect_true(nrow(x$mvQTL) <= nrow(sov$result))

    # should be no randomness in summary -- recalculate it and it's the same
    expect_identical(object = x, expected = summary(object = sov, units = 'lod'))

  }
)


test_that(
  desc = 'testing conditional scanonevar with dglm with poisson model',
  code = {

    sov <- scanonevar(cross = test.cross,
                      mean.formula = count_pheno ~ sex + D1M2 + mean.QTL.add + mean.QTL.dom,
                      var.formula = ~ sex + D2M3 + var.QTL.add + var.QTL.dom,
                      glm_family = 'poisson')

    # should be a scanonevar object
    expect_true(is.scanonevar(sov))

    # joint lods should be pointwise higher than mean and variance lods
    expect_true(all(sov$result$mvQTL.lod >= sov$result$mQTL.lod, na.rm = TRUE))
    expect_true(all(sov$result$mvQTL.lod >= sov$result$vQTL.lod, na.rm = TRUE))


    x <- summary(object = sov, units = 'lod')

    # components of summary
    expect_true(all(c('mQTL', 'vQTL', 'mvQTL') %in% names(x)))

    # absolute maximum size of each component of summary is size of result
    expect_true(nrow(x$mQTL) <= nrow(sov$result))
    expect_true(nrow(x$vQTL) <= nrow(sov$result))
    expect_true(nrow(x$mvQTL) <= nrow(sov$result))

    # should be no randomness in summary -- recalculate it and it's the same
    expect_identical(object = x, expected = summary(object = sov, units = 'lod'))

  }
)



# test_that(
#   desc = 'testing scanonevar with hglm',
#   code = {
#
#     sov <- scanonevar(cross = test.cross,
#                       mean.formula = phenotype ~ sex + (1|sire) + mean.QTL.add + mean.QTL.dom,
#                       var.formula = ~ sire + D2M3 + var.QTL.add + var.QTL.dom)
#
#     # should be a scanonevar object
#     expect_true(is.scanonevar(sov))
#
#     # joint lods should be pointwise higher than mean and variance lods
#     expect_true(all(sov$result$mvQTL.lod >= sov$result$mQTL.lod, na.rm = TRUE))
#     expect_true(all(sov$result$mvQTL.lod >= sov$result$vQTL.lod, na.rm = TRUE))
#
#
#     x <- summary(object = sov, units = 'lod')
#
#     # components of summary
#     expect_true(all(c('mQTL', 'vQTL', 'mvQTL') %in% names(x)))
#
#     # absolute maximum size of each component of summary is size of result
#     expect_true(nrow(x$mQTL) <= nrow(sov$result))
#     expect_true(nrow(x$vQTL) <= nrow(sov$result))
#     expect_true(nrow(x$mvQTL) <= nrow(sov$result))
#
#     # should be no randomness in summary -- recalculate it and it's the same
#     expect_identical(object = x, expected = summary(object = sov, units = 'lod'))
#
#   }
# )
#
