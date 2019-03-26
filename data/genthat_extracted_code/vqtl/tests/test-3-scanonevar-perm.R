context("Testing scanonevar.perm")

set.seed(27599)


test_that(
  desc = 'testing all aspects of scanonevar.perm in one block',
  # would like to calculate run the scanonevar.perm's outside a test_that block
  # so that I could test them in various ways,
  # but can't use skip_on_cran() out there so would have to compute them anew
  # for each type of test
  code = {

    skip_on_cran()
    skip_on_travis()

    test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(40, 5), n.mar = 10, eq.spacing = TRUE, include.x = FALSE),
                                 n.ind = 300,
                                 type = 'f2')
    test.cross <- qtl::calc.genoprob(cross = test.cross, step = 5)

    test.cross[['pheno']][['sex']] <- sample(x = c(0, 1),
                                             size = qtl::nind(test.cross),
                                             replace = TRUE)
    test.cross[['pheno']][['phenotype1']] <- rnorm(n = qtl::nind(test.cross))
    test.cross[['pheno']][['phenotype2']] <- rnorm(n = qtl::nind(test.cross), mean = 0.3*test.cross$geno$`2`$data[,3])
    test.cross[['pheno']][['phenotype4']] <- rnorm(n = qtl::nind(test.cross),
                                                   mean = test.cross$pheno$sex + test.cross$geno$`2`$data[,3],
                                                   sd = exp(test.cross$pheno$sex + test.cross$geno$`3`$data[,3]))


    x <- scanonevar(cross = test.cross,
                    mean.formula = phenotype2 ~ sex + D1M2 + mean.QTL.add + mean.QTL.dom,
                    var.formula = ~ sex + D2M3 + var.QTL.add + var.QTL.dom)

    y1a <- scanonevar.perm(sov = x, n.perms = 10, random.seed = 27599, silent = FALSE)
    y1b <- scanonevar.perm(sov = x, n.perms = 10, random.seed = 27599, silent = FALSE)
    y1c <- scanonevar.perm(sov = x, n.perms = 10, random.seed = 27599, n.cores = 2, silent = FALSE)
    y1d <- scanonevar.perm(sov = x, n.perms = 10, random.seed = 27599, n.cores = 2, silent = FALSE)

    # all the results should be scanones
    expect_true(is.scanonevar(y1a))
    expect_true(is.scanonevar(y1b))
    expect_true(is.scanonevar(y1c))
    expect_true(is.scanonevar(y1d))

    # perms done with the same number of cores should be identical
    expect_true(identical(y1a$perms, y1b$perms))
    expect_true(identical(y1c$perms, y1d$perms))


    # it should not be the case that all the perms of a give type are the same
    all.lod.maxes.same <- function(sov, type) {
      max.lods <- sov$perms %>% dplyr::filter(test == type) %>% .[['max.lod']]
      return(min(max.lods, na.rm = TRUE) == max(max.lods, na.rm = TRUE))
    }

    expect_false(all.lod.maxes.same(sov = y1a, 'mQTL'))
    expect_false(all.lod.maxes.same(sov = y1a, 'vQTL'))
    expect_false(all.lod.maxes.same(sov = y1a, 'mvQTL'))

    expect_false(all.lod.maxes.same(sov = y1c, 'mQTL'))
    expect_false(all.lod.maxes.same(sov = y1c, 'vQTL'))
    expect_false(all.lod.maxes.same(sov = y1c, 'mvQTL'))


    expect_true(is.scanonevar(c(y1a, y1b)))
    expect_true(is.scanonevar(c(y1a, y1c)))
    expect_true(is.scanonevar(c(y1a, y1d)))

    expect_true(is.scanonevar(c(y1c, y1a)))
    expect_true(is.scanonevar(c(y1c, y1b)))
    expect_true(is.scanonevar(c(y1c, y1d)))


    a <- summary(object = y1a, units = 'empir.p')
    b <- summary(object = y1b, units = 'empir.p')
    c <- summary(object = y1c, units = 'empir.p')
    d <- summary(object = y1d, units = 'empir.p')

    # summaries should be the same if the objects are the same
    expect_identical(object = a, expected = b)
    expect_identical(object = d, expected = d)

    # components of summary
    expect_true(all(c("mQTL", "vQTL", "mvQTL") %in% names(a)))
    expect_true(all(c("mQTL", "vQTL", "mvQTL") %in% names(c)))

    # size of summary
    expect_true(nrow(a$mQTL) <= nrow(y1a$result))
    expect_true(nrow(a$vQTL) <= nrow(y1a$result))
    expect_true(nrow(a$mvQTL) <= nrow(y1a$result))

    expect_true(nrow(c$mQTL) <= nrow(y1c$result))
    expect_true(nrow(c$vQTL) <= nrow(y1c$result))
    expect_true(nrow(c$mvQTL) <= nrow(y1c$result))

  }
)