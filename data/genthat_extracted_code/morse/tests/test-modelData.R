# ##
# ## morseData is an internal function
# 
# data("cadmium2")
# 
# survDataset <- survData(cadmium2)
# 
# modelData_SD <- modelData(survDataset , model_type = "SD")
# modelData_IT <- modelData(survDataset , model_type = "IT")
# 
# test_that("modelData",{
#   
#   expect_is(modelData_SD, "list")
#   expect_is(modelData_IT, "list")
#   
#   # dataList
#   expect_named(modelData_SD$dataList,  c("replicate", "time", "conc", "Nsurv", "Nprec",
#                                          "n_data", "tprec"), ignore.order = TRUE)
#   expect_length(modelData_SD$dataList, 7)
#   
#   expect_named(modelData_IT$dataList,  c("replicate", "time", "conc", "Nsurv", "Nprec",
#                                          "n_data", "i_prec", "replicate_ID", "time_ID"),
#                ignore.order = TRUE)
#   expect_length(modelData_IT$dataList, 9)
#   
#   # test length every elements
#   datSD_without_n_data <- modelData_SD$dataList ; datSD_without_n_data$n_data <- NULL
#   expect_equal(unique(sapply(datSD_without_n_data, length)), modelData_SD$dataList$n_data)
#   
#   datIT_without_n_data <- modelData_IT$dataList ; datIT_without_n_data$n_data <- NULL
#   expect_equal(unique(sapply(datIT_without_n_data, length)), modelData_IT$dataList$n_data)
#   
#   # priorsList
#   expect_named(modelData_SD$priorsList, c("kd_meanlog10", "kd_sdlog10", "hb_meanlog10", "hb_sdlog10",
#                                "z_meanlog10", "z_sdlog10", "kk_meanlog10", "kk_sdlog10"), ignore.order = TRUE)
#   expect_length(modelData_SD$priorsList,8)
#   expect_named(modelData_IT$priorsList, c("kd_meanlog10", "kd_sdlog10", "hb_meanlog10", "hb_sdlog10",
#                                "alpha_meanlog10", "alpha_sdlog10", "beta_minlog10", "beta_maxlog10"), ignore.order = TRUE)
#   expect_length(modelData_IT$priorsList,8)
#   
#   # priorsMinMax
#   expect_named(modelData_SD$priorsMinMax, c("conc_max", "conc_min", "kd_max", 
#                                             "kd_min", "hb_min", "hb_max", "kk_min", "kk_max"),
#                ignore.order = TRUE)
#   expect_length(modelData_SD$priorsMinMax,8)
#   expect_named(modelData_IT$priorsMinMax, c("conc_min", "conc_max", "kd_min", "kd_max", "hb_min", "hb_max",
#                                             "beta_min", "beta_max"), ignore.order = TRUE)
#   expect_length(modelData_IT$priorsMinMax,8)
#   
# })
# 
# 
# # Test internal functions gather
# test_that("modelData internal functions",{
#   
#   data_FALSE <- data.frame(replicate = c("A","A","A", "B", "B", "B", "C", "C", "D", "D"),
#                            time= c(1,2,4,1,2,4,1,2,1,2),
#                            conc = rep(2,10))
#   
#   expect_false(checkTimeReplicate(data_FALSE))
# 
# })

