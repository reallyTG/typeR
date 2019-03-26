context("12-RapSolved")

test_that("plot (x=RapSolved, y=missing)", {
  data(sim_rs)
  sim_rs@data@pu$status[1 ] <- 2
  sim_rs@data@pu$status[2] <- 3
  plot(sim_rs)
  expect_true(TRUE)
})

test_that("plot (x=RapSolved, y=0)", {
  data(sim_rs)
  sim_rs@data@pu$status[1] <- 2
  sim_rs@data@pu$status[2] <- 3
  plot(sim_rs, 0)
  expect_true(TRUE)
})

test_that("plot (x=RapSolved, y=1)", {
  data(sim_rs)
  sim_rs@data@pu$status[1] <- 2
  sim_rs@data@pu$status[2] <- 3
  plot(sim_rs, 1)
  expect_true(TRUE)
})

test_that("plot (x=RapSolved, y=RapSolved, i=NULL, j=NULL)", {
  data(sim_rs)
  sim_rs2 <- sim_rs
  sim_rs2@results@selections[] <- sample(
    c(0, 1),
    size = prod(dim(sim_rs@results@selections)), replace = TRUE)
  sim_rs2@results@.cache <- new.env()
  sim_rs@data@pu$status[1] <- 2
  sim_rs@data@pu$status[2] <- 3
  sim_rs@data@pu$status[3] <- 2
  sim_rs@data@pu$status[4] <- 3
  plot(sim_rs, sim_rs2)
  expect_true(TRUE)
})

test_that("plot (x=RapSolved, y=RapSolved, i=0, j=1)", {
  data(sim_rs)
  sim_rs2 <- sim_rs
  sim_rs2@results@selections[] <- sample(
    c(0, 1),
    size = prod(dim(sim_rs@results@selections)), replace = TRUE)
  sim_rs2@results@.cache <- new.env()
  sim_rs@data@pu$status[1] <- 2
  sim_rs@data@pu$status[2] <- 3
  sim_rs@data@pu$status[3] <- 2
  sim_rs@data@pu$status[4] <- 3
  plot(sim_rs, sim_rs2, 0, 1)
  expect_true(TRUE)
})

test_that("spp.plot (x=RapSolved, y=0)", {
  data(sim_rs)
  sim_rs@data@pu$status[1] <- 2
  sim_rs@data@pu$status[2] <- 3
  spp.plot(sim_rs, 1)
  expect_true(TRUE)
})

test_that("space.plot (x=RapSolved, species=1, space=1, y=0)", {
  data(sim_rs)
  sim_rs@data@pu$status[1] <- 2
  sim_rs@data@pu$status[2] <- 3
  space.plot(sim_rs, 1, 1)
  expect_true(TRUE)
})

test_that("selections.RapSolved", {
  data(sim_rs)
  expect_identical(selections(sim_rs),
                   sim_rs@results@selections[sim_rs@results@best, ])
  expect_identical(selections(sim_rs, NULL), sim_rs@results@selections)
  expect_identical(selections(sim_rs, 1), sim_rs@results@selections[1, ])
  expect_true(TRUE)
})

test_that("score.RapSolved", {
  data(sim_rs)
  expect_identical(score(sim_rs),
                   sim_rs@results@summary$Score[sim_rs@results@best])
  expect_identical(score(sim_rs, NULL), sim_rs@results@summary$Score)
  expect_identical(score(sim_rs, 1), sim_rs@results@summary$Score[1])
})

test_that("amount.held.RapSolved", {
  data(sim_rs)
  expect_identical(unname(c(amount.held(sim_rs))),
                   sim_rs@results@amount.held[sim_rs@results@best, ])
  expect_identical(unname(c(amount.held(sim_rs, y = NULL))),
                   c(sim_rs@results@amount.held))
  expect_identical(unname(c(amount.held(sim_rs, y = 1))),
                   c(sim_rs@results@amount.held[1, ]))
})

test_that("space.held.RapSolved", {
  data(sim_rs)
  expect_identical(unname(c(space.held(sim_rs))),
                   sim_rs@results@space.held[sim_rs@results@best, ])
  expect_identical(unname(c(space.held(sim_rs, y = NULL))),
                   c(sim_rs@results@space.held))
  expect_identical(unname(c(space.held(sim_rs, y = 1))),
                   c(sim_rs@results@space.held[1, ]))
  expect_identical(unname(c(space.held(sim_rs, y = 1, species = "normal"))),
                   c(sim_rs@results@space.held[1, 2]))
  expect_identical(unname(c(space.held(sim_rs, y = 1, space = "geographic",
                                       species = "normal"))),
                   c(sim_rs@results@space.held[1, 2]))
})

test_that("summary.RapSolved", {
  data(sim_rs)
  expect_identical(summary(sim_rs), sim_rs@results@summary)
})

test_that("logging.file.RapSolved", {
  data(sim_rs)
  expect_identical(logging.file(sim_rs),
                   sim_rs@results@logging.file[sim_rs@results@best])
  expect_identical(logging.file(sim_rs, NULL), sim_rs@results@logging.file)
  expect_identical(logging.file(sim_rs, 1), sim_rs@results@logging.file[1])
})

test_that("update.RapSolved", {
  # load RapSolved object
  data(sim_rs)
  # update object
  sim_rs2 <- update(sim_rs, BLM = 100, MIPGap = 0.4, name = letters[1:3],
                    solve = FALSE)
  # checks
  expect_equal(sim_rs2@opts@BLM, 100)
  expect_equal(sim_rs2@data@species$name, letters[1:3])
})

test_that("amount.target.RapSolved", {
  data(sim_rs)
  expect_equal(unname(amount.target(sim_rs)),
               sim_rs@data@targets$proportion[which(
                 sim_rs@data@targets$target == 0)])
})

test_that("space.target.RapSolved", {
  data(sim_rs)
  expect_equal(unname(space.target(sim_rs)[, 1]),
               sim_rs@data@targets$proportion[which(
                 sim_rs@data@targets$target == 1)])
})

test_that("names.RapSolved", {
  data(sim_rs)
  expect_equal(names(sim_rs), sim_rs@data@species$names)
})

test_that("names<-.RapSolved", {
  data(sim_rs)
  names(sim_rs) <- c("spp1", "spp2", "spp3")
  expect_equal(names(sim_rs), c("spp1", "spp2", "spp3"))
})
