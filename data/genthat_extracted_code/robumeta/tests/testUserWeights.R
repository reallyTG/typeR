context("UserWeights_Model")



test_that("Coef_Est", {
  User_Weights <- robu(effectsize ~ followup, 
                       data = corrdat, studynum = studyid, var.eff.size = var,
                       modelweights ="CORR", small = T, rho = 1)$data.full$r.weights
  
  New_result <- robu(effectsize ~ followup, 
                     data = corrdat, studynum = studyid, var.eff.size = var,
                     userweights = User_Weights, small = T, rho = 1)
  
  expect_equivalent(as.vector(New_result$b.r),  c(0.334200417, -0.002179469))
})

test_that("df_Est", {
  User_Weights <- robu(effectsize ~ followup, 
                       data = corrdat, studynum = studyid, var.eff.size = var,
                       modelweights ="CORR", small = T, rho = 1)$data.full$r.weights
  
  #Without Small Sample Correction
  New_result <- robu(effectsize ~ followup, 
                     data = corrdat, studynum = studyid, var.eff.size = var,
                     userweights = User_Weights, small = F, rho = 1)
  
  expect_equivalent(as.vector(New_result$dfs),  37)  
  
  
  #With Small Sample Correction
  
  New_result <- robu(effectsize ~ followup, 
                     data = corrdat, studynum = studyid, var.eff.size = var,
                     userweights = User_Weights, small = T, rho = 1)
  
  expect_equivalent(as.vector(New_result$dfs),  c(9.88413624629, 1.32957029417))
})
