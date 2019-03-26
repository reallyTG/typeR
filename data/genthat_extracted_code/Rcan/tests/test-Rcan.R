

test_that("Test csu_asr: 1",{

  #input data
  data_test <-  read.csv(system.file("testdata","data_cervix.csv",package="Rcan"), sep=",")

  #output result
  output_test <- csu_asr(data_test,missing_age = 19,
                    group_by  = c("country", "country_label", "year", "sex","type"),
                    var_age_group =  c("country", "country_label","type"))


  expect_test <- readRDS(system.file("testdata","csu_asr_test1.rds",package="Rcan"))

  #test
  expect_equal(output_test, expect_test)
})


test_that("Test age specific: 1",{

  #input data
  
  data(csu_registry_data_1)
  data(csu_registry_data_2)
  data_test <- csu_registry_data_1[csu_registry_data_1$registry_label=="Colombia, Cali",]



  #output result
  output_test <- csu_ageSpecific(data_test,plot_title = "Colombia, Liver, male")

  #expect result
 
  expect_test <- readRDS( system.file("testdata","csu_graph_ageSpecific_test1.rds",package="Rcan"))
  #test
  expect_equal(output_test, expect_test)


})

test_that("Test trend: 1",{
  
  #input data
  data(csu_registry_data_2)
  data_test <- csu_registry_data_2[csu_registry_data_2$registry_label=="Colombia, Cali",]
  
  
  #output result
  data_test$sex <- factor(data_test$sex, levels=c(1,2), labels=c("Male", "Female"))
  data_test <- csu_asr(data_test,missing_age = 99,
                    group_by  = c("registry", "registry_label", "year", "sex"),
                    var_age_group =  c("registry", "registry_label"))
  
  
  
  output_test <- csu_time_trend(data_test, group_by="sex",logscale=TRUE,
                           plot_title = "Colombia, Liver",
                           smoothing = 0.3)
  
  #expect result
 
  expect_test <- readRDS( system.file("testdata","csu_trend_test1.rds",package="Rcan"))
  #test
  expect_equal(output_test, expect_test)

  
  
})


test_that("Test eapc: 1",{
  
  #input data
  data(csu_registry_data_2)
  
  #output result
  data_test <- csu_asr(csu_registry_data_2, 
                    "age", "cases", "py",
                    group_by = c("registry", "registry_label", "sex", "year", "ethnic" ),
                    var_age_group = c("registry_label"), 
                    missing_age = 99)
  
  output_test <- csu_eapc(data_test,
                   "asr", "year",
                   group_by=c("registry", "registry_label", "sex", "ethnic" ))
  
  #expect result
  expect_test <- readRDS(system.file("testdata","csu_eapc_test1.rds",package="Rcan"))
  #test
  expect_equal(output_test, expect_test)

})
