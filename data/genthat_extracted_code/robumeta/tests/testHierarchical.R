context("HierarchicalModel")

test_that("Tau_square_Est", {

  New_result <- robu(effectsize ~ followup,
                     data = hierdat, studynum = studyid, var.eff.size = var,
                     modelweights ="HIER",small = T)

  expect_equivalent(New_result$mod_info$tau.sq[1,1],  0.06541402)
})

test_that("Omega_square_Est", {

  New_result <- robu(effectsize ~ followup,
                     data = hierdat, studynum = studyid, var.eff.size = var,
                     modelweights ="HIER",small = T)

  expect_equivalent(New_result$mod_info$omega.sq[1,1],  0.16360794)
})

test_that("Coef_Est", {
  New_result <- robu(effectsize ~ followup,
                     data = hierdat, studynum = studyid, var.eff.size = var,
                     modelweights ="HIER",small = T)

  expect_equivalent(as.vector(New_result$b.r),  c(0.2610277292, -0.0001810645))
})

test_that("df_Est", {
  #Without Small Sample Correction
  New_result <- robu(effectsize ~ followup,
                     data = hierdat, studynum = studyid, var.eff.size = var,
                     modelweights ="HIER",small = F)

  expect_equivalent(as.vector(New_result$dfs),  13)


  #With Small Sample Correction

  New_result <- robu(effectsize ~ followup,
                     data = hierdat, studynum = studyid, var.eff.size = var,
                     modelweights ="HIER",small = T)

  expect_equivalent(as.vector(New_result$dfs),  c(3.1683243, 1.5765336))
})
