library(welchADF)

context("welchADF data.frame interface")

test_that("Function confint in perceptionData ", {
  pairwise_trimmed = welchADF.test(perceptionData , response = "y", between.s = "Group",
                                   effect = "Group", contrast = "all.pairwise", trimming = TRUE, effect.size = TRUE);
  expect_true({
    print(confint(pairwise_trimmed))
    TRUE
  })
})

test_that("welchADF.test in a two-way between-factor model", {
  
  # Just check this runs without errors
  expect_true({
    omnibus_LSM = welchADF.test(womenStereotypeData, response = "y", between.s =
                                c("condition", "sex"), contrast = "omnibus")
    print(omnibus_LSM)
    print(summary(omnibus_LSM))
    TRUE})
  
  expect_true({
    omnibus_trimmed = welchADF.test(womenStereotypeData, response = "y", between.s =
                                      c("condition", "sex"), contrast = "omnibus", trimming = TRUE)
    print(omnibus_trimmed)
    print(summary(omnibus_trimmed))
    TRUE})
  
  expect_true({
    pairwise_LSM = welchADF.test(womenStereotypeData, response = "y", between.s =
                                   c("condition", "sex"), contrast = "all.pairwise", effect = c("condition", "sex"))
    print(pairwise_LSM)
    print(summary(pairwise_LSM))
    TRUE})
  
  expect_true({
    pairwise_trimmed = welchADF.test(womenStereotypeData, response = "y", between.s =
                c("condition", "sex"), contrast = "all.pairwise", effect = c("condition", "sex"), trimming = TRUE)
    print(pairwise_trimmed)
    print(summary(pairwise_trimmed))
    TRUE})
  
  expect_true({
    pairwise_trimmed_boot = welchADF.test(womenStereotypeData, response = "y", between.s =
              c("condition", "sex"), contrast = "all.pairwise", effect = c("condition", "sex"),
              trimming = TRUE, bootstrap = TRUE, seed = 12345)
    print(pairwise_trimmed_boot)
    print(summary(pairwise_trimmed_boot))
    TRUE})
})

test_that("welchADF.test in a one-way between x within subjects model with two different arrangements of data", {
  
  # just check it runs without errors
  expect_true({
    omnibus_LSM_multi = welchADF.test(adhdData, response = c("TargetAlone", "Congruent",
      "Neutral", "Incongruent"), within.s = "multivariate", between.s = "Group", contrast = "omnibus");
    print(omnibus_LSM_multi)
    print(summary(omnibus_LSM_multi))
    TRUE})
  
  expect_true({
    omnibus_LSM = welchADF.test(adhdData2, response = "Milliseconds",
                                between.s = "Group", within.s = "Stimulus", subject = "Subject", contrast = "omnibus");
    print(omnibus_LSM)
    print(summary(omnibus_LSM))
    TRUE})  
  
  expect_true({
    omnibus_trimmed = welchADF.test(adhdData2, response = "Milliseconds",
      between.s = "Group", within.s = "Stimulus", subject = "Subject", contrast = "omnibus", trimming = TRUE);
    print(omnibus_trimmed)
    print(summary(omnibus_trimmed))
    TRUE})
  
  expect_true({  
    omnibus_trimmed_boot = welchADF.test(adhdData2, response = "Milliseconds",
      between.s = "Group", within.s = "Stimulus", subject = "Subject", contrast = "omnibus", trimming = TRUE, bootstrap = TRUE, seed = 12345);
    print(omnibus_trimmed_boot)
    print(summary(omnibus_trimmed_boot))
    TRUE})
})

test_that("welchADF.test in a doubly-multivariate design", {
  
  # just check it runs without errors
  expect_true({
    omnibus_LSM = welchADF.test(miceData, response = c("visits", "time", "latency"),
                              between.s = "nurs", within.s = "tunnel", subject = "Subject", contrast = "omnibus")
    print(omnibus_LSM)
    print(summary(omnibus_LSM))
    TRUE})
  expect_true({
    pairwise_LSM_nurs = welchADF.test(miceData, response = c("visits", "time",
      "latency"), between.s = "nurs", within.s = "tunnel", subject = "Subject", effect = "nurs", contrast = "all.pairwise")
    print(pairwise_LSM_nurs)
    print(summary(pairwise_LSM_nurs))
    TRUE})
  expect_true({
    pairwise_LSM_tunnel = welchADF.test(miceData, response = c("visits", "time",
      "latency"), between.s = "nurs", within.s = "tunnel", subject = "Subject", effect = "tunnel", contrast = "all.pairwise")
    print(pairwise_LSM_tunnel)
    print(summary(pairwise_LSM_tunnel, verbose = TRUE))
    TRUE})
  expect_true({
    pairwise_nurs_trimmed_boot = welchADF.test(miceData, response = c("visits", "time",
      "latency"), between.s = "nurs", within.s = "tunnel", subject = "Subject", effect = "nurs", contrast = "all.pairwise", trimming = TRUE, bootstrap = TRUE)
    print(pairwise_nurs_trimmed_boot)
    print(summary(pairwise_nurs_trimmed_boot, verbose = TRUE))
    TRUE})
  expect_true({
    pairwise_tunnel_trimmed_boot = welchADF.test(miceData, response = c("visits", "time",
      "latency"), between.s = "nurs", within.s = "tunnel", subject = "Subject", effect =
      "tunnel", contrast = "all.pairwise", trimming = TRUE, bootstrap = TRUE)
    print(pairwise_tunnel_trimmed_boot)
    print(summary(pairwise_tunnel_trimmed_boot, verbose = TRUE))
    TRUE})
})