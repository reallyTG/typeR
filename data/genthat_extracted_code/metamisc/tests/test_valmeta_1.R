context("valmeta 1. calculation of total O:E ratio")
skip_on_cran()

library(lme4)
data(EuroSCORE)

test_that ("Coversion between CITL and log O:E ratio", {
  
  # Generate a test dataset
  N <- 1000
  x1 <- rnorm(N, mean=0, sd=1)
  x2 <- rnorm(N, mean=0, sd=2)
  x3 <- rnorm(N, mean=0, sd=1)
  py <- inv.logit(cbind(1, x1, x2, x3) %*% c(-2, 1, 1, 1.5))
  y <- rbinom(N, prob=py, size = 1)
  
  # Fit model
  fit1 <- glm(y ~ x1 + x2 + x3, family = binomial())
  
  # Calculate LP
  pred.lp <- predict(fit1)
  
  # Introduce mis-calibration-in-the-large
  intercept.add <- 1.2
  pred.lp2 <- pred.lp + intercept.add
  
  # Calculate calibration-in-the-large
  fit2 <- glm(y ~ 1, offset = pred.lp2, family = binomial())
  
  # Check if estimate for calibration-in-the-large is correct
  citl <- as.numeric(coefficients(fit2)[1])
  expect_equal(citl, -intercept.add)
  
  # Calculate total O:E ratio
  O <- sum(y)
  E <- sum(inv.logit(pred.lp2))
  OE <- O/E
  
  # Restored Po
  Po.restored <- mean(inv.logit(pred.lp2 + citl))
  expect_equal(O/N, Po.restored)
  
  # Derive Pe from Po and citl
  Po.restored2 <- mean(1/(1+(exp(-pred.lp2)*exp(citl))))
  Po.restored3 <- mean(1/2 + 1/2 * tanh((pred.lp2 + citl)/2))
  
  
  # Po <- 1/2 + 1/2 * mean(tanh((pred.lp2 + citl)/2))
  # (Po-0.5)*2 <- mean(tanh((pred.lp2 + citl)/2))
  # tan((Po-0.5)*2) <- pred.lp2 + citl
  
  
})

test_that("Confidence intervals should convert properly", {
  OE <- EuroSCORE$n.events / EuroSCORE$e.events
  tOE.se <- sqrt(1/EuroSCORE$n.events - 1/EuroSCORE$n)
  
  level = 0.95
  OE.95cilb <- exp(log(OE) + qnorm((1-level)/2) * tOE.se)
  OE.95ciub <- exp(log(OE) + qnorm((1+level)/2) * tOE.se)
  
  level = 0.85
  OE.85cilb <- exp(log(OE) + qnorm((1-level)/2) * tOE.se)
  OE.85ciub <- exp(log(OE) + qnorm((1+level)/2) * tOE.se)
  
  
  OE.cilb <- c(OE.95cilb[1:10], OE.85cilb[11:23])
  OE.ciub <- c(OE.95ciub[1:10], OE.85ciub[11:23])   
  OE.cilv <- c(rep(0.95, 10), rep(0.85, length(11:23)))
  
  logOE.se <- (oecalc(OE=OE, OE.cilb=OE.cilb, OE.ciub=OE.ciub, OE.cilv=OE.cilv, g="log(OE)", slab=EuroSCORE$Study))$theta.se
  expect_equal(tOE.se, logOE.se)
})

test_that("Restoration of O and E should be correct", {
  Po <- EuroSCORE$n.events/EuroSCORE$n
  Pe <- EuroSCORE$e.events/EuroSCORE$n
  
  ds <- oecalc(Po=Po, Pe=Pe, N=n, data=EuroSCORE, g="log(OE)")
  
  expect_equal(EuroSCORE$n.events, ds$O, tolerance=1)
  expect_equal(EuroSCORE$e.events, ds$E, tolerance=1)
  
})


test_that("Standard error of log O:E ratio", {
  
  # Poisson distribution for total number of observed events
  logoese1 <- sqrt(1/EuroSCORE$n.events - 1/EuroSCORE$n)
  logoese2 <- sqrt((resoe.O.E.N(O=EuroSCORE$n.events, E=EuroSCORE$e.events, N=EuroSCORE$n, correction = 1/2, g="log(OE)"))[,2])
  logoese3 <- (oecalc(O=n.events, E=e.events, N=n, data=EuroSCORE, g="log(OE)"))$theta.se
  expect_equal(logoese1, logoese2, logoese3)
  
  # Binomial distribution for total number of observed events
  logoese4 <- sqrt(1/EuroSCORE$n.events)
  logoese5 <- sqrt((resoe.O.E(O=EuroSCORE$n.events, E=EuroSCORE$e.events, correction=1/2, g="log(OE)"))[,2])
  logoese6 <- (oecalc(O=EuroSCORE$n.events, E=EuroSCORE$e.events, g="log(OE)"))$theta.se
  expect_equal(logoese4, logoese5, logoese6)
  
  # Mixture of Poisson and Binomial
  n.total <- EuroSCORE$n
  n.total[1:10] <- NA
  logoese7 <- sqrt(1/EuroSCORE$n.events - 1/EuroSCORE$n)
  logoese7[1:10] <- sqrt(1/EuroSCORE$n.events)[1:10]
  logoese8 <- sqrt((resoe.O.E.N(O=EuroSCORE$n.events, E=EuroSCORE$e.events, N=EuroSCORE$n, correction = 1/2, g="log(OE)"))[,2])
  logoese8[1:10] <- sqrt((resoe.O.E(O=EuroSCORE$n.events, E=EuroSCORE$e.events, correction=1/2, g="log(OE)"))[,2])[1:10]
  logoese9 <- (oecalc(O=EuroSCORE$n.events, E=EuroSCORE$e.events, n=n.total, g="log(OE)"))$theta.se
  expect_equal(logoese7, logoese8, logoese8)
  
  # Derive from the 95% confidence interval
  OE <- EuroSCORE$n.events / EuroSCORE$e.events
  tOE.se <- sqrt(1/EuroSCORE$n.events - 1/EuroSCORE$n)
  OE.cilb <- exp(log(OE) + qnorm(0.025) * tOE.se)
  OE.ciub <- exp(log(OE) + qnorm(0.975) * tOE.se)
  tOE.deriv <- resoe.OE.ci(OE=OE, OE.cilb=OE.cilb, OE.ciub=OE.ciub, OE.cilv=rep(0.95,length(OE)), g="log(OE)")
  expect_equal(tOE.se, sqrt(tOE.deriv[,2]))
  
  # Does everything work fine if some studies do not provide any meaningful data?
  O <- EuroSCORE$n.events
  O[1:10] <- NA
  logoese10 <- sqrt(1/O - 1/EuroSCORE$n)
  logoese11 <- sqrt((resoe.O.E(O=O, E=EuroSCORE$e.events, correction=1/2, g="log(OE)"))[,2])
  logoese12 <- (oecalc(O=O, E=EuroSCORE$e.events, g="log(OE)"))$theta.se
  #expect_equal(logoese10, logoese11, logoese12)
  
})


test_that("Study names", {
  oe.est1 <- oecalc(O=n.events, E=e.events, N=n, data=EuroSCORE, g="log(OE)")
  oe.est2 <- oecalc(O=n.events, E=e.events, N=n, data=EuroSCORE, g="log(OE)", slab=Study)
  expect_equal(oe.est1$theta, oe.est2$theta)
})

test_that("EO should convert to OE and appropriate SE", {
  N <- seq(10000, 100000, 10000) #take large sample sizes to ensure that we dont have inequalities due to sampling issues
  O <- hadamard.prod(seq(0.10, 1.00, 0.10), N)
  E <- hadamard.prod(seq(0.10, 1.00, 0.10), N)+5000
  
  # Let's use MCMC to determine var(O/E) and var(E/O)
  n.rep <- 10000
  var.EOi <- var.OEi <- rep(NA, length(N))
  for (i in 1:length(N)) {
    Oi <- rbinom(n.rep, prob=O[i]/N[i], size=N[i])
    var.EOi[i] <- var(E[i]/Oi) #Treat E as fixed
    var.OEi[i] <- var(Oi/E[i]) #Treat E as fixed
  }
  
  oe.est1 <- oecalc(OE = O/E, OE.se = sqrt(var.OEi), g = "log(OE)")
  oe.est2 <- oecalc(EO = E/O, EO.se = sqrt(var.EOi), g = "log(OE)")
  expect_equal(oe.est1$theta, oe.est2$theta)
  expect_equal(oe.est1$theta.se, oe.est2$theta.se, tolerance = .001)
})


