
context("define and execute the ldcp")

test_that("define ldcp", {

  cp_depth <- cp("cp_depth",c("far", "bit far", "good", "close", "very close"))
  pm_depth  <- pm(y=cp_depth, g=function(u,y){ })

  my_glmp <- glmp(list(pm_depth),method= function(a,b){})

  my_report <- report_template(NULL, method = function(a,b){})

  my_data <- data_structure(c(0,1,2),method = function(a){})

  my_ldcp <- ldcp(my_data,my_glmp,my_report)

  expect_that (class(my_ldcp), equals("ldcp"))
  expect_that(my_ldcp$data, equals(my_data))
  expect_that(my_ldcp$glmp, equals(my_glmp))
  expect_that(my_ldcp$report, equals(my_report))

  #Illegal parameter: glmp must be an instance of glmp class
  expect_error(ldcp(my_data,my_report,my_report))

  # Illegal parameter: report must be an instance of report class
  expect_error(ldcp(my_data,my_glmp,my_glmp))

})



