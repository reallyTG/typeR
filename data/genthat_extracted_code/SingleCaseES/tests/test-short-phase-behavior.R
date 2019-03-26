context("Handling phases with a single observation.")

A1 <- rbinom(1, 15, 0.3) * 100 / 15

B1 <- rbinom(1, 15, 0.2) * 100 / 15
while (A1 == B1) B1 <- rbinom(1, 15, 0.2) * 100 / 15

A3 <- rbinom(3, 14:16, 0.3) * 100 / (14:16)
while (B1 %in% A3) A3 <- rbinom(3, 14:16, 0.3) * 100 / (14:16)

B3 <- rbinom(3, 14:16, 0.2) * 100 / (14:16)
while (A1 %in% B3) B3 <- rbinom(3, 14:16, 0.2) * 100 / (14:16)

test_that("calc_ES() works with single observation in baseline.", {
  
  expect_warning(calc_ES(A_data = A1, B_data = B3, 
    improvement = "decrease", scale = "percentage",
    ES = c("LOR","LRRd","LRRi")))
  
  expect_error(calc_ES(A_data = A1, B_data = B3, 
                       improvement = "decrease", scale = "percentage",
                       ES = "SMD", warn = FALSE))
  
  expect_warning(calc_ES(A_data = A1, B_data = B3, 
                         improvement = "decrease", scale = "percentage",
                         ES = "SMD", std_dev = "pool"))
  
  NAP_Tau <- calc_ES(A_data = A1, B_data = B3, 
                     improvement = "decrease", ES = c("NAP","Tau"),
                     confidence = NULL)
  expect_true(all(is.nan(NAP_Tau$SE)))
  
  NOMs <- calc_ES(A_data = A1, B_data = B3, 
                  improvement = "decrease", ES = c("NAP","Tau","PND","PAND","PEM","IRD","Tau-U"),
                  confidence = NULL, format = "wide")
  expect_identical(NOMs$NAP_Est, NOMs$PEM_Est)
  expect_identical(NOMs$NAP_Est, NOMs$PND_Est)
  expect_equal(NOMs$Tau_Est, NOMs$`Tau-U_Est`)
})

test_that("calc_ES() works with single observation in treatment", {
  
  expect_warning(calc_ES(A_data = A3, B_data = B1, 
                         improvement = "decrease", scale = "percentage",
                         ES = c("LOR","LRRd","LRRi")))
  
  expect_warning(calc_ES(A_data = A3, B_data = B1, 
                         improvement = "decrease", scale = "percentage",
                         ES = "SMD"))
  
  expect_warning(calc_ES(A_data = A3, B_data = B1, 
                         improvement = "decrease", scale = "percentage",
                         ES = "SMD", std_dev = "pool"))
  
  NAP_Tau <- calc_ES(A_data = A3, B_data = B1, 
                     improvement = "decrease", ES = c("NAP","Tau"),
                     confidence = NULL)
  expect_true(all(is.nan(NAP_Tau$SE)))
  
  NOMs <- calc_ES(A_data = A1, B_data = B3, 
                  improvement = "decrease", ES = c("NAP","Tau","PND","PAND","PEM","IRD","Tau-U"),
                  confidence = NULL, format = "wide")
  expect_identical(NOMs$NAP_Est, NOMs$PEM_Est)
  expect_identical(NOMs$NAP_Est, NOMs$PND_Est)
  expect_equal(NOMs$Tau_Est, NOMs$`Tau-U_Est`)
})

test_that("calc_ES() works with single observation in each phase", {
  
  expect_warning(calc_ES(A_data = A1, B_data = B1, 
                         improvement = "decrease", scale = "percentage",
                         ES = c("LOR","LRRd","LRRi")))
  
  ratio_measures <- calc_ES(A_data = A1, B_data = B1, 
                            improvement = "decrease", scale = "percentage",
                            ES = c("LOR","LRRd","LRRi"), warn = FALSE)
  expect_true(all(is.na(ratio_measures$Est)))
  expect_true(all(is.na(ratio_measures$SE)))
  
  expect_error(calc_ES(A_data = A1, B_data = B1, 
                       improvement = "decrease", scale = "percentage",
                       ES = "SMD", warn = FALSE))
  
  expect_error(calc_ES(A_data = A1, B_data = B1, 
                         improvement = "decrease", scale = "percentage",
                         ES = "SMD", std_dev = "pool", warn = FALSE))
  
  NAP_Tau <- calc_ES(A_data = A1, B_data = B1, 
                     improvement = "decrease", ES = c("NAP","Tau"),
                     confidence = NULL)
  expect_true(all(is.nan(NAP_Tau$SE)))
  
  NOMs <- calc_ES(A_data = A1, B_data = B1, 
                  improvement = "decrease", ES = c("NAP","Tau","PND","PAND","PEM","IRD","Tau-U"),
                  confidence = NULL, format = "wide")
  expect_identical(NOMs$NAP_Est, NOMs$PEM_Est)
  expect_identical(NOMs$NAP_Est, NOMs$PND_Est)
  expect_equal(NOMs$Tau_Est, NOMs$`Tau-U_Est`)
})

test_that("calc_ES() works with three observations in each phase.", {
  
  ES_SE <- calc_ES(A_data = A3, B_data = B3, improvement = "decrease", scale = "percentage", ES = c("LOR","LRRd","LRRi","SMD","NAP","Tau"))
  
  expect_identical(names(ES_SE), c("ES","Est","SE","CI_lower","CI_upper"))
  
  NOMs <- calc_ES(A_data = A3, B_data = B3, improvement = "decrease", ES = c("PND","PAND","PEM","IRD","Tau-U"))
  
  expect_identical(names(NOMs), c("ES","Est"))
  
})

