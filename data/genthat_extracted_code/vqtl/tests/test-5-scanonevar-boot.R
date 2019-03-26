context("Testing scanonevar.boot")

test_that(
  desc = 'testing scanonevar.boot with dglm with gaussian model',
  code = {

    skip_on_cran()
    skip_on_travis()

    set.seed(27599)
    test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(40, 3),
                                                    n.mar = 10,
                                                    eq.spacing = FALSE,
                                                    include.x = FALSE),
                                 n.ind = 500)
    test.cross[['pheno']][['sex']] <- sample(x = c(0, 1),
                                             size = qtl::nind(test.cross),
                                             replace = TRUE)
    test.cross[['pheno']][['sire']] <- factor(x = sample(x = 1:20,
                                                         size = qtl::nind(test.cross),
                                                         replace = TRUE))

    test.cross <- qtl::calc.genoprob(cross = test.cross, step = 3)

    test.cross[['pheno']][['phenotype']] <-rnorm(n = qtl::nind(test.cross),
                                                 mean = 0.5*test.cross$geno$`1`$data[,4])


    sov <- vqtl::scanonevar(cross = test.cross,
                            mean.formula = phenotype ~ sex + mean.QTL.add + mean.QTL.dom,
                            var.formula = ~ sex + var.QTL.add + var.QTL.dom)

    bs <- vqtl::scanonevar.boot(sov = sov, n.resamples = 20, chr = 1, qtl_type = 'mQTL')
    bs_multicore <- vqtl::scanonevar.boot(sov = sov, n.resamples = 20, chr = 1, qtl_type = 'mQTL', n.cores = 2)

    expect_equal(object = length(bs$bootstrap_maxes), expected = 20)
    expect_true(object = all(bs$bootstrap_maxes >= 0))
    expect_true(object = all(bs$bootstrap_maxes <= 40))

    expect_equal(object = length(bs_multicore$bootstrap_maxes), expected = 20)
    expect_true(object = all(bs_multicore$bootstrap_maxes >= 0))
    expect_true(object = all(bs_multicore$bootstrap_maxes <= 40))


    bs <- vqtl::scanonevar.boot(sov = sov, n.resamples = 20, chr = 1, qtl_type = 'vQTL')

    expect_equal(object = length(bs$bootstrap_maxes), expected = 20)
    expect_true(object = all(bs$bootstrap_maxes >= 0))
    expect_true(object = all(bs$bootstrap_maxes <= 40))
  }
)