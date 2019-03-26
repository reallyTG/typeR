
context("Simulator object creation")

test_that("Argument checking works", {
  skip_if_not_installed("pomp")
  with_mock(requireNamespace = function(package, ..., quietly = FALSE) FALSE,
            expect_error(create_simulator(),
                         regexp = "The pomp package is needed"))
  foo <- create_simulator()
  params <- c(gamma = 24, mu = 0.014, d = 0.014, eta = 1e-4, beta_par = 24e-2,
              rho = 0.9, S_0 = -1, I_0 = 0, R_0 = 0, N_0 = 1e2, p = 0)
  expect_error(pomp::simulate(foo, params = params))
  params <- c(gamma = 24, mu = 0.014, d = 0.014, eta = 1e-4, beta_par = 24e-2,
              rho = -9, S_0 = 1, I_0 = 0, R_0 = 0, N_0 = 1e2, p = 0)
  expect_error(pomp::simulate(foo, params = params))
})

context("Gillespie direct method simulator")

test_that("Calculation of cases consistent with number of recovered", {
  skip_if_not_installed("pomp")

  params <- c(gamma = 24, mu = 0.014, d = 0.0, eta = 1e-4, beta_par = 24,
              rho = 0.9, S_0 = 1, I_0 = 0, R_0 = 0, N_0 = 1e2, p = 0)
  covar <- data.frame(gamma_t = c(0, 0), mu_t = c(0, 0), d_t = c(0, 0),
                      eta_t = c(0, 0), beta_par_t = c(0, 0), p_t = c(0, 0),
                      time = c(0, 1e6))
  times <- seq(0, 1000, by = 1)

  sim <- create_simulator(params = params, times = times, covar = covar,
                          process_model = "SIR",
                          transmission = "frequency-dependent")
  so <- pomp::simulate(sim, as.data.frame = TRUE, seed = 200)
  expect_equal(diff(so$R), so$cases[-1])
})

test_that(paste("Mean and stddev of stationary model over time",
                "consistent with ensemble mean and stdev of dizzy",
                "progam's implementation"), {
  skip_if_not_installed("pomp")
  skip_on_cran()

  params <- c(gamma = 24, mu = 0.014, d = 0.014, eta = 1e-4, beta_par = 24e-2,
              rho = 0.9, S_0 = 1, I_0 = 0, R_0 = 0, N_0 = 1e2, p = 0)
  covar <- data.frame(gamma_t = c(0, 0), mu_t = c(0, 0), d_t = c(0, 0),
                      eta_t = c(0, 0), beta_par_t = c(0, 0), p_t = c(0, 0),
                      time = c(0, 1e6))
  times <- seq(0, 1e6, by = 1)

  sim <- create_simulator(params = params, times = times, covar = covar,
                          process_model = "SIS")
  so <- pomp::simulate(sim, as.data.frame = TRUE, seed = 200)
  expect_lt(abs(mean(so[, "I"]) - 0.014375), 0.5)
  expect_lt(abs(mean(so[, "S"]) - 99.9888), 1)
  expect_lt(abs(sd(so[, "I"]) - 0.5130), 0.25)
  expect_lt(abs(sd(so[, "S"]) - 9.9963), 0.1)
})

test_that(paste("Means and final stddev of time-dependent model",
                "consistent with ensemble mean and stdev of dizzy",
                "progam's implementation"), {
  skip_if_not_installed("pomp")
  skip_on_cran()

  params <- c(gamma = 24, mu = 0.014, d = 0.014, eta = 1e-4, beta_par = 0e-2,
              rho = 0.9, S_0 = 1, I_0 = 0, R_0 = 0, N_0 = 1e2, p = 0)
  covar <- data.frame(gamma_t = c(0, 0), mu_t = c(0, 0), d_t = c(0, 0),
                      eta_t = c(0, 0), beta_par_t = c(0, 3 * 24e-2),
                      p_t = c(0, 0), time = c(0, 60))
  times <- seq(0, 50, len = 100)

  sim <- create_simulator(params = params, times = times, covar = covar,
                          process_model = "SIS")
  so <- pomp::simulate(sim, as.data.frame = TRUE, seed = 200, nsim = 1000)
  ens_infected <- unstack(so, I~sim)
  ens_susceptible <- unstack(so, S~sim)
  dzout <- read.csv(file.path("dizzy", "out-linear-trend.csv"), nrows = 100)
  expect_lt(sqrt(mean( (dzout$I - rowMeans(ens_infected)) ^ 2)), 1)
  expect_lt(sqrt(mean( (dzout$S - rowMeans(ens_susceptible)) ^ 2)), 1)
  dzout_fluc <- read.csv(file.path("dizzy", "out-linear-trend.csv"), skip = 101,
                         header = FALSE)
  tfsds <- dzout_fluc[, 2]
  names(tfsds) <- dzout_fluc[, 1]
  expect_equal(sd(ens_infected[100, ]), tfsds["I"],
               check.attributes = FALSE, tol = 0.1)
  expect_equal(sd(ens_susceptible[100, ]), tfsds["S"],
               check.attributes = FALSE, tol = 0.1)

  params <- c(gamma = 24, mu = 0.014, d = 0.014, eta = 0.1, beta_par = 0e-2,
              rho = 0.9, S_0 = 1, I_0 = 0, R_0 = 0, N_0 = 1e2, p = 0)
  times <- seq(0, 20, len = 100)
  tf <- seq(0, 20, len = 1e3)

  covar <- list()
  covar$eta_t <- params["eta"] * (1 + sin(tf / 10))
  covar$beta_par_t <- 12 * tf / 100
  covar$gamma_t <- params["gamma"] * sin(tf / 2)
  covar$mu_t <- tf / 100
  covar$d_t <- params["d"] * exp(-tf)
  covar$p_t <- 0
  covar$time <- tf
  covar <- as.data.frame(covar)
  sim <- create_simulator(params = params, times = times, covar = covar,
                          process_model = "SIS")
  so <- pomp::simulate(sim, as.data.frame = TRUE, seed = 200, nsim = 100)
  ens_infected <- unstack(so, I~sim)
  ens_susceptible <- unstack(so, S~sim)
  dzout <- read.csv(file.path("dizzy", "out-multiple-moving-parameters.csv"),
                    nrows = 100)
  expect_lt(sqrt(mean( (dzout$I - rowMeans(ens_infected)) ^ 2)), 3)
  expect_lt(sqrt(mean( (dzout$S - rowMeans(ens_susceptible)) ^ 2)), 2)
  dzout_fluc <- read.csv(file.path("dizzy",
                                   "out-multiple-moving-parameters.csv"),
                         skip = 101, header = FALSE)
  tfsds <- dzout_fluc[, 2]
  names(tfsds) <- dzout_fluc[, 1]
  expect_equal(sd(ens_infected[100, ]), tfsds["I"],
               check.attributes = FALSE, tol = 0.25)
  expect_equal(sd(ens_susceptible[100, ]), tfsds["S"],
               check.attributes = FALSE, tol = 0.25)
})

test_that(paste("Fluctuations for large system sizes approximate AR process",
                "given by linear noise approximation"), {
  skip_if_not_installed("pomp")
  skip_on_cran()

  params <- c(gamma = 16.59091, mu = 0.02, d = 0.02, eta = 2e-4,
              beta_par = 100e-6, rho = 0.9, S_0 = 0.165779, I_0 = 0.001004,
              R_0 = 0.833216, N_0 = 1e6, p = 0)
  times <- seq(0, 1000, len = 1000)
  sim <- create_simulator(params = params, times = times, process_model = "SIR")
  so <- pomp::simulate(sim, as.data.frame = TRUE, seed = 202)
  sts <- so[, c("I", "S")]
  sim_sigma <- cov(sts)
  expect_equal(sim_sigma["I", "I"], 0.1095306 * params["N_0"],
               check.attributes = FALSE, tolerance = 0.2)
  expect_equal(sim_sigma["S", "S"], 18.0094688 * params["N_0"],
               check.attributes = FALSE, tolerance = 0.2)
  expect_equal(sim_sigma["I", "S"], -0.1298541 * params["N_0"],
               check.attributes = FALSE, tolerance = 0.2)

  sim_ac1_II <- cov(sts[-1, "I"], sts[-nrow(sts), "I"]) / sim_sigma["I", "I"]
  sim_ac1_IS <- (cov(sts[-1, "I"], sts[-nrow(sts), "S"])
                   / prod(sqrt(diag(sim_sigma))))
  sim_ac1_SI <- (cov(sts[-1, "S"], sts[-nrow(sts), "I"])
                   / prod(sqrt(diag(sim_sigma))))
  sim_ac1_SS <- cov(sts[-1, "S"], sts[-nrow(sts), "S"]) / sim_sigma["S", "S"]
  expect_equal(sim_ac1_II, 0.2037399, tol = 0.2)
  expect_equal(sim_ac1_IS, 0.8501284, tol = 0.2)
  expect_equal(sim_ac1_SI, -0.9121943, tol = 0.2)
  expect_equal(sim_ac1_SS, 0.3079941, tol = 0.2)
})


test_that(paste("Susceptible population dynamics match deterministic",
                "expectations when vaccination is decreasing"), {
  skip_if_not_installed("pomp")
  skip_on_cran()

  tcrit <- 10
  params <- structure(c(16.59, 0.02, 0.02, 0, 332.21,
                        0, 1e+06, 0.99, 0.00987691726812067,
                        0, 0.990122934536821
                        ), .Names = c("gamma", "mu", "d", "eta", "beta_par",
                               "rho", "N_0", "p", "S_0", "I_0", "R_0"))
  R0 <- params["beta_par"] / (params["gamma"] + params["d"])
  k1 <- params["d"] * (1 - params["p"])
  k3 <- -params["d"]
  S0 <- params["S_0"] / sum(params["S_0"], params["I_0"], params["R_0"])
  k2 <- (1 / R0 + k1 / k3 - (S0 + k1 / k3) * exp(k3 * tcrit))
  k2 <- k2 / (exp(k3 * tcrit) / k3 ^ 2 - 1 / k3 ^ 2 - tcrit / k3)
  dpdt <- -k2 / params["d"]
  C1 <- S0 + k1 / k3 + k2 / k3 ^ 2
  Sstop <- C1 * exp (k3 * tcrit) - k1 / k3 - k2 / k3 ^ 2 -k2 /k3 * tcrit
  stopifnot(isTRUE(all.equal(Sstop, 1 / R0, check.attributes = FALSE)))
  sol <- function(t) C1 * exp(k3 * t) - k1 / k3 - k2 / k3 ^ 2 -k2 /k3 * t
  tstep <- 1 / 26
  times <- seq(from = 0, to = tcrit,  by = tstep)
  eps <- .Machine$double.eps
  tzero <- -params["p"] / dpdt
  p_t <- c(0, -params["p"] + eps, -params["p"] + eps)

  covar <- data.frame(gamma_t = 0, mu_t = 0, d_t = 0, eta_t = 0,
                      beta_par_t = 0, p_t = p_t,
                      time = c(0, tzero, max(c(tzero, times))))
  create_simulator(times = times, t0 = 0, transmission = "frequency-dependent",
                   params = params, covar = covar) -> sim
  out <- pomp::simulate(sim, as.data.frame = TRUE)
  expect_equal(out$S , sol(times) * params["N_0"], tol = 0.01)
})
