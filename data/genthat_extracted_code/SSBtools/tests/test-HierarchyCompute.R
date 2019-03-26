context("HierarchyCompute")




test_that("handleDuplicated and asInput", {
  
  # Data and hierarchies used in the examples
  x <- SSBtoolsData("sprt_emp")  # Employment in sport in thousand persons from Eurostat database
  geoHier <- SSBtoolsData("sprt_emp_geoHier")
  ageHier <- SSBtoolsData("sprt_emp_ageHier")
  
  # Extend the hierarchy table to illustrate the effect of unionComplement 
  # Omit level since this is handled by autoLevel
  geoHier2 <- rbind(data.frame(mapsFrom = c("EU", "Spain"), mapsTo = "EUandSpain", sign = 1), 
                    geoHier[, -4])
  
  # Two hierarchies and year as rowFactor
  a = HierarchyCompute(x, list(age = ageHier, geo = geoHier2, year = "rowFactor"), "ths_per", verbose = FALSE)
  b = HierarchyCompute(x, list(age = ageHier, geo = geoHier2, year = "colFactor"), "ths_per", verbose = FALSE)
  expect_equal(a, b[, names(a)])
  
  for(handleDuplicated  in c("sumByAggregate", "sumWithWarning", "stop", "single", "singleWithWarning")){
    expect_equal(a, HierarchyCompute(x, list(age = ageHier, geo = geoHier2, year = "rowFactor"), "ths_per", verbose = FALSE,
                                   handleDuplicated = handleDuplicated))
    expect_equal(b, HierarchyCompute(x, list(age = ageHier, geo = geoHier2, year = "colFactor"), "ths_per", verbose = FALSE,
                                     handleDuplicated = handleDuplicated))
  }
    
  x2 <- rbind(x[x$geo == "Iceland", ], x)
  a2 = HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "rowFactor"), "ths_per", verbose = FALSE)
  b2 = HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "colFactor"), "ths_per", verbose = FALSE)
  expect_equal(a2, b2[, names(a2)])
  
  expect_equal(a2, HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "rowFactor"), "ths_per", verbose = FALSE,
                                    handleDuplicated = "sumByAggregate"))
  
  expect_equal(b2, HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "colFactor"), "ths_per", verbose = FALSE,
                                    handleDuplicated = "sumByAggregate"))
  
  
  expect_warning({a2_sumWithWarning <- HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "rowFactor"), "ths_per", verbose = FALSE,
                                   handleDuplicated = "sumWithWarning")})
  
  expect_warning({b2_sumWithWarning <- HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "colFactor"), "ths_per", verbose = FALSE,
                                                        handleDuplicated = "sumWithWarning")})
  
  expect_equal(a2, a2_sumWithWarning)
  expect_equal(b2, b2_sumWithWarning)
  
  
  expect_error(HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "rowFactor"), "ths_per", verbose = FALSE,
                                                        handleDuplicated = "stop"))
  
  expect_error(HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "colFactor"), "ths_per", verbose = FALSE,
                                                        handleDuplicated = "stop"))
  
  
  expect_equal(a, HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "rowFactor"), "ths_per", verbose = FALSE,
                                    handleDuplicated = "single"))
  
  expect_equal(b, HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "colFactor"), "ths_per", verbose = FALSE,
                                    handleDuplicated = "single"))
  
  
  expect_warning({a2_singleWithWarning <- HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "rowFactor"), "ths_per", verbose = FALSE,
                                                        handleDuplicated = "singleWithWarning")})
  
  expect_warning({b2_singleWithWarning <- HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "colFactor"), "ths_per", verbose = FALSE,
                                                        handleDuplicated = "singleWithWarning")})
  
  expect_equal(a, a2_singleWithWarning)
  expect_equal(b, b2_singleWithWarning)
  
  
  
  valueMatrix = HierarchyCompute(x2, list(age = ageHier, geo = geoHier2, year = "rowFactor"), "ths_per", verbose = FALSE, output = "valueMatrix", asInput = TRUE)
  
  expect_equivalent(matrix(x2[, "ths_per"],ncol=1), as.matrix(valueMatrix))
  
})