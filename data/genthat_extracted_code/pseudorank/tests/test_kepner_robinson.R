# data <- c(1 ,  0 ,  -2 ,  -1 ,  -2 ,  1 ,  0 ,  0 ,  0 ,  -2)
# dataNA <- c(NA ,  0 ,  -2 ,  -1 ,  -2 ,  1 ,  0 ,  0 ,  NA ,  -2)
# time <- rep(c(1,2),5)
# subject <- gl(5,2)
# df <- data.frame(data=data,data2=dataNA,time=time,subject=subject)
# 
# pValue <- 0.83257
# pvalueF <- 0.8409167
# pValueNA <- 0.2059032
# 
# 
# context("Function for Calculating the Kepner-Robinson Test")
# test_that("function kepner_robinson_test", {
#   expect_equivalent(pseudorank::kepner_robinson_test(data,time,subject)$pValue, pValue, tolerance=1e-4)
#   expect_equivalent(pseudorank::kepner_robinson_test(data~time,data=df,subject="subject")$pValue, pValue, tolerance=1e-4)
#   
#   expect_equivalent(pseudorank::kepner_robinson_test(data,time,subject,distribution="F")$pValue, pvalueF, tolerance=1e-4)
#   expect_equivalent(pseudorank::kepner_robinson_test(data~time,data=df,subject="subject",distribution="F")$pValue, pvalueF, tolerance=1e-4)
#   
#   expect_equivalent(pseudorank::kepner_robinson_test(dataNA,time,subject,na.rm=TRUE)$pValue, pValueNA, tolerance=1e-4)
#   expect_equivalent(pseudorank::kepner_robinson_test(data2~time,data=df,subject="subject",na.rm=TRUE)$pValue, pValueNA, tolerance=1e-4)
#   
#   expect_error(pseudorank::kepner_robinson_test(data2~time,data=df,subject="subject",na.rm=FALSE))
#   expect_error(pseudorank::kepner_robinson_test(data2~time,data=df,subject="subject",na.rm=FALSE))
#   
#   expect_output(summary(pseudorank::kepner_robinson_test(data,time,subject)))
#   expect_output(print(pseudorank::kepner_robinson_test(data~time,data=df,subject="subject")))
# })
