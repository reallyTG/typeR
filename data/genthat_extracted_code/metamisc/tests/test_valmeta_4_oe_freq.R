context("valmeta 4. frequentist meta-analysis of total O:E ratio")
skip_on_cran()

library(lme4)
data(EuroSCORE)


test_that("Fixed effect meta-analysis of total O:E ratio works (Poisson distribution)", {

  # Let's ignore clustering of studies in this test

  fit1.glm <- glm (n.events ~ 1, offset = log(e.events),
                   family = poisson(link = "log"), data = EuroSCORE)

  fit1.valmeta <- with(EuroSCORE, valmeta(measure="OE",
                                          O=n.events,
                                          E=e.events,
                                          test = "z",
                                          method="FE", slab = Study,
                                          pars=list(model.oe="poisson/log")))

  # Now try the same but omit study labels
  fit2.valmeta <- with(EuroSCORE, valmeta(measure="OE",
                                          O=n.events,
                                          E=e.events,
                                          test = "z",
                                          method="FE",
                                          pars=list(model.oe="poisson/log")))

  expect_equal(fit1.valmeta$est, fit2.valmeta$est, exp(as.numeric(coefficients(fit1.glm))))
})

test_that("Random effects meta-analysis of total O:E ratio works (Poisson distribution)", {

  # Let's ignore clustering of studies in this test
  ds <- EuroSCORE
  ds$Study <- c(1:dim(ds)[1]) #Re-assign study labels

  fit1.lme4 <- glmer(n.events ~ 1 | Study, offset = log(e.events),
                     family = poisson(link = "log"), data = ds)

  fit1.valmeta <- with(EuroSCORE, valmeta(measure="OE",
                                          O=n.events,
                                          E=e.events,
                                          test = "z",
                                          method="ML", slab = Study,
                                          pars=list(model.oe="poisson/log")))

  # Now try the same but omit study labels
  fit2.valmeta <- with(EuroSCORE, valmeta(measure="OE",
                                          O=n.events,
                                          E=e.events,
                                          test = "z",
                                          method="ML",
                                          pars=list(model.oe="poisson/log")))

  expect_equal(fit1.valmeta$est, fit2.valmeta$est, exp(as.numeric(fixef(fit1.lme4))))

  # valmeta should still work if some studies cannot be used
  O <- EuroSCORE$n.events
  O[1:10] <- NA
  fit3.valmeta <- valmeta(measure="OE",
                          O=O,
                          E=EuroSCORE$e.events,
                          slab = EuroSCORE$Study,
                          test = "z", method = "ML",
                          pars=list(model.oe="poisson/log"))
  expect_equal(fit3.valmeta$numstudies, sum(!is.na(O)))

  # valmeta should still work if observed event counts are not properly rounded
  O <- EuroSCORE$n.events
  O[1:10] <- O[1:10] + 0.2
  fit4.valmeta <- valmeta(measure="OE",
                          O=O,
                          E=EuroSCORE$e.events,
                          slab = EuroSCORE$Study,
                          test = "z", method = "ML",
                          pars=list(model.oe="poisson/log"))


})

test_that("Generating a plot", {

  expect_is(fit1.valmeta <- with(EuroSCORE, valmeta(measure="OE",
                                          O=n.events,
                                          E=e.events,
                                          test = "z",
                                          method="FE", slab = Study))
            , "valmeta")

  plot(fit1.valmeta)


})

