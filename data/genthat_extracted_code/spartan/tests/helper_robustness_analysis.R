make_test_sim_result_file <- function(filePath, variation)
{
  if(variation==1)
  {
    # Make a test file
    result <- cbind(6.8,65.0885278894)
    result <- rbind(result,cbind(2.0744955518,51.5400494906))
    result <- rbind(result,cbind(1.6685778396,36.655424325))
    result <- rbind(result,cbind(2.129119649,24.0564354369))
  }
  else if(variation==2)
  {
    result <- cbind(2.8976989449,91.4103843638)
    result <- rbind(result,cbind(2.4649829961,27.1394617466))
    result <- rbind(result,cbind(1.6962630223,30.048049107))
    result <- rbind(result,cbind(1.8487578332,56.3204259164))
  }
  else
  {
    result <- cbind(5.8976989449,81.4103843638)
    result <- rbind(result,cbind(3.4649829961,24.1394617466))
    result <- rbind(result,cbind(2.6962630223,25.048049107))
    result <- rbind(result,cbind(4.8487578332,36.3204259164))
  }
  colnames(result) <- c("Velocity","Displacement")
  write.csv(result,file=filePath,quote=F,row.names=F)
}

setup_multiple_parameter_result_analysis <- function()
{
  # Some setup here
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.05"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.05","1"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.1"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.1","1"))
  make_test_sim_result_file(paste(getwd(),"/chemoLowerLinearAdjust/0.05/1/Test_Robustness_Result.csv",sep=""),1)
  make_test_sim_result_file(paste(getwd(),"/chemoLowerLinearAdjust/0.1/1/Test_Robustness_Result.csv",sep=""),2)
  dir.create(file.path(getwd(),"chemoUpperLinearAdjust"))
  dir.create(file.path(getwd(),"chemoUpperLinearAdjust","1"))
  dir.create(file.path(getwd(),"chemoUpperLinearAdjust","1","1"))
  dir.create(file.path(getwd(),"chemoUpperLinearAdjust","2"))
  dir.create(file.path(getwd(),"chemoUpperLinearAdjust","2","1"))
  make_test_sim_result_file(paste(getwd(),"/chemoUpperLinearAdjust/1/1/Test_Robustness_Result.csv",sep=""),2)
  make_test_sim_result_file(paste(getwd(),"/chemoUpperLinearAdjust/2/1/Test_Robustness_Result.csv",sep=""),1)
}

setup_multiple_parameter_result_analysis_overTime <- function()
{
  # Some setup here
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.05"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.05","1"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.1"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.1","1"))
  make_test_sim_result_file(paste(getwd(),"/chemoLowerLinearAdjust/0.05/1/Test_Robustness_Result_12.csv",sep=""),1)
  make_test_sim_result_file(paste(getwd(),"/chemoLowerLinearAdjust/0.05/1/Test_Robustness_Result_36.csv",sep=""),3)
  make_test_sim_result_file(paste(getwd(),"/chemoLowerLinearAdjust/0.1/1/Test_Robustness_Result_12.csv",sep=""),2)
  make_test_sim_result_file(paste(getwd(),"/chemoLowerLinearAdjust/0.1/1/Test_Robustness_Result_36.csv",sep=""),3)
  dir.create(file.path(getwd(),"chemoUpperLinearAdjust"))
  dir.create(file.path(getwd(),"chemoUpperLinearAdjust","1"))
  dir.create(file.path(getwd(),"chemoUpperLinearAdjust","1","1"))
  dir.create(file.path(getwd(),"chemoUpperLinearAdjust","2"))
  dir.create(file.path(getwd(),"chemoUpperLinearAdjust","2","1"))
  make_test_sim_result_file(paste(getwd(),"/chemoUpperLinearAdjust/1/1/Test_Robustness_Result_12.csv",sep=""),3)
  make_test_sim_result_file(paste(getwd(),"/chemoUpperLinearAdjust/1/1/Test_Robustness_Result_36.csv",sep=""),2)
  make_test_sim_result_file(paste(getwd(),"/chemoUpperLinearAdjust/2/1/Test_Robustness_Result_12.csv",sep=""),1)
  make_test_sim_result_file(paste(getwd(),"/chemoUpperLinearAdjust/2/1/Test_Robustness_Result_36.csv",sep=""),2)
}

setup_lhc_result_analysis <- function()
{
  # Some setup here
  dir.create(file.path(getwd(),"1"))
  dir.create(file.path(getwd(),"1","1"))
  dir.create(file.path(getwd(),"1","2"))
  make_test_sim_result_file(paste(getwd(),"/1/1/Test_LHC_Result.csv",sep=""),1)
  make_test_sim_result_file(paste(getwd(),"/1/2/Test_LHC_Result.csv",sep=""),2)
  dir.create(file.path(getwd(),"2"))
  dir.create(file.path(getwd(),"2","1"))
  dir.create(file.path(getwd(),"2","2"))
  make_test_sim_result_file(paste(getwd(),"/2/1/Test_LHC_Result.csv",sep=""),2)
  make_test_sim_result_file(paste(getwd(),"/2/2/Test_LHC_Result.csv",sep=""),3)

}

setup_lhc_result_analysis_overtime <- function()
{
  # Some setup here
  dir.create(file.path(getwd(),"1"))
  dir.create(file.path(getwd(),"1","1"))
  dir.create(file.path(getwd(),"1","2"))
  make_test_sim_result_file(paste(getwd(),"/1/1/Test_LHC_Result_12.csv",sep=""),1)
  make_test_sim_result_file(paste(getwd(),"/1/1/Test_LHC_Result_36.csv",sep=""),2)
  make_test_sim_result_file(paste(getwd(),"/1/2/Test_LHC_Result_12.csv",sep=""),2)
  make_test_sim_result_file(paste(getwd(),"/1/2/Test_LHC_Result_36.csv",sep=""),3)
  dir.create(file.path(getwd(),"2"))
  dir.create(file.path(getwd(),"2","1"))
  dir.create(file.path(getwd(),"2","2"))
  make_test_sim_result_file(paste(getwd(),"/2/1/Test_LHC_Result_12.csv",sep=""),2)
  make_test_sim_result_file(paste(getwd(),"/2/1/Test_LHC_Result_36.csv",sep=""),3)
  make_test_sim_result_file(paste(getwd(),"/2/2/Test_LHC_Result_12.csv",sep=""),3)
  make_test_sim_result_file(paste(getwd(),"/2/2/Test_LHC_Result_36.csv",sep=""),1)

}

setup_efast_result_analysis <- function(overTime=FALSE)
{
  # Some setup here
  # Curves:
  dir.create(file.path(getwd(),"1"))
  dir.create(file.path(getwd(),"2"))
  # Parameters:
  dir.create(file.path(getwd(),"1","1"))
  dir.create(file.path(getwd(),"1","2"))
  dir.create(file.path(getwd(),"2","1"))
  dir.create(file.path(getwd(),"2","2"))
  # Set
  dir.create(file.path(getwd(),"1","1","1"))
  dir.create(file.path(getwd(),"1","1","2"))
  dir.create(file.path(getwd(),"1","2","1"))
  dir.create(file.path(getwd(),"1","2","2"))
  dir.create(file.path(getwd(),"2","1","1"))
  dir.create(file.path(getwd(),"2","1","2"))
  dir.create(file.path(getwd(),"2","2","1"))
  dir.create(file.path(getwd(),"2","2","2"))
  # Replicate
  dir.create(file.path(getwd(),"1","1","1","1"))
  dir.create(file.path(getwd(),"1","1","1","2"))
  dir.create(file.path(getwd(),"1","1","2","1"))
  dir.create(file.path(getwd(),"1","1","2","2"))
  dir.create(file.path(getwd(),"1","2","1","1"))
  dir.create(file.path(getwd(),"1","2","1","2"))
  dir.create(file.path(getwd(),"1","2","2","1"))
  dir.create(file.path(getwd(),"1","2","2","2"))
  dir.create(file.path(getwd(),"2","1","1","1"))
  dir.create(file.path(getwd(),"2","1","1","2"))
  dir.create(file.path(getwd(),"2","1","2","1"))
  dir.create(file.path(getwd(),"2","1","2","2"))
  dir.create(file.path(getwd(),"2","2","1","1"))
  dir.create(file.path(getwd(),"2","2","1","2"))
  dir.create(file.path(getwd(),"2","2","2","1"))
  dir.create(file.path(getwd(),"2","2","2","2"))

  # Results:
  if(!overTime)
  {
    make_test_sim_result_file(paste(getwd(),"/1/1/1/1/Test_eFAST_Result.csv",sep=""),1)
    make_test_sim_result_file(paste(getwd(),"/1/1/1/2/Test_eFAST_Result.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/1/1/2/1/Test_eFAST_Result.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/1/1/2/2/Test_eFAST_Result.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/1/2/1/1/Test_eFAST_Result.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/1/2/1/2/Test_eFAST_Result.csv",sep=""),1)
    make_test_sim_result_file(paste(getwd(),"/1/2/2/1/Test_eFAST_Result.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/1/2/2/2/Test_eFAST_Result.csv",sep=""),1)
    make_test_sim_result_file(paste(getwd(),"/2/1/1/1/Test_eFAST_Result.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/2/1/1/2/Test_eFAST_Result.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/2/1/2/1/Test_eFAST_Result.csv",sep=""),1)
    make_test_sim_result_file(paste(getwd(),"/2/1/2/2/Test_eFAST_Result.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/2/2/1/1/Test_eFAST_Result.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/2/2/1/2/Test_eFAST_Result.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/2/2/2/1/Test_eFAST_Result.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/2/2/2/2/Test_eFAST_Result.csv",sep=""),3)
  }
  else
  {
    make_test_sim_result_file(paste(getwd(),"/1/1/1/1/Test_eFAST_Result_12.csv",sep=""),1)
    make_test_sim_result_file(paste(getwd(),"/1/1/1/2/Test_eFAST_Result_12.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/1/1/1/1/Test_eFAST_Result_36.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/1/1/1/2/Test_eFAST_Result_36.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/1/1/2/1/Test_eFAST_Result_12.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/1/1/2/2/Test_eFAST_Result_12.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/1/1/2/1/Test_eFAST_Result_36.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/1/1/2/2/Test_eFAST_Result_36.csv",sep=""),1)

    make_test_sim_result_file(paste(getwd(),"/1/2/1/1/Test_eFAST_Result_12.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/1/2/1/2/Test_eFAST_Result_12.csv",sep=""),1)
    make_test_sim_result_file(paste(getwd(),"/1/2/1/1/Test_eFAST_Result_36.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/1/2/1/2/Test_eFAST_Result_36.csv",sep=""),3)

    make_test_sim_result_file(paste(getwd(),"/1/2/2/1/Test_eFAST_Result_12.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/1/2/2/2/Test_eFAST_Result_12.csv",sep=""),1)
    make_test_sim_result_file(paste(getwd(),"/1/2/2/1/Test_eFAST_Result_36.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/1/2/2/2/Test_eFAST_Result_36.csv",sep=""),2)

    make_test_sim_result_file(paste(getwd(),"/2/1/1/1/Test_eFAST_Result_12.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/2/1/1/2/Test_eFAST_Result_12.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/2/1/1/1/Test_eFAST_Result_36.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/2/1/1/2/Test_eFAST_Result_36.csv",sep=""),1)

    make_test_sim_result_file(paste(getwd(),"/2/1/2/1/Test_eFAST_Result_12.csv",sep=""),1)
    make_test_sim_result_file(paste(getwd(),"/2/1/2/2/Test_eFAST_Result_12.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/2/1/2/1/Test_eFAST_Result_36.csv",sep=""),1)
    make_test_sim_result_file(paste(getwd(),"/2/1/2/2/Test_eFAST_Result_36.csv",sep=""),3)

    make_test_sim_result_file(paste(getwd(),"/2/2/1/1/Test_eFAST_Result_12.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/2/2/1/2/Test_eFAST_Result_12.csv",sep=""),2)
    make_test_sim_result_file(paste(getwd(),"/2/2/1/1/Test_eFAST_Result_36.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/2/2/1/2/Test_eFAST_Result_36.csv",sep=""),1)

    make_test_sim_result_file(paste(getwd(),"/2/2/2/1/Test_eFAST_Result_12.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/2/2/2/2/Test_eFAST_Result_12.csv",sep=""),3)
    make_test_sim_result_file(paste(getwd(),"/2/2/2/1/Test_eFAST_Result_36.csv",sep=""),1)
    make_test_sim_result_file(paste(getwd(),"/2/2/2/2/Test_eFAST_Result_36.csv",sep=""),2)
  }

  # Param files, need one for each curve / parameter
  params <- rbind(cbind(63.8870291068684,0.738687975020334),
                    cbind(97.4719759861007,0.241536056525633))
  write_data_to_csv(params,"Curve1_Param1.csv")
  params <- rbind(cbind(0.571237586152129,0.513502848532337),
                  cbind(25.1866222015367,0.488887463916953))
  write_data_to_csv(params,"Curve1_Param2.csv")
  params <- rbind(cbind(49.8020068169214,0.464272079301568),
                  cbind(74.417391432306,0.439656694686184))
  write_data_to_csv(params,"Curve2_Param1.csv")
  params <- rbind(cbind(76.3518393369248,0.390425925455414),
                  cbind(51.7364547215402,0.36581054084003))
  write_data_to_csv(params,"Curve2_Param2.csv")
}

cleanup_efast <- function(overTime=FALSE)
{
  unlink(file.path(getwd(),"1"),recursive = TRUE)
  unlink(file.path(getwd(),"2"),recursive = TRUE)
  file.remove("Curve1_Param1.csv")
  file.remove("Curve2_Param1.csv")
  file.remove("Curve1_Param2.csv")
  file.remove("Curve2_Param2.csv")
  if(!overTime)
  {
    file.remove("Curve1_Parameter1_Results.csv")
    file.remove("Curve1_Parameter2_Results.csv")
    file.remove("Curve2_Parameter1_Results.csv")
    file.remove("Curve2_Parameter2_Results.csv")
  }
  else
  {
    file.remove("Curve1_Parameter1_Results_12.csv")
    file.remove("Curve1_Parameter2_Results_12.csv")
    file.remove("Curve2_Parameter1_Results_12.csv")
    file.remove("Curve2_Parameter2_Results_12.csv")
    file.remove("Curve1_Parameter1_Results_36.csv")
    file.remove("Curve1_Parameter2_Results_36.csv")
    file.remove("Curve2_Parameter1_Results_36.csv")
    file.remove("Curve2_Parameter2_Results_36.csv")
  }
}

cleanup <- function()
{
  unlink(file.path(getwd(),"chemoLowerLinearAdjust"), recursive = TRUE)
  unlink(file.path(getwd(),"chemoUpperLinearAdjust"), recursive = TRUE)
}

