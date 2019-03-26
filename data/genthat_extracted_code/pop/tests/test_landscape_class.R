context('landscape-class')

test_that('landscape classes work', {

  # create a dummy dynamic to get at its landscape
  # set up a simple model and initial population
  # generate four types of dynamic
  stasis_egg <- tr(eggs ~ eggs, p(0.4))
  stasis_larva <- tr(larvae ~ larvae, p(0.3))
  stasis_adult <- tr(adults ~ adults, p(0.8))
  hatching <- tr(larvae ~ eggs, p(0.5))
  fecundity <- tr(eggs ~ adults, p(0.2) * r(3))
  pupation <- tr(adults ~ larvae, p(0.2))
  clonal <- tr(larvae ~ larvae, r(1.4))

  all <- dynamic(stasis_egg,
                 stasis_larva,
                 stasis_adult,
                 hatching,
                 pupation,
                 clonal,
                 fecundity)

  ls_all <- landscape(all)
  ls_null <- as.landscape(NULL)
  ls_list <- as.landscape(list(coordinates = data.frame(x = runif(3), y = runif(3)),
                               area = data.frame(area = c(10, 15, 12)),
                               population = data.frame(eggs = 1,
                                                       larvae = 3,
                                                       adults = 12),
                               features = data.frame()[1, ]))

  # class we're expecting
  expect_s3_class(ls_all, 'landscape')
  expect_s3_class(ls_null, 'landscape')
  expect_s3_class(ls_list, 'landscape')

  # is.landscape
  expect_true(is.landscape(ls_all))
  expect_true(is.landscape(ls_null))
  expect_true(is.landscape(ls_list))
  expect_false(is.landscape(NA))
  expect_false(is.landscape(list()))
  expect_false(is.landscape(NULL))

  # expected print method output
  expect_equal(capture.output(print(ls_all)),
               'landscape with 1 patches')
  expect_equal(capture.output(print(ls_null)),
               'landscape with 1 patches')
  expect_equal(capture.output(print(ls_list)),
               'landscape with 3 patches')

  # getting and setting areas
  expect_equal(area(ls_all)$area, 1)
  area(ls_all) <- data.frame(area = 3)
  expect_equal(area(ls_all)$area, 3)

  expect_equal(area(ls_null)$area, 1)
  area(ls_null) <- data.frame(area = 3)
  expect_equal(area(ls_null)$area, 3)

  expect_equal(area(ls_list)$area, c(10, 15, 12))
  area(ls_list) <- data.frame(area = 3:1)
  expect_equal(area(ls_list)$area, 3:1)

  # wrong length
  expect_error(area(ls_list) <- 3)

  # getting and setting populations
  expect_equal(population(ls_all),
               data.frame(eggs = 0, larvae = 0, adults = 0))
  population(ls_all) <- population(ls_all) + 3
  expect_equal(population(ls_all),
               data.frame(eggs = 3, larvae = 3, adults = 3))

  # wrong lengths
  expect_error(population(ls_all) <- 3)

  # getting and setting features
  expect_equal(dim(features(ls_all)), c(1, 0))
  features(ls_all) <- data.frame(temp = 10, rainfall = 11)
  expect_equal(features(ls_all),
               data.frame(temp = 10, rainfall = 11))
  features(ls_all) <- data.frame(aridity = -1)
  expect_equal(features(ls_all),
               data.frame(aridity = -1))

  # wrong dimension
  expect_error(features(ls_all) <- 3)

  # getting and setting distance matrices
  distance_list <- distance(ls_list)
  expect_true(is.matrix(distance_list))
  expect_true(all(diag(distance_list) == 0))
  expect_equal(dim(distance_list), c(3, 3))

  distance(ls_list) <- as.matrix(dist(runif(3)))

  expect_true(is.matrix(distance(ls_list)))
  expect_true(all(diag(distance(ls_list)) == 0))
  expect_equal(dim(distance(ls_list)), c(3, 3))

  # wrong dimension
  expect_error(distance(ls_all) <- 3)
  expect_error(distance(ls_all) <- data.frame(x = 10))
  expect_error(distance(ls_all) <- as.matrix(dist(runif(4))))

  # test subsetting
  ls <- as.landscape(list(coordinates = data.frame(x = 1:3, y = 1:3),
                          area = data.frame(area = 1),
                          population = data.frame(eggs = 1,
                                                  larvae = 3,
                                                  adults = 12),
                          features = data.frame()[1, ]))

  ls_sub <- as.landscape(list(coordinates = data.frame(x = 1:2, y = 1:2),
                          area = data.frame(area = 1),
                          population = data.frame(eggs = 1,
                                                  larvae = 3,
                                                  adults = 12),
                          features = data.frame()[1, ]))

  expect_equal(ls[[1:2]], ls_sub)
  expect_equal(capture.output(print(ls)),
               'landscape with 3 patches')
  expect_equal(capture.output(print(ls_sub)),
               'landscape with 2 patches')
  expect_equal(distance(ls)[1:2, 1:2],
               distance(ls_sub))

})
