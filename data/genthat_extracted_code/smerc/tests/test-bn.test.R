data(nydf)
coords = as.matrix(nydf[,c("x", "y")])
cases = nydf$cases
pop = nydf$population

bn6 = bn.test(coords = coords,
              cases = cases,
              pop = pop,
              cstar = 6)
bn12 = bn.test(coords = coords,
               cases = cases,
               pop = pop,
               cstar = 12)
bn17 = bn.test(coords = coords,
               cases = cases,
               pop = pop,
               cstar = 17)
bn23 = bn.test(coords = coords,
               cases = cases,
               pop = pop,
               cstar = 23)

test_that("check accuracy for bn.test for NY data", {
  expect_equal(bn6$clusters[[1]]$pop, 2921)
  expect_equal(round(bn6$clusters[[1]]$cases, 2), 8.18)
  
  expect_equal(bn12$clusters[[1]]$pop, 8876)
  expect_equal(round(bn12$clusters[[1]]$cases, 2), 12.21)
  
  expect_equal(bn17$clusters[[1]]$pop, 11268)
  expect_equal(round(bn17$clusters[[1]]$cases, 2), 17.69)
  
  expect_equal(bn23$clusters[[1]]$pop, 19615)
  expect_equal(round(bn23$clusters[[1]]$cases, 2), 25.46)
})

bn23mod = bn.test(coords = coords,
               cases = cases,
               pop = pop,
               cstar = 23, 
               modified = TRUE)

bnse23 = SpatialEpi::besag_newell(geo = coords, 
                                 cases = cases, 
                                 population = pop, 
                                 k = 23,
                                 alpha = 0.1)

test_that("check accuracy for bn.test modified for NY data", {
  expect_equal(bn23mod$clusters[[1]]$locids, bnse23$clusters[[1]]$location.IDs.included)
  expect_equal(bn23mod$clusters[[1]]$pop, bnse23$clusters[[1]]$population)
  expect_equal(bn23mod$clusters[[1]]$ex, bnse23$clusters[[1]]$expected)
  expect_equal(bn23mod$clusters[[1]]$cases, bnse23$clusters[[1]]$number.of.cases)
  expect_equal(bn23mod$clusters[[1]]$pvalue, bnse23$clusters[[1]]$p.value)

  expect_equal(bn23mod$clusters[[2]]$locids, bnse23$clusters[[2]]$location.IDs.included)
  expect_equal(bn23mod$clusters[[2]]$pop, bnse23$clusters[[2]]$population)
  expect_equal(bn23mod$clusters[[2]]$ex, bnse23$clusters[[2]]$expected)
  expect_equal(bn23mod$clusters[[2]]$cases, bnse23$clusters[[2]]$number.of.cases)
  expect_equal(bn23mod$clusters[[2]]$pvalue, bnse23$clusters[[2]]$p.value)
  1 - ppois(bn23mod$clusters[[2]]$cases - 1, bn23mod$clusters[[2]]$ex)
  
  })
