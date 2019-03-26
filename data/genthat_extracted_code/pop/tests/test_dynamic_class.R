context('dynamic-class')

test_that('dynamic classes work', {

  # generate four types of dynamic
  stasis_egg <- tr(egg ~ egg, p(0.4))
  stasis_larva <- tr(larva ~ larva, p(0.3))
  stasis_adult <- tr(adult ~ adult, p(0.8))
  hatching <- tr(larva ~ egg, p(0.5))
  fecundity <- tr(egg ~ adult, p(0.2) * r(3))
  pupation <- tr(adult ~ larva, p(0.2))
  clonal <- tr(larva ~ larva, r(1.4))

  stasis <- dynamic(stasis_egg,
                    stasis_larva,
                    stasis_adult)
  growth <- dynamic(hatching,
                    pupation)
  reproduction <- dynamic(fecundity,
                          clonal)
  all1 <- dynamic(stasis_egg,
                  stasis_larva,
                  stasis_adult,
                  hatching,
                  pupation,
                  fecundity,
                  clonal)

  # make sure adding dynamics is the same as compiling their transitions in
  # one go
  all2 <- dynamic(stasis, growth, reproduction)
  expect_equal(all2, all1)

  # check 3 trs, then two dynamics
  all3 <- dynamic(stasis_egg,
                  stasis_larva,
                  stasis_adult,
                  growth,
                  reproduction)
  expect_equal(all3, all1)

  # check dynamic sandwich
  all4 <- dynamic(stasis_egg,
                  stasis_larva,
                  stasis_adult,
                  growth,
                  fecundity,
                  clonal)
  expect_equal(all4, all1)

  # check only one dynamic
  growth2 <- dynamic(growth)
  expect_equal(growth2, growth)


  # check they have the right class
  expect_s3_class(stasis, 'dynamic')
  expect_s3_class(growth, 'dynamic')
  expect_s3_class(reproduction, 'dynamic')
  expect_s3_class(all1, 'dynamic')
  expect_s3_class(all2, 'dynamic')

  # check is.dynamic works on dynamics
  expect_true(is.dynamic(stasis))
  expect_true(is.dynamic(growth))
  expect_true(is.dynamic(reproduction))
  expect_true(is.dynamic(all1))
  expect_true(is.dynamic(all2))

  # check is.dynamic works on non-dynamics
  expect_false(is.dynamic(list()))
  expect_false(is.dynamic(NA))
  expect_false(is.dynamic(NULL))

  # check is.dynamic works on transitions
  expect_false(is.dynamic(stasis_egg))
  expect_false(is.dynamic(fecundity))

  # check as.dynamic works
  obj1 <- pop:::as.dynamic(list())
  obj2 <- pop:::as.dynamic(NA)
  obj3 <- pop:::as.dynamic(Inf)
  expect_s3_class(obj1, 'dynamic')
  expect_s3_class(obj2, 'dynamic')
  expect_s3_class(obj3, 'dynamic')

  # check print.dynamic works
  expect_equal(capture.output(print(all1)),
               'dynamic:	transitions between: egg, larva, adult')
  expect_equal(capture.output(print(reproduction)),
               'dynamic:	transitions between: egg, adult, larva')

  # check as.matrix
  mat_stasis <- as.matrix(stasis)
  mat_growth <- as.matrix(growth)
  mat_reproduction <- as.matrix(reproduction)
  mat_all1 <- as.matrix(all1)
  mat_all2 <- as.matrix(all2)

  # check classes
  expect_s3_class(mat_stasis, c('matrix', 'transition_matrix'))
  expect_s3_class(mat_growth, c('matrix', 'transition_matrix'))
  expect_s3_class(mat_reproduction, c('matrix', 'transition_matrix'))
  expect_s3_class(mat_all1, c('matrix', 'transition_matrix'))
  expect_s3_class(mat_all2, c('matrix', 'transition_matrix'))

  # check dimensions are correct
  expect_equal(dim(mat_stasis), c(3, 3))
  expect_equal(dim(mat_growth), c(3, 3))
  expect_equal(dim(mat_reproduction), c(3, 3))
  expect_equal(dim(mat_all1), c(3, 3))
  expect_equal(dim(mat_all2), c(3, 3))

  # check all1 and all2 are still the same even as matrices
  expect_equal(mat_all1, mat_all2)

  # compute F, P and R matrics and make sure they return something sensible
  mat_all1_F <- as.matrix(all1, which = 'F')
  mat_all2_F <- as.matrix(all2, which = 'F')
  mat_all1_P <- as.matrix(all1, which = 'P')
  mat_all2_P <- as.matrix(all2, which = 'P')
  mat_all1_R <- as.matrix(all1, which = 'R')
  mat_all2_R <- as.matrix(all2, which = 'R')

  # check classes
  expect_s3_class(mat_all1_F, c('matrix', 'transition_matrix'))
  expect_s3_class(mat_all2_F, c('matrix', 'transition_matrix'))
  expect_s3_class(mat_all1_P, c('matrix', 'transition_matrix'))
  expect_s3_class(mat_all2_P, c('matrix', 'transition_matrix'))
  expect_s3_class(mat_all1_R, c('matrix', 'transition_matrix'))
  expect_s3_class(mat_all2_R, c('matrix', 'transition_matrix'))

  # check dimensions are correct
  expect_equal(dim(mat_all1_F), c(3, 3))
  expect_equal(dim(mat_all2_F), c(3, 3))
  expect_equal(dim(mat_all1_P), c(3, 3))
  expect_equal(dim(mat_all2_P), c(3, 3))
  expect_equal(dim(mat_all1_R), c(3, 3))
  expect_equal(dim(mat_all2_R), c(3, 3))


  # check that plot returns an igraph object
  plot_stasis <- plot(stasis)
  plot_growth <- plot(growth)
  plot_reproduction <- plot(reproduction)
  plot_all1 <- plot(all1)
  plot_all2 <- plot(all2)
  expect_s3_class(plot_stasis, 'igraph')
  expect_s3_class(plot_growth, 'igraph')
  expect_s3_class(plot_reproduction, 'igraph')
  expect_s3_class(plot_all1, 'igraph')
  expect_s3_class(plot_all2, 'igraph')

  # get parameters of a dynamic
  expected_param_all <- list(stasis_egg = list(p = 0.4),
                             stasis_larva = list(p = 0.3),
                             stasis_adult = list(p = 0.8),
                             hatching = list(p = 0.5),
                             pupation = list(p = 0.2),
                             fecundity = list(p = 0.2, r = 3),
                             clonal = list(r = 1.4))

  # check they're as expected in both dynamic creation methods
  expect_equal(parameters(all1), expected_param_all)
  expect_equal(parameters(all2), expected_param_all)

  # update them & check it comes through
  expected_param_all_updated <- expected_param_all
  expected_param_all_updated$fecundity$p <- 0.5
  parameters(all1) <- expected_param_all_updated
  expect_equal(parameters(all1), expected_param_all_updated)

  # ~~~~~~~~~~
  # test multi-patch models run and can be analysed in the same way

  # pick a dynamic and give it lots of patches
  all <- all1
  ls <- landscape(all)
  n <- 10
  ls_new <- as.landscape(list(coordinates = data.frame(x = runif(n),
                                                       y = runif(n)),
                              area = area(ls),
                              population = population(ls),
                              features = features(ls)))
  landscape(all) <- ls_new

  # see what happens when we make a matrix
  mat <- as.matrix(all)
  expect_true(is.matrix(mat))
  expect_equal(dim(mat), rep(n * 3, 2))

  # add dispersal into the dynamic
  adult_dispersal <- tr(adult ~ adult, p(0.5) * d(3))
  all_disp <- dynamic(all,
                      adult_dispersal)
  landscape(all_disp) <- ls_new


  # check plotting
  plot_all_disp <- plot(all_disp)

  # convert to matrices
  mat_disp <- as.matrix(all_disp)
  matA_disp <- as.matrix(all_disp, which = 'A')
  matP_disp <- as.matrix(all_disp, which = 'P')
  matF_disp <- as.matrix(all_disp, which = 'F')
  matR_disp <- as.matrix(all_disp, which = 'R')

  # check classes
  expect_s3_class(mat_disp, c('matrix', 'transition_matrix'))
  expect_s3_class(matA_disp, c('matrix', 'transition_matrix'))
  expect_s3_class(matP_disp, c('matrix', 'transition_matrix'))
  expect_s3_class(matF_disp, c('matrix', 'transition_matrix'))
  expect_s3_class(matR_disp, c('matrix', 'transition_matrix'))

  # check dimensions are correct
  expect_equal(dim(mat_disp), c(30, 30))
  expect_equal(dim(matA_disp), c(30, 30))
  expect_equal(dim(matP_disp), c(30, 30))
  expect_equal(dim(matF_disp), c(30, 30))
  expect_equal(dim(matR_disp), c(30, 30))

  # check there are/aren't 0s where there should/shouldn't be
  idx <- seq(0, 30, by = 3)[-1]
  cells <- as.matrix(expand.grid(idx, idx))
  expect_true(all(matA_disp[cells] > 0))
  expect_true(all(matP_disp[cells] > 0))
  expect_true(all(matF_disp[cells] == 0))

  # # make sure projection works for dispersals
  # proj <- projection(all_disp,
  #                    population = c(egg = 500, larva = 200, adult = 500),
  #                    timesteps = 100)

})
