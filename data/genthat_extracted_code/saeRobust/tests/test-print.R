context("print")
test_that("print method", {
  library("saeSim")
  set.seed(1)
  dat <- base_id(10, 1) %>%
    sim_gen_e() %>%
    sim_gen_x() %>%
    sim_gen_v() %>%
    sim_resp_eq(y = 100 + 2 * x + v + e) %>%
    as.data.frame

  dat$samplingVar <- 1

  x <- rfh(y ~ x, dat, "samplingVar", maxIter = 1, maxIterRe = 1)
  # don't know how to test this
  print(x)

  library("saeSim")
  set.seed(3)
  nDomains <- 20
  nTime <- 10
  dat <- base_id_temporal(nDomains, 1, nTime) %>%
    sim_gen_e(sd = 4) %>%
    sim_gen_x() %>%
    sim_gen(gen_v_sar(sd = 4, name = "v")) %>%
    sim_gen(gen_v_ar1(rho = 0.5, sd = 4, name = "ar")) %>%
    sim_resp_eq(y = 100 + 2 * x + v + ar + e) %>%
    as.data.frame

  dat$samplingVar <- rep(16, nrow(dat))
  W <- testRook(nDomains)

  out <- rfh(
    y ~ x, dat, "samplingVar", corSAR1AR1(W = W, nTime = nTime),
    maxIter = 1, maxIterParam = 1, maxIterRe = 1 # speed up
  )
  print(out)

})


