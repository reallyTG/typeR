##########################################
test_that("Input",{
  expect_error(BDportfolio_optim())
})

###################################################

#require(Rglpk)
require(Rsymphony)
library(PortfolioOptim)
R0 = 0.05
alpha_optim = 0.95
k = 2
a0 <- rep(1,k)
Aconstr <- rbind(a0,-a0)
bconstr <- c(1+1e-8, -1+1e-8)
LB <- rep(0,k)
UB <- rep(1,k)
dat <- matrix(c(0.1,0.2,0.5,0.1,0.3,0.8,0.1,0.2,0.7),nrow = 3, ncol = 3)
################################################
test_that("Output too small",{
  expect_output(rs<-BDportfolio_optim(dat, R0, "CVAR", alpha_optim, Aconstr, bconstr, NULL, NULL, 200, 1e-10),"Target portfolio return is to small for the problem.
Problem has been solved for target portfolio return =  0.399999996 " )
})

################################################
test_that("Output ",{
  expect_error(BDportfolio_optim(dat, R0, "CVAR", alpha_optim, Aconstr, bconstr, c(2,3,4), NULL, 200, 1e-10) )
})
test_that("Output ",{
  expect_error(BDportfolio_optim(dat, R0, "CVAR", alpha_optim, Aconstr, bconstr, NULL, c(2,3,4), 200, 1e-10) )
})
test_that("Output ",{
  expect_error(BDportfolio_optim(dat, R0, "CVAR", alpha_optim, Aconstr[-1,], bconstr, NULL, c(2,3,4), 200, 1e-10) )
})

UB <- rep(1,k)
test_that("Output ",{
  expect_output(BDportfolio_optim(dat, 100000, "CVAR", alpha_optim, Aconstr, bconstr, NULL, UB, 200, 1e-10), "Expected portfolio return is to high for the problem\nportfolio_return is set to highest accepted value \nnew portfolio_return =  -4998.97 \nTarget portfolio return is to small for the problem.\nProblem has been solved for target portfolio return =  0.399999996 " )
})
#############################################
rr <- matrix(c(-0.21481708,0.18571984,-0.1523601,0.13916639,-0.18270073,0.13240731,0.13736715,0.04114946,0.15929706,0.09056012,
					-0.19366846,0.23596871,-0.06373515,0.0888071,-0.17804216,0.13484693,0.12872991,0.11483243,0.1449673,-0.02435218,
					-0.16526522,0.37355874,0.05065155,0.07574426,-0.19046866,0.04408062,0.11363588,0.01410258,0.09919878,0.25314035,
					-0.15180283,0.16092582,-0.16920904,0.14634784,-0.29608858,0.1928281,0.20616873,-0.0452911,0.23095132,0.05036431,
					-0.241186841,0.434656598,-0.011505425,0.105050583,-0.338251064,0.161053614,0.093324546,-0.004589778,0.20171661,0.115914413), 10,5)
pk = rep(0.1, 10)
dat = cbind(rr, pk)
Aconstr <- matrix(c(1,-1,1,-1,1,-1,1,-1,1,-1),2,5)
bconstr<- c(1,-1)
lbound <- rep(-1,5)
ubound <- rep(1,5)
##########################
test_that("Output type",{
  expect_is(BDportfolio_optim(dat, 0.06, risk = "MAD",  alpha = 0.95, Aconstr, bconstr,lbound, ubound, maxiter = 200, tol = 1e-10 )
,"list" )
})
##############################
