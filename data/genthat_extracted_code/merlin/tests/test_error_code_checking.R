context("error_code_checking")

#############################################

# necesassy inputs
###############################################################################
test_that("Test 1.1", {
  errormessage <- "argument \"model\" is missing, with no default"
  expect_error(merlin(ip=9,
                          levels=c("id"),
                          family="gaussian",
                          data=pbc.merlin),
                          errormessage)
})

# Guassian is currently the family default
# test_that("Test 1.2", {
#   errormessage <- "argument \"family\" is missing, with no default"
#   expect_error(merlin(model=list(y ~ x + M1[id]*1),
#                         levels=c("id"),
#                         data=pbc.merlin),
#                         errormessage)
# })

test_that("Test 1.3", {
  errormessage <- "argument \"data\" is missing, with no default"
  expect_error(merlin(model=list(logb ~ time + M1[id]*1),
                        ip=9,
                        levels=c("id"),
                        family="gaussian"),
                        errormessage)
})


# error codes
###############################################################################
test_that("Test 2.1", {
  errormessage <- "The number of families specified must equal the number of models"
  expect_error(merlin(model=list(logb ~ M1[id]*1,
                             logp ~ M2[id]*1),
                        ip=9,
                        family=c("gaussian"),
                        levels=c("id"),
                        covariance="identity",
                        data=pbc.merlin),
                  errormessage)
})

# test_that("Test 2.2", { # it won't really allow for this right now
#   errormessage <- "If more than one level is used, order must be specified"
#   expect_error(megenreg(model=list(logp ~ M1[id]*1,
#                                    logb ~ M2[id]*1),
#                       nodes=9,
#                       family=c("gaussian"),
#                       levels=c("id"),
#                       covariance="identity",
#                       data=pbc.merlin),
#                errormessage)
# })

test_that("Test 2.3", {
  errormessage <- "The specified levels must refer to a column in the dataset"
  expect_error(merlin(model=list(logb ~ M1[id]*1,
                                   logp ~ M2[id]*1),
                        ip=9,
                        family=c("gaussian","gaussian"),
                        levels=c("id2"),
                        covariance="identity",
                        data=pbc.merlin),
               errormessage)
})

test_that("Test 2.4", {
  errormessage <- "gausian is not a valid family"
  expect_error(merlin(model=list(logb ~ M1[id]*1,
                                   logp ~ M2[id]*1),
                        ip=9,
                        family=c("gausian","gaussian"),
                        levels=c("id"),
                        covariance="identity",
                        data=pbc.merlin),
                errormessage)
})

test_that("Test 2.5", {
  errormessage <- "Outcome variable logq is not present in data set"
  expect_error(merlin(model=list(logq ~ M1[id]*1,
                                   logp ~ M2[id]*1),
                        ip=9,
                        family=c("gaussian","gaussian"),
                        levels=c("id"),
                        covariance="identity",
                        data=pbc.merlin),
               errormessage)
})

test_that("Test 2.6", {
  errormessage <- '\"unstructued\" is not a valid covariance structure'
  expect_error(merlin(model=list(logb ~ time + M1[id]@c),
                        ip=5,
                        levels=c("id"),
                        timevar=c("time"),
                        family="gaussian",
                        covariance="unstructued",
                        data=pbc.merlin),
               errormessage)
})

test_that("Test 2.7", {
  errormessage <- 'The specified weights must refer to a column in the dataset'
  expect_error(merlin(model=list(logb ~ time + M1[id]@c),
                        ip=5,
                        levels=c("id"),
                        timevar=c("time"),
                        family="gaussian",
                        covariance="unstructured",
                        sweights="wt1",
                        data=pbc.merlin),
               errormessage)
})

test_that("Test 2.8a", {
  errormessage <- 'Using EV requires square brackets'
  expect_error(merlin(model=list(Surv(stime,died) ~ EV(logb) + M1[id],
                  logb ~ year + M1[id]*1),
       ip=3,
       family=c("weibull","gaussian"),
       levels=c("id"),
       covariance="identity",
       timevar=c("stime","year"),
       data=pbc.merlin),
       errormessage)
})

test_that("Test 2.8b", {
  errormessage <- 'logp is not a specified model outcome'
  expect_error(merlin(model=list(Surv(stime,died) ~ EV[logp] + M1[id],
                                 logb ~ year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      levels=c("id"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.8c", {
  errormessage <- 'The expected value of an outcome variable cannot be used in the model for that outcome'
  expect_error(merlin(model=list(Surv(stime,died) ~ EV[logb] + M1[id],
                                 logb ~ EV[logb] + year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      levels=c("id"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.9a", {
  errormessage <- 'Outcome variable stime2 is not present in data set'
  expect_error(merlin(model=list(Surv(stime2,died) ~ EV[logb] + M1[id],
                                 logb ~ year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      levels=c("id"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.9b", {
  errormessage <- 'Outcome variable died2 is not present in data set'
  expect_error(merlin(model=list(Surv(stime,died2) ~ EV[logb] + M1[id],
                                 logb ~ year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      levels=c("id"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.9c", {
  errormessage <- 'Outcome variable logb2 is not present in data set'
  expect_error(merlin(model=list(Surv(stime,died) ~ EV[logb] + M1[id],
                                 logb2 ~ year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      levels=c("id"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.10a", {
  errormessage <- 'Outcome must be numeric'
  expect_error(merlin(model=list(Surv(stime,died) ~ EV[logb] + M1[id],
                                 status ~ year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      levels=c("id"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.10b", {
  errormessage <- 'Event indicator must be numeric'
  expect_error(merlin(model=list(Surv(stime,status) ~ EV[logb] + M1[id],
                                 logb ~ year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      levels=c("id"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.10c", {
  errormessage <- 'Event indicator must be 0 or 1'
  expect_error(merlin(model=list(Surv(stime,year) ~ EV[logb] + M1[id],
                                 logb ~ year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      levels=c("id"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.10b", {
  errormessage <- 'Event indicator must be numeric'
  expect_error(merlin(model=list(Surv(stime,status) ~ EV[logb] + M1[id],
                                 logb ~ year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      levels=c("id"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.10c", {
  errormessage <- 'Event indicator must be 0 or 1'
  expect_error(merlin(model=list(Surv(stime,year) ~ EV[logb] + M1[id],
                                 logb ~ year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      levels=c("id"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.11", {
  errormessage <- 'timevar option must be specified for this model'
  expect_error(merlin(model=list(Surv(stime,died) ~ EV[logb] + M1[id],
                                 logb ~ year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      levels=c("id"),
                      covariance="identity",
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.12a", {
  errormessage <- 'If random-effects are specified the levels option must be used'
  expect_error(merlin(model=list(Surv(stime,died) ~ EV[logb] + M1[id],
                                 logb ~ year + M1[id]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      data=pbc.merlin),
               errormessage)
})

test_that("Test 2.12b", {
  errormessage <- 'trt has not been included in the levels option'
  expect_error(merlin(model=list(Surv(stime,died) ~ EV[logb] + M1[id],
                                 logb ~ year + M1[trt]*1),
                      ip=3,
                      family=c("weibull","gaussian"),
                      covariance="identity",
                      timevar=c("stime","year"),
                      levels=c("id"),
                      data=pbc.merlin),
               errormessage)
})






