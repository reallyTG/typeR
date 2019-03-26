context('deterministic-analysis')

test_that('deterministic analyses work', {

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

  population <- data.frame(eggs = 1000,
                           larvae = 200,
                           adults = 50)

  # project for some timesteps
  proj <- projection(dynamic = all,
                     population = population,
                     timesteps = 100)

  # check you can also do this with a vector
  proj <- projection(dynamic = all,
                     population = unlist(population),
                     timesteps = 100)

  # check it has the right class and structure
  expect_s3_class(proj, 'pop_projection')
  expect_s3_class(proj$dynamic, 'dynamic')
  expect_true(is.matrix(proj$projection))

  # 30 replicates of 101 timepoints
  expect_equal(dim(proj$projection), c(101, 3))

  # check there are no NAs in there
  expect_false(anyNA(proj$projection))

  # each should have the right number of states
  expect_true(ncol(proj$projection) == length(states(all)))

  # check we get errors for dodgy inputs

  # for a transition instead of a dynamic
  expect_error(projection(dynamic = all[[1]],
                          population = population,
                          timesteps = 50))

  # for the wrong size of population
  expect_error(projection(dynamic = all,
                          population = population[1:2],
                          timesteps = 50))

  # for the wrong population names
  population2 <- population
  names(population2) <- paste0(names(population2), '_blaaaargh')
  expect_error(projection(dynamic = all,
                          population = population2,
                          timesteps = 50))

  # nagative populations
  expect_error(projection(dynamic = all,
                          population = population * -1,
                          timesteps = 50))

  # non-finite populations
  expect_error(projection(dynamic = all,
                          population = population * Inf,
                          timesteps = 50))

  # NA populations
  expect_error(projection(dynamic = all,
                          population = population * NA,
                          timesteps = 50))

  # check is.pop_projection
  expect_true(is.pop_projection(proj))
  expect_false(is.pop_projection(proj$dynamic))

  # check projection plotting

  # check output structure for one state
  plot_out_egg <- plot(proj, state = 'eggs')

  # list
  expect_true(is.matrix(plot_out_egg))

  # first element as 3 columns and right no. rows
  expect_equal(dim(plot_out_egg), c(101,3))
  # no NAs
  expect_false(anyNA(plot_out_egg))

  # check output structure for all state
  plot_out_all <- plot(proj)
  # list
  expect_true(is.matrix(plot_out_all))
  # first element as 3 columns and right no. rows
  expect_equal(dim(plot_out_all), c(101,3))
  # no NAs
  expect_false(anyNA(plot_out_all))

  # error on bad states
  expect_error(plot(proj, state = 'bee'))
  expect_error(plot(proj, state = NA))

  # ~~~~~~~~~~
  # test multi-patch models run and can be analysed in the same way

  # pick a dynamic and give it lots of patches
  ls <- landscape(all)
  n <- 10
  ls_new <- as.landscape(list(coordinates = data.frame(x = runif(n),
                                                       y = runif(n)),
                              area = area(ls),
                              population = population(ls),
                              features = features(ls)))
  landscape(all) <- ls_new

  # add dispersal into the dynamic
  adult_dispersal <- tr(adults ~ adults, p(0.5) * d(3))
  all <- dynamic(all, adult_dispersal)
  landscape(all) <- ls_new

  # do projection
  proj <- projection(dynamic = all,
                     population = population,
                     timesteps = 10)

  # check it has the right class and structure
  expect_s3_class(proj, 'pop_projection')
  expect_s3_class(proj$dynamic, 'dynamic')
  expect_true(is.matrix(proj$projection))

  # 30 replicates of 101 timepoints
  expect_equal(dim(proj$projection), c(11, 30))

  # check there are no NAs in there
  expect_false(anyNA(proj$projection))

  # plotting with specific states/patches
  proj_plot1 <- plot(proj)
  proj_plot2 <- plot(proj, states = 'eggs')
  proj_plot3 <- plot(proj, patches = 2)
  proj_plot4 <- plot(proj, states = 'larvae', patches = 2)

  # should be the same
  expect_equal(proj_plot1, proj_plot2)
  expect_equal(proj_plot1, proj_plot3)
  expect_equal(proj_plot1, proj_plot4)

  expect_error(plot(proj, states = 'larvae', patches = 11))
  expect_error(plot(proj, states = 'larvae', patches = -1))
  expect_error(plot(proj, states = 'bees', patches = 11))
  expect_error(plot(proj, states = 'bees', patches = -1))

})
