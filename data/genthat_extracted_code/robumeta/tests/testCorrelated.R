context("CorrelatedModel")

test_that("Tau_square_Est", {
  
  New_result <- robu(effectsize ~ followup, 
                     data = corrdat, studynum = studyid, var.eff.size = var, 
                     modelweights ="CORR",small = T, rho = 1)
  
  expect_equivalent(New_result$mod_info$tau.sq[1,1],  0.12361242975)
})



test_that("Coef_Est", {
  New_result <- robu(effectsize ~ followup, 
                     data = corrdat, studynum = studyid, var.eff.size = var, 
                     modelweights ="CORR",small = T, rho = 1)
  
  expect_equivalent(as.vector(New_result$b.r),  c(0.334200417, -0.002179469))
})

test_that("df_Est", {
  #Without Small Sample Correction
  New_result <- robu(effectsize ~ followup, 
                     data = corrdat, studynum = studyid, var.eff.size = var, 
                     modelweights ="CORR",small = F, rho = 1)
  
  expect_equivalent(as.vector(New_result$dfs),  37)  
  
  
  #With Small Sample Correction
  
  New_result <- robu(effectsize ~ followup, 
                     data = corrdat, studynum = studyid, var.eff.size = var, 
                     modelweights ="CORR",small = T, rho = 1)
  
  expect_equivalent(as.vector(New_result$dfs),  c(22.946909551160,  1.853700618431))
})
