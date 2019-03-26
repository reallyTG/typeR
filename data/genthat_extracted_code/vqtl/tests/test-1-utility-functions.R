context("Testing utility functions")

test_that(
  desc = 'stats utils',
  code = {
    lm.fit <- stats::lm(formula = Sepal.Length ~ Species + Sepal.Width + Petal.Length,
                        data = iris)

    glm.fit <- stats::glm(formula = Sepal.Length ~ Species + Sepal.Width + Petal.Length,
                          data = iris)

    dglm.fit1 <- dglm::dglm(formula = Sepal.Length ~ Species + Sepal.Width,
                            dformula = ~ Species,
                            data = iris)
    dglm.fit2 <- dglm::dglm(formula = Sepal.Length ~ Species + Sepal.Width + Petal.Length,
                            dformula = ~ Species,
                            data = iris)
    dglm.fit3 <- dglm::dglm(formula = Sepal.Length ~ Species + Sepal.Width + Petal.Length,
                            dformula = ~ Species + Petal.Width,
                            data = iris)

    # all of these return NA because only two 'dglm' class objects are valid
    expect_true(object = is.na(LOD(alt = NA, null = NA)))
    expect_true(object = is.na(LOD(alt = NA, null = lm.fit)))
    expect_true(object = is.na(LOD(alt = NA, null = glm.fit)))
    expect_true(object = is.na(LOD(alt = lm.fit, null = NA)))
    expect_true(object = is.na(LOD(alt = glm.fit, null = NA)))
    expect_true(object = is.na(LOD(alt = NA, null = dglm.fit1)))
    expect_true(object = is.na(LOD(alt = dglm.fit1, null = NA)))

    # all of these should be positive because the null is nested within the alternative
    expect_gt(object = LOD(alt = dglm.fit2, null = dglm.fit1), expected = 0)
    expect_gt(object = LOD(alt = dglm.fit3, null = dglm.fit2), expected = 0)
    expect_gt(object = LOD(alt = dglm.fit3, null = dglm.fit1), expected = 0)
  }
)


test_that(
  desc = 'formulae utils',
  code = {
    expect_false(is.mean.formula(3))
    expect_false(is.mean.formula(~ x))
    expect_false(is.mean.formula(x + y ~ z))
    expect_true(is.mean.formula(x ~ 1))
    expect_true(is.mean.formula(x ~ y))

    expect_false(is.var.formula(3))
    expect_false(is.var.formula(x ~ y))
    expect_false(is.var.formula(x + y ~ z))
    expect_true(is.var.formula(~ x))
    expect_true(is.var.formula(~ x + y))


    expect_false(is.formulae(3))
    expect_false(is.formulae(list(mean.formula = 4, var.formula = 5)))
    expect_false(is.formulae(list(a = x ~ y, b = ~ z)))
    expect_true(is.formulae(list(mean.formula = x ~ y, var.formula = ~ z)))

    expect_error(make.formulae_(mean.formula = 3, var.formula = ~z))
    expect_error(make.formulae_(mean.formula = x ~ y, var.formula = 4))
    expect_true(is.formulae(make.formulae_(mean.formula = x ~ y, var.formula = ~ z)))


    # simulate cross for testing replace.markers.with.add.dom_
    test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(20, 5)))
    test.cross[['pheno']][['sex']] <- sample(x = c(0, 1),
                                             size = qtl::nind(test.cross),
                                             replace = TRUE)

    # formulae have one marker each and and no phenotype covars
    expect_equivalent(object = replace.markers.with.add.dom_(cross = test.cross,
                                                             mean.formula = phenotype ~ D1M1,
                                                             var.formula = ~ D1M4),
                      expected = list(mean.formula = phenotype ~ (D1M1_add + D1M1_dom),
                                      var.formula = ~ (D1M4_add + D1M4_dom)))

    # formulae have one marker each and a phenotype covar
    expect_equivalent(object = replace.markers.with.add.dom_(cross = test.cross,
                                                             mean.formula = phenotype ~ sex + D1M1,
                                                             var.formula = ~ sex + D1M4),
                      expected = list(mean.formula = phenotype ~ sex + (D1M1_add + D1M1_dom),
                                      var.formula = ~ sex + (D1M4_add + D1M4_dom)))

    # formulae have one marker each and a genetic marker already with an add/dom suffix
    expect_equivalent(object = replace.markers.with.add.dom_(cross = test.cross,
                                                             mean.formula = phenotype ~ D1M1 + D2M1_add,
                                                             var.formula = ~ D1M4 + D3M2_dom),
                      expected = list(mean.formula = phenotype ~ (D1M1_add + D1M1_dom) + D2M1_add,
                                      var.formula = ~ (D1M4_add + D1M4_dom) + D3M2_dom))

    # formulae have two genetic markers each
    expect_equivalent(object = replace.markers.with.add.dom_(cross = test.cross,
                                                             mean.formula = phenotype ~ D1M1 + D2M1,
                                                             var.formula = ~ D1M4 + D3M2),
                      expected = list(mean.formula = phenotype ~ D1M1_add + D1M1_dom + (D2M1_add + D2M1_dom),
                                      var.formula = ~ D1M4_add + D1M4_dom + (D3M2_add + D3M2_dom)))


    # formulae have one marker each and an interacting phenotype covar
    expect_equivalent(object = replace.markers.with.add.dom_(cross = test.cross,
                                                             mean.formula = phenotype ~ sex * D1M1,
                                                             var.formula = ~ sex * D1M4),
                      expected = list(mean.formula = phenotype ~ sex + (D1M1_add + D1M1_dom) + sex:(D1M1_add + D1M1_dom),
                                      var.formula = ~ sex + (D1M4_add + D1M4_dom) + sex:(D1M4_add + D1M4_dom)))

    # formulae have one marker each and an interacting genetic marker already with an add/dom suffix
    expect_equivalent(object = replace.markers.with.add.dom_(cross = test.cross,
                                                             mean.formula = phenotype ~ D1M1 * D2M1_add,
                                                             var.formula = ~ D1M4 * D3M2_dom),
                      expected = list(mean.formula = phenotype ~ (D1M1_add + D1M1_dom) + D2M1_add + (D1M1_add + D1M1_dom):D2M1_add,
                                      var.formula = ~ (D1M4_add + D1M4_dom) + D3M2_dom + (D1M4_add + D1M4_dom):D3M2_dom))

    # formulae have two genetic markers each
    expect_equivalent(object = replace.markers.with.add.dom_(cross = test.cross,
                                                             mean.formula = phenotype ~ D1M1 * D2M1,
                                                             var.formula = ~ D1M4 * D3M2),
                      expected = list(mean.formula = phenotype ~ D1M1_add + D1M1_dom + (D2M1_add + D2M1_dom) + D1M1_add:(D2M1_add + D2M1_dom) + D1M1_dom:(D2M1_add + D2M1_dom),
                                      var.formula = ~ D1M4_add + D1M4_dom + (D3M2_add + D3M2_dom) + D1M4_add:(D3M2_add + D3M2_dom) + D1M4_dom:(D3M2_add + D3M2_dom)))




    expect_equivalent(object = remove.qtl.terms_(formulae = make.formulae_(mean.formula = x ~ y,
                                                                           var.formula = ~ z)),
                      expected = make.formulae_(mean.formula = x ~ y,
                                                var.formula = ~ z))

    expect_equivalent(object = remove.qtl.terms_(formulae = make.formulae_(mean.formula = x ~ y + mean.QTL.add,
                                                                           var.formula = ~ z + var.QTL.add)),
                      expected = make.formulae_(mean.formula = x ~ y,
                                                var.formula = ~ z))

    expect_equivalent(object = remove.qtl.terms_(formulae = make.formulae_(mean.formula = x ~ y + mean.QTL.dom,
                                                                           var.formula = ~ z + var.QTL.dom)),
                      expected = make.formulae_(mean.formula = x ~ y,
                                                var.formula = ~ z))

    expect_equivalent(object = remove.qtl.terms_(formulae = make.formulae_(mean.formula = x ~ mean.QTL.dom,
                                                                           var.formula = ~ var.QTL.dom)),
                      expected = make.formulae_(mean.formula = x ~ 1,
                                                var.formula = ~ 1))

  }
)


test_that(
  desc = 'genetic data utils',
  code = {
    test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(20, 5)))
    test.cross <- qtl::calc.genoprob(cross = test.cross, step = 5)

    loc.info <- wrangle.loc.info.df_(cross = test.cross)
    expect_identical(object = names(loc.info), expected = c('chr.type', 'chr', 'loc.name', 'pos'))
    expect_identical(object = unique(loc.info[['chr']]), expected = qtl::chrnames(test.cross))
    expect_true(object = all(loc.info[['pos']] >= 0))
    expect_true(object = all(loc.info[['pos']] <= 20))

    loc.info2 <- wrangle.loc.info.df_(cross = test.cross, chrs = c('1', '3', 'X'))
    expect_identical(object = names(loc.info2), expected = c('chr.type', 'chr', 'loc.name', 'pos'))
    expect_identical(object = unique(loc.info2[['chr']]), expected = c('1', '3', 'X'))
    expect_true(object = all(loc.info2[['pos']] >= 0))
    expect_true(object = all(loc.info2[['pos']] <= 20))
    expect_true(object = nrow(loc.info2) < nrow(loc.info))


    genoprobs <- wrangle.genoprob.df_(cross = test.cross)

    expect_identical(object = names(genoprobs), expected = c('iid', 'loc.name', 'allele', 'genoprob'))
    expect_identical(object = unique(genoprobs[['iid']]), expected = paste0('org', stringr::str_pad(string = 1:100, width = 3, pad = '0')))
    expect_identical(object = unique(genoprobs[['allele']]), expected = c('AA', 'AB', 'BB', 'g1', 'g2'))
    expect_true(object = all(genoprobs[['genoprob']] > 0))
    expect_true(object = all(genoprobs[['genoprob']] < 1))
    expect_true(object = all(colnames(qtl::pull.geno(cross = test.cross)) %in% unique(genoprobs[['loc.name']])))


    # response.df <- make.response.model.df_(cross = test.cross,
    #                                        formulae = make.formulae_(mean.formula = phenotype ~ apple,
    #                                                                  var.formula = ~ banana))
    # expect_identical(object = names(response.df), expected = 'phenotype')
    # expect_identical(object = nrow(response.df), expected = 100L)
    # expect_identical(object = response.df[['phenotype']],
    #                  expected = qtl::pull.pheno(cross = test.cross, pheno.col = 'phenotype'))


    # make.qtl.covar.model.df_(cross = test.cross,
    #                          formulae = make.formulae_(mean.formula = phenotype ~ apple,
    #                                                    var.formula = ~ banana))


    # more

  }
)


test_that(
  desc = 'validation utils',
  code = {
    expect_true(TRUE)
  }
)