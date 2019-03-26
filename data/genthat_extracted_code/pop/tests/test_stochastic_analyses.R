context('stochastic-analysis')

test_that('stochastic analyses work', {

  skip_on_cran()

  # generate four types of dynamic
  stasis_egg <- tr(eggs ~ eggs, p(0.4))
  stasis_larva <- tr(larvae ~ larvae, p(0.3))
  stasis_adult <- tr(adults ~ adults, p(0.8))
  hatching <- tr(larvae ~ eggs, p(0.5))
  fecundity <- tr(eggs ~ adults, p(0.2) * r(3))
  pupation <- tr(adults ~ larvae, p(0.2))
  clonal <- tr(larvae ~ larvae, r(1.4))

  stasis <- dynamic(stasis_egg,
                    stasis_larva,
                    stasis_adult)
  growth <- dynamic(hatching,
                    pupation)
  reproduction <- dynamic(fecundity,
                          clonal)
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


  # set the RNG seed and simulate 30 times for 50 generations each
  set.seed(1)

  # run with 1 core
  sim <- simulation(dynamic = all,
                    population = population,
                    timesteps = 10,
                    replicates = 3,
                    ncores = 1)

  # check you can also do this with a vector
  sim <- simulation(dynamic = all,
                    population = unlist(population),
                    timesteps = 10,
                    replicates = 3,
                    ncores = 1)

  # get a single simulationt oo, for testing plotting
  sim1 <- simulation(dynamic = all,
                    population = unlist(population),
                    timesteps = 10,
                    replicates = 1,
                    ncores = 1)

  # check it has the right class and structure
  expect_s3_class(sim, 'simulation')
  expect_s3_class(sim$dynamic, 'dynamic')
  expect_true(is.list(sim$simulations))

  # 3 replicates of 11 snapshots
  expect_equal(length(sim$simulations), 3)
  maxt <- sapply(sim$simulations, nrow)
  expect_true(all(maxt == 11))

  # check there are no NAs in there
  NAs <- sapply(sim$simulations, anyNA)
  expect_false(any(NAs))

  # each should have the right number of states
  cols <- sapply(sim$simulations, ncol)
  expect_true(all(cols == length(states(all))))

  # check we get errors for dodgy inputs

  # for a transition instead of a dynamic
  expect_error(simulation(dynamic = all[[1]],
                          population = population,
                          timesteps = 10,
                          replicates = 3))

  # for the wrong size of population
  expect_error(simulation(dynamic = all,
                          population = population[1:2],
                          timesteps = 10,
                          replicates = 3))

  # for the wrong population names
  population2 <- population
  names(population2) <- paste0(names(population2), '_blaaaargh')
  expect_error(simulation(dynamic = all,
                          population = population2,
                          timesteps = 10,
                          replicates = 3))

  # nagative populations
  expect_error(simulation(dynamic = all,
                          population = population * -1,
                          timesteps = 10,
                          replicates = 3))

  # non-finite populations
  expect_error(simulation(dynamic = all,
                          population = population * Inf,
                          timesteps = 10,
                          replicates = 3))

  # non-finite populations
  expect_error(simulation(dynamic = all,
                          population = population * NA,
                          timesteps = 10,
                          replicates = 3))

  # negative timesteps
  expect_error(simulation(dynamic = all,
                          population = population,
                          timesteps = -1,
                          replicates = 3))

  # negative replicates
  expect_error(simulation(dynamic = all,
                          population = population,
                          timesteps = 10,
                          replicates = -1))

  # check is.simulation
  expect_true(is.simulation(sim))
  expect_false(is.simulation(sim$dynamic))

  # check as.simulation
  expect_true(is.simulation(pop:::as.simulation(NA)))
  expect_false(is.simulation(pop:::as.dynamic(NA)))

  # check simulation plotting

  # check output structure for one state
  plot_out_egg <- plot(sim, state = 'eggs')
  # list
  expect_true(is.list(plot_out_egg))
  # first element as 3 columns and right no. rows
  expect_equal(dim(plot_out_egg[[1]]), c(11,3))
  # no NAs
  expect_true(!any(is.na(plot_out_egg[[1]])))

  # for single simulation
  plot_out_egg1 <- plot(sim1, state = 'eggs')
  # list
  expect_true(is.list(plot_out_egg1))
  # first element as 3 columns and right no. rows
  expect_equal(dim(plot_out_egg1[[1]]), c(11,3))
  # NAs for CIs, not median
  expect_false(anyNA(plot_out_egg1[[1]][, 2]))
  expect_true(all(is.na(plot_out_egg1[[1]][, -2])))

  # check output structure for all states
  plot_out_all1 <- plot(sim1)
  # list
  expect_true(is.list(plot_out_all1))
  # first element as 3 columns and right no. rows
  expect_equal(dim(plot_out_all1[[1]]), c(11,3))
  # NAs for CIs, not median
  expect_false(anyNA(plot_out_all1[[1]][, 2]))
  expect_true(all(is.na(plot_out_all1[[1]][, -2])))

  # error on bad states
  expect_error(plot(sim, state = 'bee'))
  expect_error(plot(sim, state = NA))
  expect_error(plot(sim1, state = 'bee'))
  expect_error(plot(sim1, state = NA))


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

  # add dispersal into the dynamic
  adult_dispersal <- tr(adults ~ adults, p(0.5) * d(3))
  all <- dynamic(all, adult_dispersal)
  landscape(all) <- ls_new

  # try to do simulation
  sim <- simulation(dynamic = all,
                    population = population,
                    timesteps = 10,
                    replicates = 3,
                    ncores = 1)

  # check it has the right class and structure
  expect_s3_class(sim, 'simulation')
  expect_s3_class(sim$dynamic, 'dynamic')
  expect_true(is.list(sim$simulations))

  # 3 replicates of 11 snapshots
  expect_equal(length(sim$simulations), 3)
  maxt <- sapply(sim$simulations, nrow)
  expect_true(all(maxt == 11))

  # check there are no NAs in there
  NAs <- sapply(sim$simulations, anyNA)
  expect_false(any(NAs))

  # each should have the right number of states
  cols <- sapply(sim$simulations, ncol)
  expect_true(all(cols == length(states(all)) * nrow(landscape(all))))

  # plotting with specific states/patches
  sim_plot1 <- plot(sim)
  sim_plot2 <- plot(sim, states = 'eggs')
  sim_plot3 <- plot(sim, patches = 2)
  sim_plot4 <- plot(sim, states = 'larvae', patches = 2)

  expect_error(plot(sim, states = 'larvae', patches = 11))
  expect_error(plot(sim, states = 'larvae', patches = -1))
  expect_error(plot(sim, states = 'bees', patches = 11))
  expect_error(plot(sim, states = 'bees', patches = -1))

})
