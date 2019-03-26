context("Main: Curve evaluation")
# Test run_evalcurve
#

test_that("run_evalcurve", {
  toolset <- create_toolset(set_names = "crv5")
  testset <- create_testset("curve", "c1")

  res1 <- run_evalcurve(testset, toolset)
  expect_equal(is(res1), "evalcurve")
  expect_equal(length(res1), 6)
  expect_equal(names(res1), c("testscores", "testsum", "catres", "basepoints",
                              "predictions", "titles"))
})

test_that("run_evalcurve: testset", {
  testset1 <- create_testset("curve", c("c1", "c2"))
  testset2 <- create_testset("bench", c("b10", "i10"))
  toolset <- create_toolset(set_names = c("crv5"))

  expect_error(run_evalcurve(testset1, toolset), NA)

  expect_error(run_evalcurve(1, toolset), "testset is not a list")
  expect_error(run_evalcurve("1", toolset), "testset is not a list")
  expect_error(run_evalcurve(list(), toolset), "not greater than 0")
  expect_error(run_evalcurve(toolset, toolset), "Invalid testset")
  expect_error(run_evalcurve(testset2, toolset), "Invalid testset")
})

test_that("run_evalcurve: toolset", {
  testset <- create_testset("curve", c("c1", "c2"))
  toolset1 <- create_toolset(set_names = c("crv5"))
  toolset2 <- create_toolset(set_names = c("auc5"))

  expect_error(run_evalcurve(testset, toolset1), NA)

  expect_error(run_evalcurve(testset, 1), "toolset is not a list")
  expect_error(run_evalcurve(testset, "1"), "toolset is not a list")
  expect_error(run_evalcurve(testset, list()), "not greater than 0")
  expect_error(run_evalcurve(testset, testset), "Invalid toolset")
  expect_error(run_evalcurve(testset, toolset2), "Invalid predifend tool set")
})

test_that("run_evalcurve: toolset & testset", {
  testset <- create_testset("curve", c("c1", "c2"))
  toolset <- create_toolset(c("ROCR", "PRROC", "PerfMeas"))

  res <- run_evalcurve(testset, toolset)

  expect_equal(as.character(res[[2]]$toolname),
               rep(c("ROCR", "PRROC", "PerfMeas"), 2))
  expect_equal(as.character(res[[2]]$testset),
               rep(c("c1", "c2"), each = 3))
})

test_that("run_evalcurve testscores", {
  toolset <- create_toolset(set_names = "crv5")
  testset <- create_testset("curve", "c1")
  res1 <- run_evalcurve(testset, toolset)

  expect_equal(names(res1$testscores), c("testset", "toolset", "toolname",
                                         "testitem", "testcat", "success",
                                         "total"))
  expect_true(all(res1$testscores$testset == "c1"))
  expect_true(all(res1$testscores$toolset == "crv5"))
  expect_true(any(res1$testscores$toolname == "ROCR"))
  expect_true(any(res1$testscores$toolname == "AUCCalculator"))
  expect_true(any(res1$testscores$toolname == "PerfMeas"))
  expect_true(any(res1$testscores$toolname == "PRROC"))
  expect_true(any(res1$testscores$toolname == "precrec"))

  toolset <- create_toolset(set_names = "crv5")
  testset <- create_testset("curve", c("c1", "c2"))
  res2 <- run_evalcurve(testset, toolset)

  expect_equal(names(res2$testscores), c("testset", "toolset", "toolname",
                                         "testitem", "testcat", "success",
                                         "total"))
  expect_true(any(res2$testscores$testset == "c1"))
  expect_true(any(res2$testscores$testset == "c2"))
  expect_true(all(res2$testscores$toolset == "crv5"))
  expect_true(any(res2$testscores$toolname == "ROCR"))
  expect_true(any(res2$testscores$toolname == "AUCCalculator"))
  expect_true(any(res2$testscores$toolname == "PerfMeas"))
  expect_true(any(res2$testscores$toolname == "PRROC"))
  expect_true(any(res2$testscores$toolname == "precrec"))

  toolset <- create_toolset(c("ROCR", "precrec"))
  testset <- create_testset("curve", c("c1", "c2"))
  res3 <- run_evalcurve(testset, toolset)

  expect_equal(names(res3$testscores), c("testset", "toolset", "toolname",
                                         "testitem", "testcat", "success",
                                         "total"))
  expect_true(any(res3$testscores$testset == "c1"))
  expect_true(any(res3$testscores$testset == "c2"))
  expect_true(any(res3$testscores$toolset == "ROCR"))
  expect_true(any(res3$testscores$toolset == "precrec"))
  expect_true(any(res3$testscores$toolname == "ROCR"))
  expect_true(all(res3$testscores$toolname != "AUCCalculator"))
  expect_true(all(res3$testscores$toolname != "PerfMeas"))
  expect_true(all(res3$testscores$toolname != "PRROC"))
  expect_true(any(res3$testscores$toolname == "precrec"))
})

test_that("run_evalcurve testsum", {
  toolset <- create_toolset(set_names = "crv5")
  testset <- create_testset("curve", "c1")
  res1 <- run_evalcurve(testset, toolset)

  expect_equal(names(res1$testsum), c("testset", "toolset", "toolname",
                                      "success", "total", "label", "lbl_pos_x",
                                      "lbl_pos_y", "label2", "lbl_pos_x2",
                                      "lbl_pos_y2"))
  expect_true(all(res1$testsum$testset == "c1"))
  expect_true(all(res1$testsum$toolset == "crv5"))
  expect_true(any(res1$testsum$toolname == "ROCR"))
  expect_true(any(res1$testsum$toolname == "AUCCalculator"))
  expect_true(any(res1$testsum$toolname == "PerfMeas"))
  expect_true(any(res1$testsum$toolname == "PRROC"))
  expect_true(any(res1$testsum$toolname == "precrec"))

  toolset <- create_toolset(set_names = "crv5")
  testset <- create_testset("curve", c("c1", "c2"))
  res2 <- run_evalcurve(testset, toolset)

  expect_equal(names(res2$testsum), c("testset", "toolset", "toolname",
                                      "success", "total", "label", "lbl_pos_x",
                                      "lbl_pos_y", "label2", "lbl_pos_x2",
                                      "lbl_pos_y2"))
  expect_true(any(res2$testsum$testset == "c1"))
  expect_true(any(res2$testsum$testset == "c2"))
  expect_true(all(res2$testsum$toolset == "crv5"))
  expect_true(any(res2$testsum$toolname == "ROCR"))
  expect_true(any(res2$testsum$toolname == "AUCCalculator"))
  expect_true(any(res2$testsum$toolname == "PerfMeas"))
  expect_true(any(res2$testsum$toolname == "PRROC"))
  expect_true(any(res2$testsum$toolname == "precrec"))

  toolset <- create_toolset(c("ROCR", "precrec"))
  testset <- create_testset("curve", c("c1", "c2"))
  res3 <- run_evalcurve(testset, toolset)

  expect_equal(names(res3$testsum), c("testset", "toolset", "toolname",
                                      "success", "total", "label", "lbl_pos_x",
                                      "lbl_pos_y", "label2", "lbl_pos_x2",
                                      "lbl_pos_y2"))
  expect_true(any(res3$testsum$testset == "c1"))
  expect_true(any(res3$testsum$testset == "c2"))
  expect_true(any(res3$testsum$toolset == "ROCR"))
  expect_true(any(res3$testsum$toolset == "precrec"))
  expect_true(any(res3$testsum$toolname == "ROCR"))
  expect_true(all(res3$testsum$toolname != "AUCCalculator"))
  expect_true(all(res3$testsum$toolname != "PerfMeas"))
  expect_true(all(res3$testsum$toolname != "PRROC"))
  expect_true(any(res3$testsum$toolname == "precrec"))
})

test_that("run_evalcurve catres", {
  toolset <- create_toolset(set_names = "crv5")
  testset <- create_testset("curve", "c1")
  res1 <- run_evalcurve(testset, toolset)

  expect_equal(names(res1$catres), c("testset", "testcat", "toolset",
                                     "toolname", "success", "total", "label"))
  expect_true(all(res1$catres$testset == "c1"))
  expect_true(all(res1$catres$toolset == "crv5"))
  expect_true(any(res1$catres$testcat == "SE"))
  expect_true(any(res1$catres$testcat == "Ip"))
  expect_true(any(res1$catres$testcat == "Rg"))
  expect_true(any(res1$catres$toolname == "ROCR"))
  expect_true(any(res1$catres$toolname == "AUCCalculator"))
  expect_true(any(res1$catres$toolname == "PerfMeas"))
  expect_true(any(res1$catres$toolname == "PRROC"))
  expect_true(any(res1$catres$toolname == "precrec"))

  toolset <- create_toolset(set_names = "crv5")
  testset <- create_testset("curve", c("c1", "c2"))
  res2 <- run_evalcurve(testset, toolset)

  expect_equal(names(res2$catres), c("testset", "testcat", "toolset",
                                    "toolname", "success", "total", "label"))
  expect_true(any(res2$catres$testset == "c1"))
  expect_true(any(res2$catres$testset == "c2"))
  expect_true(all(res2$catres$toolset == "crv5"))
  expect_true(any(res2$catres$testcat == "SE"))
  expect_true(any(res2$catres$testcat == "Ip"))
  expect_true(any(res2$catres$testcat == "Rg"))
  expect_true(any(res2$catres$toolname == "ROCR"))
  expect_true(any(res2$catres$toolname == "AUCCalculator"))
  expect_true(any(res2$catres$toolname == "PerfMeas"))
  expect_true(any(res2$catres$toolname == "PRROC"))
  expect_true(any(res2$catres$toolname == "precrec"))

  toolset <- create_toolset(c("ROCR", "precrec"))
  testset <- create_testset("curve", c("c1", "c2"))
  res3 <- run_evalcurve(testset, toolset)

  expect_equal(names(res3$catres), c("testset", "testcat", "toolset",
                                     "toolname", "success", "total", "label"))
  expect_true(any(res3$catres$testset == "c1"))
  expect_true(any(res3$catres$testset == "c2"))
  expect_true(any(res3$catres$testcat == "SE"))
  expect_true(any(res3$catres$testcat == "Ip"))
  expect_true(any(res3$catres$testcat == "Rg"))
  expect_true(any(res3$catres$toolset == "ROCR"))
  expect_true(any(res3$catres$toolset == "precrec"))
  expect_true(any(res3$catres$toolname == "ROCR"))
  expect_true(all(res3$catres$toolname != "AUCCalculator"))
  expect_true(all(res3$catres$toolname != "PerfMeas"))
  expect_true(all(res3$catres$toolname != "PRROC"))
  expect_true(any(res3$catres$toolname == "precrec"))
})

test_that("run_evalcurve basepoints", {
  toolset <- create_toolset(set_names = "crv5")
  testset <- create_testset("curve", "c1")
  res1 <- run_evalcurve(testset, toolset)

  expect_equal(names(res1$basepoints), c("testset", "x", "y"))
  expect_true(all(res1$basepoints$x >= 0) && all(res1$basepoints$x <= 1))
  expect_true(all(res1$basepoints$y >= 0) && all(res1$basepoints$y <= 1))
  expect_true(all(res1$basepoints$testset == "c1"))

  toolset <- create_toolset(set_names = "crv5")
  testset <- create_testset("curve", c("c1", "c2"))
  res2 <- run_evalcurve(testset, toolset)

  expect_equal(names(res2$basepoints), c("testset", "x", "y"))
  expect_true(all(res2$basepoints$x >= 0) && all(res2$basepoints$x <= 1))
  expect_true(all(res2$basepoints$y >= 0) && all(res2$basepoints$y <= 1))
  expect_true(any(res2$basepoints$testset == "c1"))
  expect_true(any(res2$basepoints$testset == "c2"))

  toolset <- create_toolset(c("ROCR", "precrec"))
  testset <- create_testset("curve", c("c1", "c2"))
  res3 <- run_evalcurve(testset, toolset)

  expect_equal(names(res3$basepoints), c("testset", "x", "y"))
  expect_true(all(res3$basepoints$x >= 0) && all(res3$basepoints$x <= 1))
  expect_true(all(res3$basepoints$y >= 0) && all(res3$basepoints$y <= 1))
  expect_true(any(res3$basepoints$testset == "c1"))
  expect_true(any(res3$basepoints$testset == "c2"))
})

test_that("run_evalcurve predictions", {
  toolset <- create_toolset(set_names = "crv5")
  testset <- create_testset("curve", "c1")
  res1 <- run_evalcurve(testset, toolset)

  expect_equal(names(res1$predictions), c("testset", "toolset", "toolname",
                                          "x", "y"))
  expect_true(all(res1$predictions$testset == "c1"))
  expect_true(all(res1$predictions$toolset == "crv5"))
  expect_true(any(res1$predictions$toolname == "ROCR"))
  if (length(unique(res1$predictions$toolset)) == 5) {
    expect_true(any(res1$predictions$toolname == "AUCCalculator"))
  }
  expect_true(any(res1$predictions$toolname == "PerfMeas"))
  expect_true(any(res1$predictions$toolname == "PRROC"))
  expect_true(any(res1$predictions$toolname == "precrec"))

  toolset <- create_toolset(set_names = "crv5")
  testset <- create_testset("curve", c("c1", "c2"))
  res2 <- run_evalcurve(testset, toolset)

  expect_equal(names(res2$predictions), c("testset", "toolset", "toolname",
                                          "x", "y"))
  expect_true(any(res2$predictions$testset == "c1"))
  expect_true(any(res2$predictions$testset == "c2"))
  expect_true(all(res2$predictions$toolset == "crv5"))
  expect_true(any(res2$predictions$toolname == "ROCR"))
  if (length(unique(res1$predictions$toolset)) == 5) {
    expect_true(any(res2$predictions$toolname == "AUCCalculator"))
  }
  expect_true(any(res2$predictions$toolname == "PerfMeas"))
  expect_true(any(res2$predictions$toolname == "PRROC"))
  expect_true(any(res2$predictions$toolname == "precrec"))

  toolset <- create_toolset(c("ROCR", "precrec"))
  testset <- create_testset("curve", c("c1", "c2"))
  res3 <- run_evalcurve(testset, toolset)

  expect_equal(names(res2$predictions), c("testset", "toolset", "toolname",
                                          "x", "y"))
  expect_true(any(res3$predictions$testset == "c1"))
  expect_true(any(res3$predictions$testset == "c2"))
  expect_true(any(res3$predictions$toolset == "ROCR"))
  expect_true(any(res3$predictions$toolset == "precrec"))
  expect_true(any(res3$predictions$toolname == "ROCR"))
  expect_true(all(res3$predictions$toolname != "AUCCalculator"))
  expect_true(all(res3$predictions$toolname != "PerfMeas"))
  expect_true(all(res3$predictions$toolname != "PRROC"))
  expect_true(any(res3$predictions$toolname == "precrec"))
})
