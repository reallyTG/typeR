library(spartan)
context("Test of Spartan LHC Analysis")

test_that("summarise_lhc_sweep_responses", {

  setup_lhc_result_analysis()
  lhctable <- rbind(cbind(63.8870291068684,0.738687975020334,0.150462160198018,0.0299383036779426,0.866686868487718,0.569160230072564),
                    cbind(97.4719759861007,0.241536056525633,0.127347518739663,0.070033726479502,0.725104774672724,3.19126452945347))
  colnames(lhctable) <-c("thresholdBindProbability","chemoThreshold","chemoUpperLinearAdjust","chemoLowerLinearAdjust","maxVCAMeffectProbabilityCutoff","vcamSlope")

  # Utilises many of spartan's internal functions that have been tested elsewhere,
  # so need to check return value. 2 runs per sample, here only 2 samples
  summary_stats <- summarise_lhc_sweep_responses(getwd(), 2, c("thresholdBindProbability","chemoThreshold","chemoUpperLinearAdjust","chemoLowerLinearAdjust","maxVCAMeffectProbabilityCutoff","vcamSlope"),
                                c("Velocity","Displacement"), "Test_LHC_Result.csv", NULL, 2, lhctable, 1,2)

  # Can now check the make up of these stats
  expect_true(nrow(summary_stats)==4)
  expect_true(ncol(summary_stats)==8)
  expect_equal(toString(summary_stats[,7]),"2.1018076004, 2.15687041465, 2.15687041465, 4.15687041465")
  expect_equal(toString(summary_stats[,8]),"44.0977369078, 43.1842375117, 43.1842375117, 30.6842375117")

  unlink(file.path(getwd(),"1"),recursive = TRUE)
  unlink(file.path(getwd(),"2"),recursive = TRUE)

})

test_that("summarise_replicate_runs", {
  # Setup:
  setup_lhc_result_analysis()
  lhctable <- rbind(cbind(63.8870291068684,0.738687975020334,0.150462160198018,0.0299383036779426,0.866686868487718,0.569160230072564),
                    cbind(97.4719759861007,0.241536056525633,0.127347518739663,0.070033726479502,0.725104774672724,3.19126452945347))
  colnames(lhctable) <-c("thresholdBindProbability","chemoThreshold","chemoUpperLinearAdjust","chemoLowerLinearAdjust","maxVCAMeffectProbabilityCutoff","vcamSlope")
  write.csv(lhctable,"Test_Param_File.csv",quote=F,row.names=F)


  summary_stats <- lhc_process_sample_run_subsets(getwd(), "Test_Param_File.csv",  c("thresholdBindProbability","chemoThreshold","chemoUpperLinearAdjust","chemoLowerLinearAdjust","maxVCAMeffectProbabilityCutoff","vcamSlope"),
                                                  2,2,c("Velocity","Displacement"),"Test_LHC_Result.csv",NULL,1,2,"LHC_Summary_File.csv")

  summary_stats <- read_from_csv(file.path(getwd(),"LHC_Summary_File.csv"))

  # Now can run the summary method:
  summary_table <- summarise_replicate_runs(summary_stats, c("thresholdBindProbability","chemoThreshold","chemoUpperLinearAdjust","chemoLowerLinearAdjust","maxVCAMeffectProbabilityCutoff","vcamSlope"), c("Velocity","Displacement"))

  expect_true(nrow(summary_table)==2)
  expect_true(ncol(summary_table)==8)
  expect_equal(toString(summary_table[1,]),"63.8870291068684, 0.738687975020334, 0.150462160198018, 0.0299383036779426, 0.866686868487718, 0.569160230072564, 2.129339007525, 43.64098720975")
  expect_equal(toString(summary_table[2,]),"97.4719759861007, 0.241536056525633, 0.127347518739663, 0.070033726479502, 0.725104774672724, 3.19126452945347, 3.15687041465, 36.9342375117")

  unlink(file.path(getwd(),"1"),recursive = TRUE)
  unlink(file.path(getwd(),"2"),recursive = TRUE)
  file.remove(file.path(getwd(),"Test_Param_File.csv"))
  file.remove(file.path(getwd(),"LHC_Summary_File.csv"))
})

test_that("lhc_process_sample_run_subsets", {

  # All input has already been checked and those functions tested. The internal functions have been tested
  # We just need to make sure we get sensible output
  # Setup:
  setup_lhc_result_analysis()
  lhctable <- rbind(cbind(63.8870291068684,0.738687975020334,0.150462160198018,0.0299383036779426,0.866686868487718,0.569160230072564),
                    cbind(97.4719759861007,0.241536056525633,0.127347518739663,0.070033726479502,0.725104774672724,3.19126452945347))
  colnames(lhctable) <-c("thresholdBindProbability","chemoThreshold","chemoUpperLinearAdjust","chemoLowerLinearAdjust","maxVCAMeffectProbabilityCutoff","vcamSlope")
  write.csv(lhctable,"Test_Param_File.csv",quote=F,row.names=F)


  summary_stats <- lhc_process_sample_run_subsets(getwd(), "Test_Param_File.csv",  c("thresholdBindProbability","chemoThreshold","chemoUpperLinearAdjust","chemoLowerLinearAdjust","maxVCAMeffectProbabilityCutoff","vcamSlope"),
                                                  2,2,c("Velocity","Displacement"),"Test_LHC_Result.csv",NULL,1,2,"LHC_Summary_File.csv")

  # read in the result file
  expect_true(file.exists(file.path(getwd(),"LHC_Summary_File.csv")))
  result <- read.csv(file.path(getwd(),"LHC_Summary_File.csv"),header=T,sep=",",check.names=F)

  # Can now check the make up of these stats
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==8)
  expect_equal(toString(result[,7]),"2.1018076004, 2.15687041465, 2.15687041465, 4.15687041465")
  expect_equal(toString(result[,8]),"44.0977369078, 43.1842375117, 43.1842375117, 30.6842375117")
  expect_false(any(is.na(result)))

  unlink(file.path(getwd(),"1"),recursive = TRUE)
  unlink(file.path(getwd(),"2"),recursive = TRUE)
  file.remove(file.path(getwd(),"Test_Param_File.csv"))
  file.remove(file.path(getwd(),"LHC_Summary_File.csv"))
})

test_that("lhc_process_sample_run_subsets_overTime", {
  setup_lhc_result_analysis_overtime()
  lhctable <- rbind(cbind(63.8870291068684,0.738687975020334,0.150462160198018,0.0299383036779426,0.866686868487718,0.569160230072564),
                    cbind(97.4719759861007,0.241536056525633,0.127347518739663,0.070033726479502,0.725104774672724,3.19126452945347))
  colnames(lhctable) <-c("thresholdBindProbability","chemoThreshold","chemoUpperLinearAdjust","chemoLowerLinearAdjust","maxVCAMeffectProbabilityCutoff","vcamSlope")
  write.csv(lhctable,"Test_Param_File.csv",quote=F,row.names=F)

  summary_stats <- lhc_process_sample_run_subsets(getwd(), "Test_Param_File.csv",  c("thresholdBindProbability","chemoThreshold","chemoUpperLinearAdjust","chemoLowerLinearAdjust","maxVCAMeffectProbabilityCutoff","vcamSlope"),
                                                  2,2,c("Velocity","Displacement"),"Test_LHC_Result.csv",NULL,1,2,"LHC_Summary_File.csv",c(12,36),"Hours")

  expect_true(file.exists(file.path(getwd(),"LHC_Summary_File_12.csv")))
  result <- read.csv(file.path(getwd(),"LHC_Summary_File_12.csv"),header=T,sep=",",check.names=F)

  expect_true(nrow(result)==4)
  expect_true(ncol(result)==8)
  expect_equal(toString(result[,7]),"2.1018076004, 2.15687041465, 2.15687041465, 4.15687041465")
  expect_equal(toString(result[,8]),"44.0977369078, 43.1842375117, 43.1842375117, 30.6842375117")
  expect_false(any(is.na(result)))

  expect_true(file.exists(file.path(getwd(),"LHC_Summary_File_36.csv")))
  result <- read.csv(file.path(getwd(),"LHC_Summary_File_36.csv"),header=T,sep=",",check.names=F)

  expect_true(nrow(result)==4)
  expect_true(ncol(result)==8)
  expect_equal(toString(result[,7]),"2.15687041465, 4.15687041465, 4.15687041465, 2.1018076004")
  expect_equal(toString(result[,8]),"43.1842375117, 30.6842375117, 30.6842375117, 44.0977369078")
  expect_false(any(is.na(result)))

  unlink(file.path(getwd(),"1"),recursive = TRUE)
  unlink(file.path(getwd(),"2"),recursive = TRUE)
  file.remove(file.path(getwd(),"Test_Param_File.csv"))
  file.remove(file.path(getwd(),"LHC_Summary_File_12.csv"))
  file.remove(file.path(getwd(),"LHC_Summary_File_36.csv"))
})

test_that("calculate_prcc_for_all_measures", {

  load(file.path("Coeff_data_for_test.Rda"))
  load(file.path("LHC_Summary.Rda"))
  PARAMETERS<- c("thresholdBindProbability", "chemoThreshold", "chemoUpperLinearAdjust",
                 "chemoLowerLinearAdjust", "maxVCAMeffectProbabilityCutoff", "vcamSlope")
  COEFFPARAMCOL <- LHCRESULTFILE[, PARAMETERS[1]]
  prccs <- calculate_prcc_for_all_measures(c("Velocity","Displacement"), COEFFPARAMCOL, coeff_data_for_test, LHCRESULTFILE)

  # Check structure:
  expect_true(ncol(prccs)==4)
  expect_true(nrow(prccs)==1)
  # In this case we know what the result should be, so we can check:
  expect_equal(toString(round(prccs,digits=5)),"-0.61257, 0, -0.496, 0")

  # Can now test other methods of prcc calculation
  # recursive:
  prccs <- calculate_prcc_for_all_measures(c("Velocity","Displacement"), COEFFPARAMCOL, coeff_data_for_test, LHCRESULTFILE, cor_calc_method=c("p"),
                                              prcc_method="rec")
  expect_true(ncol(prccs)==4)
  expect_true(nrow(prccs)==1)
  # In this case we know what the result should be, so we can check:
  expect_equal(toString(round(prccs,digits=5)),"-0.55122, 0, -0.44966, 0")
  # Error:
  expect_message(calculate_prcc_for_all_measures(c("Velocity","Displacement"), COEFFPARAMCOL, coeff_data_for_test, LHCRESULTFILE, cor_calc_method=c("p"),
                                                 prcc_method="error"), "Correlation Calculation method needs to be either s,p,or k, and prcc calculation method either rec or mat")

  # Spearmans:
  prccs <- calculate_prcc_for_all_measures(c("Velocity","Displacement"), COEFFPARAMCOL, coeff_data_for_test, LHCRESULTFILE, cor_calc_method=c("p"),
                                           prcc_method="mat")
  expect_true(ncol(prccs)==4)
  expect_true(nrow(prccs)==1)
  # In this case we know what the result should be, so we can check:
  expect_equal(toString(round(prccs,digits=5)),"-0.55122, 0, -0.44966, 0")

  prccs <- calculate_prcc_for_all_measures(c("Velocity","Displacement"), COEFFPARAMCOL, coeff_data_for_test, LHCRESULTFILE, cor_calc_method=c("k"),
                                           prcc_method="mat")

  expect_true(ncol(prccs)==4)
  expect_true(nrow(prccs)==1)
  # In this case we know what the result should be, so we can check:
  expect_equal(toString(round(prccs,digits=5)),"-0.23913, 0, -0.21073, 0")

  # Error
  expect_message(calculate_prcc_for_all_measures(c("Velocity","Displacement"), COEFFPARAMCOL, coeff_data_for_test, LHCRESULTFILE, cor_calc_method=c("e"),
                                                 prcc_method="mat"), "Correlation Calculation method needs to be either s,p,or k, and prcc calculation method either rec or mat")


})

test_that("calculate_prccs_all_parameters", {

  load(file.path("LHC_Summary.Rda"))
  PARAMETERS<- c("thresholdBindProbability", "chemoThreshold", "chemoUpperLinearAdjust",
                 "chemoLowerLinearAdjust", "maxVCAMeffectProbabilityCutoff", "vcamSlope")
  results <- calculate_prccs_all_parameters(PARAMETERS, LHCRESULTFILE, c("Velocity","Displacement"))

  # Check structure of results
  expect_true(ncol(results)==4)
  expect_true(nrow(results)==6)
  expect_false(any(is.na(results)))

  # We can check the data to known results
  expect_equal(toString(round(results[,1],digits=5)),"-0.61257, -0.23544, -0.03522, -0.38037, -0.96561, -0.10538")
  expect_equal(toString(round(results[,2],digits=5)),"0, 0, 0.43627, 0, 0, 0.01923")
  expect_equal(toString(round(results[,3],digits=5)),"-0.496, -0.67588, 0.01668, -0.79009, -0.82014, -0.06463")
  expect_equal(toString(round(results[,4],digits=5)),"0, 0, 0.71256, 0, 0, 0.1525")
})

test_that("lhc_generatePRCoEffs_overTime", {

  # Setup:
  load(file.path("LHC_Summary.Rda"))
  load(file.path("LHC_Summary_36.Rda"))
  write.csv(LHCRESULTFILE,file="LHC_Results_12.csv",row.names=T,quote=F)
  write.csv(LHCRESULTFILE_36,file="LHC_Results_36.csv",row.names=T,quote=F)

  # All internal functions have been checked - we now just need to check output
  lhc_generatePRCoEffs(
    getwd(), c("thresholdBindProbability", "chemoThreshold", "chemoUpperLinearAdjust",
               "chemoLowerLinearAdjust", "maxVCAMeffectProbabilityCutoff", "vcamSlope"),
    c("Velocity","Displacement"), "LHC_Results.csv", "Prcc_Out.csv",c(12,36),"Hours")

  # Check files exist
  expect_true(file.exists(file.path("Prcc_Out_12.csv")))
  expect_true(file.exists(file.path("Prcc_Out_36.csv")))

  # Read in file and check structure
  resultIn<- read.csv(file.path("Prcc_Out_12.csv"),header=T,sep=",")

  # Check structure of results
  expect_true(ncol(resultIn)==5)
  expect_true(nrow(resultIn)==6)
  expect_false(any(is.na(resultIn)))

  resultIn<- read.csv(file.path("Prcc_Out_36.csv"),header=T,sep=",")

  # Check structure of results
  expect_true(ncol(resultIn)==5)
  expect_true(nrow(resultIn)==6)
  expect_false(any(is.na(resultIn)))

  file.remove(file.path("LHC_Results_12.csv"))
  file.remove(file.path("LHC_Results_36.csv"))
  file.remove(file.path("Prcc_Out_36.csv"))
  file.remove(file.path("Prcc_Out_12.csv"))

})

test_that("lhc_generatePRCoEffs", {

  # Setup:
  load(file.path("LHC_Summary.Rda"))
  # Write to file so can be read in
  write.csv(LHCRESULTFILE,file="LHC_Results.csv",row.names=T,quote=F)

  # All internal functions have been checked - we now just need to check output
  lhc_generatePRCoEffs(
    getwd(), c("thresholdBindProbability", "chemoThreshold", "chemoUpperLinearAdjust",
               "chemoLowerLinearAdjust", "maxVCAMeffectProbabilityCutoff", "vcamSlope"), c("Velocity","Displacement"), "LHC_Results.csv", "Prcc_Out.csv")

  # Read in file and check structure
  resultIn<- read.csv("Prcc_Out.csv",header=T,sep=",")

  # Check structure of results
  expect_true(ncol(resultIn)==5)
  expect_true(nrow(resultIn)==6)
  expect_false(any(is.na(resultIn)))

  # We can check the data to known results
  expect_equal(toString(round(resultIn[,2],digits=5)),"-0.61257, -0.23544, -0.03522, -0.38037, -0.96561, -0.10538")
  expect_equal(toString(round(resultIn[,3],digits=5)),"0, 0, 0.43627, 0, 0, 0.01923")
  expect_equal(toString(round(resultIn[,4],digits=5)),"-0.496, -0.67588, 0.01668, -0.79009, -0.82014, -0.06463")
  expect_equal(toString(round(resultIn[,5],digits=5)),"0, 0, 0.71256, 0, 0, 0.1525")

  file.remove(file.path(getwd(),"LHC_Results.csv"))
  file.remove(file.path(getwd(),"Prcc_Out.csv"))
})

test_that("calculate_medians_for_all_measures", {

  load(file.path("LHC_Param_Result_For_Testing.Rda"))

  # Check medians calculated correctly
  medians <- calculate_medians_for_all_measures(cbind(63.88703,0.738688,0.1504622,0.0299383,0.8666869,0.5691602), param_result,
                                                 c("Velocity","Displacement"))

  # Check structure
  expect_true(nrow(medians)==1)
  expect_true(ncol(medians)==8)
  expect_false(any(is.na(medians)))

  # Check data
  expect_equal(toString(medians[1,]),"63.88703, 0.738688, 0.1504622, 0.0299383, 0.8666869, 0.5691602, 1.08958863106698, 27.9770280485774")

})

test_that("lhc_generateLHCSummary", {

  # All internal functions checked - need to now check that we get output
  # Setup - data contains a few samples - the complete 500 sets of 500 runs was too big for an R package
  load("LHC_Sim_Data_For_Test.Rda")
  # write this so it can be read in
  write.csv(lhc_sim_data_for_test,file="LHC_Sim_Data_For_Test.csv",row.names=F, quote=F)

  lhc_generateLHCSummary(getwd(), c("thresholdBindProbability", "chemoThreshold", "chemoUpperLinearAdjust",
                                                "chemoLowerLinearAdjust", "maxVCAMeffectProbabilityCutoff", "vcamSlope"),
                                     c("Velocity","Displacement"), "LHC_Sim_Data_For_Test.csv", "LHC_Summary.csv")

  # Check structure
  expect_true(file.exists("LHC_Summary.csv"))
  result<-read.csv("LHC_Summary.csv",header=T,sep=",")
  expect_true(nrow(result)==3)
  expect_true(ncol(result)==8)
  expect_false(any(is.na(result)))

  # Check data
  expect_equal(toString(result[1,]),"63.8870291068684, 0.738687975020334, 0.150462160198018, 0.0299383036779426, 0.866686868487718, 0.569160230072564, 1.08958863106698, 27.9770280485774")
  expect_equal(toString(result[2,]),"97.4719759861007, 0.241536056525633, 0.127347518739663, 0.070033726479502, 0.725104774672724, 3.19126452945347, 1.79095368197744, 28.9958618811378")
  expect_equal(toString(result[3,]),"12.400164475292, 0.713222049494088, 0.324178139681555, 0.0531356689167907, 0.65061536949831, 4.91505450518127, 2.86249336792086, 36.2925556443294")

  file.remove(file.path(getwd(),"LHC_Summary.csv"))
  file.remove(file.path(getwd(),"LHC_Sim_Data_For_Test.csv"))

})

test_that("lhc_generateLHCSummary_overTime", {

  # Setup:
  # Going to use the test dataset as hour 12
  load("LHC_Sim_Data_For_Test.Rda")
  write.csv(lhc_sim_data_for_test,file="LHC_Sim_Data_For_Test_12.csv",row.names=F, quote=F)
  # Then we have an hour 36 dataset
  load("LHC_Sim_Data_For_Test_36.Rda")
  write.csv(lhc_sim_data_for_test_36,file="LHC_Sim_Data_For_Test_36.csv",row.names=F, quote=F)

  lhc_generateLHCSummary(getwd(), c("thresholdBindProbability", "chemoThreshold", "chemoUpperLinearAdjust",
                                    "chemoLowerLinearAdjust", "maxVCAMeffectProbabilityCutoff", "vcamSlope"),
                         c("Velocity","Displacement"), "LHC_Sim_Data_For_Test.csv", "LHC_Summary.csv",TIMEPOINTS=c(12,36),
                         TIMEPOINTSCALE="Hours")

  # Check structure
  expect_true(file.exists("LHC_Summary_12.csv"))
  result<-read.csv("LHC_Summary_12.csv",header=T,sep=",")
  expect_true(nrow(result)==3)
  expect_true(ncol(result)==8)
  expect_false(any(is.na(result)))

  # Check data
  expect_equal(toString(result[1,]),"63.8870291068684, 0.738687975020334, 0.150462160198018, 0.0299383036779426, 0.866686868487718, 0.569160230072564, 1.08958863106698, 27.9770280485774")
  expect_equal(toString(result[2,]),"97.4719759861007, 0.241536056525633, 0.127347518739663, 0.070033726479502, 0.725104774672724, 3.19126452945347, 1.79095368197744, 28.9958618811378")
  expect_equal(toString(result[3,]),"12.400164475292, 0.713222049494088, 0.324178139681555, 0.0531356689167907, 0.65061536949831, 4.91505450518127, 2.86249336792086, 36.2925556443294")

  expect_true(file.exists("LHC_Summary_36.csv"))
  result<-read.csv("LHC_Summary_36.csv",header=T,sep=",")
  expect_true(nrow(result)==3)
  expect_true(ncol(result)==8)
  expect_false(any(is.na(result)))

  # Check data
  expect_equal(toString(result[1,]),"63.8870291068684, 0.738687975020334, 0.150462160198018, 0.0299383036779426, 0.866686868487718, 0.569160230072564, 1.91462180475669, 28.5928070217056")
  expect_equal(toString(result[2,]),"97.4719759861007, 0.241536056525633, 0.127347518739663, 0.070033726479502, 0.725104774672724, 3.19126452945347, 2.05418836664286, 26.3628999199738")
  expect_equal(toString(result[3,]),"12.400164475292, 0.713222049494088, 0.324178139681555, 0.0531356689167907, 0.65061536949831, 4.91505450518127, 3.18666366897408, 31.010721896747")

  file.remove(file.path(getwd(),"LHC_Summary_12.csv"))
  file.remove(file.path(getwd(),"LHC_Summary_36.csv"))
  file.remove(file.path(getwd(),"LHC_Sim_Data_For_Test_12.csv"))
  file.remove(file.path(getwd(),"LHC_Sim_Data_For_Test_36.csv"))
})

test_that("lhc_process_netlogo_result", {
  # Check that some summary output is achieved from netlogo analysis

  # Need to create some output - say 3 samples
  dir.create(file.path(getwd(),"1"))
  dir.create(file.path(getwd(),"2"))
  dir.create(file.path(getwd(),"3"))
  # Setup the files
  # Analysis skips the first 6 lines, so need to have some data in there that can be skipped
  skip_line<-cbind(0,0,0,0,0,0,0,0,0,0)
  samp1<-rbind(skip_line,skip_line,skip_line,skip_line,skip_line)
  samp2<-rbind(skip_line,skip_line,skip_line,skip_line,skip_line)
  samp3<-rbind(skip_line,skip_line,skip_line,skip_line,skip_line)
  samp1<-rbind(samp1,cbind("[run number]","people","infectiousness","chance-recover","duration","[step]","death-thru-sickness","death-but-immune","death-old-age","death-old-and-sick"))
  samp2<-rbind(samp2,cbind("[run number]","people","infectiousness","chance-recover","duration","[step]","death-thru-sickness","death-but-immune","death-old-age","death-old-and-sick"))
  samp3<-rbind(samp3,cbind("[run number]","people","infectiousness","chance-recover","duration","[step]","death-thru-sickness","death-but-immune","death-old-age","death-old-and-sick"))
  samp1<-rbind(samp1,cbind("1","150","84.6993822547048","63.6780966711044","29.6453358204709","5200","17513","30722","44","59"))
  samp2<-rbind(samp2,cbind("1","150","22.6519469891489","13.7841268616915","24.1213734486513","5200","42758","6773","316","1314"))
  samp3<-rbind(samp3,cbind("1","150","49.9834824550524","26.2489275322109","13.6645698722941","5200","58969","20596","67","33"))

  # Write to file
  write.csv(samp1,file=file.path(getwd(),"1","lhcResult1.csv"),row.names=F)
  write.csv(samp1,file=file.path(getwd(),"2","lhcResult2.csv"))
  write.csv(samp1,file=file.path(getwd(),"3","lhcResult3.csv"))
  # Parameter file
  param_file<-rbind(cbind(84.6993822547048,63.6780966711044,29.6453358204709),
                    cbind(22.6519469891489,13.7841268616915,24.1213734486513),
                    cbind(49.9834824550524,26.2489275322109,13.6645698722941))
  colnames(param_file) <- c("infectiousness","chance-recover","duration")
  write.csv(param_file,file="Netlogo_Spartan_Param_File.csv",row.names=F,quote=F)

  # Now for the analysis
  lhc_process_netlogo_result(getwd(), "lhcResult",
                             "Netlogo_Spartan_Param_File.csv", 3,
                              c("death-thru-sickness","death-but-immune","death-old-age","death-old-and-sick"), "Virus_LHCSummary_Medians.csv",
                                         5200)

  # Check existence and structure
  expect_true(file.exists("Virus_LHCSummary_Medians.csv"))
  result<-read.csv("Virus_LHCSummary_Medians.csv",header=T,sep=",")
  expect_true(nrow(result)==3)
  expect_true(ncol(result)==7)
  expect_false(any(is.na(result)))

  # Check values to known results
  expect_equal(toString(result[1,]),"84.6993822547048, 63.6780966711044, 29.6453358204709, 17513, 30722, 44, 59")
  expect_equal(toString(result[2,]),"22.6519469891489, 13.7841268616915, 24.1213734486513, 17513, 30722, 44, 59")
  expect_equal(toString(result[3,]),"49.9834824550524, 26.2489275322109, 13.6645698722941, 17513, 30722, 44, 59")

  # Teardown
  unlink(file.path(getwd(),"1"),recursive = TRUE)
  unlink(file.path(getwd(),"2"),recursive = TRUE)
  unlink(file.path(getwd(),"3"),recursive = TRUE)
  file.remove(file.path(getwd(),"Virus_LHCSummary_Medians.csv"))
  file.remove(file.path(getwd(),"Netlogo_Spartan_Param_File.csv"))

  # What if file doesn't exist
  expect_message(lhc_process_netlogo_result(getwd(), "lhcResult",
                                            "Netlogo_Spartan_Param_File.csv", 1,
                                            c("death-thru-sickness","death-but-immune","death-old-age","death-old-and-sick"), "Virus_LHCSummary_Medians.csv",
                                            5200),"Error in finding files required for Spartan Netlogo Analysis")

  })

test_that("lhc_generate_netlogo_PRCoEffs", {
  expect_message(lhc_generate_netlogo_PRCoEffs(getwd(), c("A","B"), c("Velocity","Displacement"),
                                            "LHCSUMMARY.csv",
                                            "CORCOEFFS.csv"), "Now deprecated. Use lhc_generatePRCoEffs instead")
})

test_that("lhc_calculatePRCCForMultipleTimepoints", {
  load(file.path("LHC_Summary.Rda"))
  load(file.path("LHC_Summary_36.Rda"))
  write.csv(LHCRESULTFILE,file="LHC_Results_12.csv",row.names=T,quote=F)
  write.csv(LHCRESULTFILE_36,file="LHC_Results_36.csv",row.names=T,quote=F)

  # All internal functions have been checked - we now just need to check output
  lhc_generatePRCoEffs(
    getwd(), c("thresholdBindProbability", "chemoThreshold", "chemoUpperLinearAdjust",
               "chemoLowerLinearAdjust", "maxVCAMeffectProbabilityCutoff", "vcamSlope"),
    c("Velocity","Displacement"), "LHC_Results.csv", "Prcc_Out.csv",c(12,36),"Hours")

  lhc_calculatePRCCForMultipleTimepoints(getwd(), "Prcc_Out.csv", c(12,36), c("Velocity","Displacement"))

  expect_true(file.exists(file.path(getwd(),"All_Timepoint_PRCCS_Displacement.csv")))
  expect_true(file.exists(file.path(getwd(),"All_Timepoint_PRCCS_Velocity.csv")))
  expect_true(file.exists(file.path(getwd(),"All_Timepoint_PVALS_Displacement.csv")))
  expect_true(file.exists(file.path(getwd(),"All_Timepoint_PVALS_Velocity.csv")))

  expect_message(lhc_calculatePRCCForMultipleTimepoints(getwd(), "Prcc_Out.csv", c(24), c("Velocity","Displacement")), "Correlation Coefficients file for Timepoint 24 does not exist")

  file.remove(file.path("LHC_Results_12.csv"))
  file.remove(file.path("LHC_Results_36.csv"))
  file.remove(file.path("Prcc_Out_36.csv"))
  file.remove(file.path("Prcc_Out_12.csv"))
  file.remove(file.path(getwd(),"All_Timepoint_PVALS_Displacement.csv"))
  file.remove(file.path(getwd(),"All_Timepoint_PVALS_Velocity.csv"))
  file.remove(file.path(getwd(),"All_Timepoint_PRCCS_Velocity.csv"))
  file.remove(file.path(getwd(),"All_Timepoint_PRCCS_Displacement.csv"))
})
