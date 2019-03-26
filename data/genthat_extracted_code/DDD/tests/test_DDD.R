context("test_DDD")

test_that("DDD works", {
  pars1 = c(0.8,0.1,40)
  pars2 = c(100,1,1,0,0,2)
  brts = 1:30
  missnumspec = 0
  methode = 'lsoda'
  
  r0 <- dd_loglik(pars1 = pars1,pars2 = pars2,brts = brts,missnumspec = missnumspec,methode = methode)
  r1 <- dd_loglik_test(pars1 = pars1,pars2 = pars2,brts = brts,missnumspec = missnumspec,rhs_func_name = 'dd_loglik_rhs',methode = methode)
  r2 <- dd_loglik_test(pars1 = pars1,pars2 = pars2,brts = brts,missnumspec = missnumspec,rhs_func_name = 'dd_loglik_rhs_FORTRAN',methode = methode)
  r3 <- dd_loglik_test(pars1 = pars1,pars2 = pars2,brts = brts,missnumspec = missnumspec,methode = 'analytical')

  testthat::expect_equal(r0,r2,tolerance = .00001)
  testthat::expect_equal(r1,r2,tolerance = .00001)
  testthat::expect_equal(r1,r3,tolerance = .00001)
  testthat::expect_equal(-39.36047,r1,tolerance = .000001)
  
  r4 <- dd_SR_loglik(pars1 = c(0.2,0.1,50,0.2,0.1,70,5), pars2 = c(100,1,1,1,0,2), brts = 1:10, missnumspec = 0)
  testthat::expect_equal(-27.37304,r4,tolerance = .000001)

  brts = 1:5
  pars2 = c(100,1,3,0,0,2)
  r5 <- dd_loglik_test(pars1 = pars1,pars2 = pars2,brts = brts,missnumspec = missnumspec,rhs_func_name = 'dd_loglik_bw_rhs',methode = methode)
  r6 <- dd_loglik_test(pars1 = pars1,pars2 = pars2,brts = brts,missnumspec = missnumspec,rhs_func_name = 'dd_loglik_bw_rhs_FORTRAN',methode = methode)
  r7 <- dd_loglik_test(pars1 = pars1,pars2 = pars2,brts = brts,missnumspec = missnumspec,methode = 'analytical')
  
  testthat::expect_equal(r5,r6,tolerance = .00001)
  testthat::expect_equal(r5,r7,tolerance = .01)
  testthat::expect_equal(-8.582413,r7,tolerance = .00001)

  pars1 = c(0.2,0.05,1000000)
  pars2 = c(1000,1,1,0,0,2)
  brts = 1:10
  r8 <- dd_loglik_test(pars1 = pars1,pars2 = pars2,brts = brts,missnumspec = missnumspec,rhs_func_name = 'dd_loglik_rhs_FORTRAN',methode = methode)
  r9 <- dd_loglik_test(pars1 = c(pars1[1:2],Inf),pars2 = pars2,brts = brts,missnumspec = missnumspec,rhs_func_name = 'dd_loglik_rhs_FORTRAN',methode = methode)
  testthat::expect_equal(r8,r9,tolerance = .00001)
  
  pars1 <- c(0.2,0.05,15)
  pars2 <- c(4,1,0,0,2)
  brts <- 1:10
  r10 <- bd_loglik(pars1 = pars1,pars2 = pars2,brts = brts,missnumspec = 0,methode = 'lsoda')
  testthat::expect_equal(r10,-11.6076802136507471,tolerance = 1E-16)

  r11 <- bd_loglik(pars1 = c(0.4,0.1,20),pars2 = c(4,0,1,0,2), brts = 1:10, missnumspec = 0)
  testthat::expect_equal(r11,-27.7337684064852610,tolerance = 1E-16)
})


