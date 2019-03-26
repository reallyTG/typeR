context("Testing reproducibility of results with examples")

# simulate data

set.seed(1)
simUVgauss<-simGaussMiss<- c(rnorm(n=20, mean=30), rnorm(n=20, mean=25), # short runs
                             rnorm(n=300, mean=40), rnorm(n=300, mean=43), # longer runs
                             rnorm(n=300, mean=43, sd = 10)) # change in variance
set.seed(1)
simUVpoiss<- c(rpois(n=20, lambda = 30), rpois(n=20, lambda = 300), # big change, small run
               rpois(n=300, lambda = 200), rpois(n=300, lambda = 250), # small change, long run
               rpois(n=300, lambda = 230)) # small change long run
sim3Vgauss<- cbind(simUVgauss+10, simUVgauss, simUVgauss+90)
sim3Vpoiss<- cbind(simUVpoiss+10, simUVpoiss, simUVpoiss+90)
sim3Vmix <- cbind(sim3Vpoiss, sim3Vgauss)
# generate one with missing points:
numremoved<- 0.1*length(simUVgauss)
set.seed(1)
removeIndices<- sample.int(length(simUVgauss), round(numremoved)) # chose indices to be NA
simGaussMiss[removeIndices]<-NA

# store true correct answers
trueCPs<- c(1, 21, 41, 341, 641)

# run on each simulation and check results

# univ Gauss ###############################################################################
ocpd1<- onlineCPD(simUVgauss, hazard_func=function(x, lambda){const_hazard(x, lambda=100)},
                  probModel=list("g"), init_params=list(list(m=0, k=0.01, a=0.01, b=0.0001)),
                  multivariate=FALSE, cpthreshold = 0.5,
                  truncRlim =10^(-4), minRlength= 1, maxRlength= 10^4,
                  minsep=1, maxsep=10^4)

test_that("Univariate gaussian example, maxCPs: ", {
  expect_identical(ocpd1$changepoint_lists$maxCPs[[1]], trueCPs)
})
test_that("Univariate gaussian example, colmaxes: ", {
  expect_identical(ocpd1$changepoint_lists$colmaxes[[1]], trueCPs)
})
test_that("Univariate gaussian example, threscps: ", {
  expect_identical(ocpd1$changepoint_lists$threshcps[[1]], trueCPs)
})

# univ Poiss ###############################################################################
ocpd2<- onlineCPD(simUVpoiss, hazard_func=function(x, lambda){const_hazard(x, lambda=100)},
                  probModel=list("p"), init_params=list(list(a=1, b=1)),
                  multivariate=FALSE, cpthreshold = 0.5,
                  truncRlim =10^(-4), minRlength= 1, maxRlength= 10^4,
                  minsep=1, maxsep=10^4)

test_that("Univariate poisson example, maxCPs: ", {
  expect_identical(ocpd2$changepoint_lists$maxCPs[[1]], c(1,21,41,341))
})
test_that("Univariate poisson example, colmaxes: ", {
  expect_identical(ocpd2$changepoint_lists$colmaxes[[1]], c(1,21,41,341))
})
test_that("Univariate poisson example, threscps: ", {
  expect_identical(ocpd2$changepoint_lists$threshcps[[1]], c(1,21,41,341))
})

# 3v Gauss #################################################################################
ocpd3<- onlineCPD(sim3Vgauss, hazard_func=function(x, lambda){const_hazard(x, lambda=100)},
                  probModel=list("g"), init_params=list(list(m=0, k=0.01, a=0.01, b=0.0001)),
                  multivariate=TRUE, cpthreshold = 0.5,
                  truncRlim =10^(-4), minRlength= 1, maxRlength= 10^4,
                  minsep=1, maxsep=10^4)

test_that("Multivariate gaussian example, maxCPs: ", {
  expect_identical(ocpd3$changepoint_lists$maxCPs[[1]], trueCPs)
})
test_that("Multivariate gaussian example, colmaxes: ", {
  expect_identical(ocpd3$changepoint_lists$colmaxes[[1]], trueCPs)
})
test_that("Multivariate gaussian example, threscps: ", {
  expect_identical(ocpd3$changepoint_lists$threshcps[[1]], trueCPs)
})

# univ Poiss ###############################################################################
ocpd4<- onlineCPD(sim3Vpoiss, hazard_func=function(x, lambda){const_hazard(x, lambda=100)},
                  probModel=list("p"), init_params=list(list(a=1, b=1)),
                  multivariate=TRUE, cpthreshold = 0.5,
                  truncRlim =10^(-4), minRlength= 1, maxRlength= 10^4,
                  minsep=1, maxsep=10^4)

test_that("Multivariate poisson example, maxCPs: ", {
  expect_identical(ocpd4$changepoint_lists$maxCPs[[1]], c(1,21,41,340))
})
test_that("Multivariate poisson example, colmaxes: ", {
  expect_identical(ocpd4$changepoint_lists$colmaxes[[1]], c(1,21,38,41,340))
})
test_that("Multivariate poisson example, threscps: ", {
  expect_identical(ocpd4$changepoint_lists$threshcps[[1]], c(1,21,38, 41,340))
})

# univ Poiss ###############################################################################
ocpd5<- onlineCPD(sim3Vmix, hazard_func=function(x, lambda){const_hazard(x, lambda=100)},
                  probModel=list("p"),
                  init_params=c(rep(list(list(a=1, b=1)),3), rep(list(list(m=0, k=0.01, a=0.01, b=0.0001)), 3)),
                  multivariate=TRUE, cpthreshold = 0.5,
                  truncRlim =10^(-4), minRlength= 1, maxRlength= 10^4,
                  minsep=1, maxsep=10^4)

test_that("mixed gauss and poiss example, maxCPs: ", {
  expect_identical(ocpd5$changepoint_lists$maxCPs[[1]], c(1,21,39,340))
})
test_that("mixed gauss and poisson example, colmaxes: ", {
  expect_identical(ocpd5$changepoint_lists$colmaxes[[1]], c(1,21,38,39,340))
})
test_that("mixed gauss and poisson example, threscps: ", {
  expect_identical(ocpd5$changepoint_lists$threshcps[[1]], c(1,21,38,39,340))
})


# univ gaussian with missing data ######################################################
ocpd6<- onlineCPD(simGaussMiss, hazard_func=function(x, lambda){const_hazard(x, lambda=100)},
                  probModel=list("g"), init_params=list(list(m=0, k=0.01, a=0.01, b=0.0001)),
                  multivariate=FALSE, cpthreshold = 0.5, missPts = "mean",
                  truncRlim =10^(-4), minRlength= 1, maxRlength= 10^4,
                  minsep=1, maxsep=10^4)

test_that("Univariate gaussian with missing points example, maxCPs: ", {
  expect_identical(ocpd6$changepoint_lists$maxCPs[[1]], c( 1,  22,  41, 341, 641))
})
test_that("Univariate gaussian with missing points example, colmaxes: ", {
  expect_identical(ocpd6$changepoint_lists$colmaxes[[1]], c( 1,  22,  41, 341, 641))
})
test_that("Univariate gaussian with missing points example, threscps: ", {
  expect_identical(ocpd6$changepoint_lists$threshcps[[1]], c( 1,  22,  41, 341, 641))
})
