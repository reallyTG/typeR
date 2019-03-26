context("Evaluating tucker's function")

#The test are based in amb=2 nc1=3 and nc2=3
maize_pop2 <- maize_pop
maize_pop2[2,5] <- NA
prueba1  <- tucker2R(maize_pop,amb=2,nc1=3,nc2=3)


test_that("testing error, warnings and messages",{
  expect_error(tucker2R(maize_pop[,-1],amb=2,nc1=3,nc2=3),
             "The variables must be the same in amb")
  expect_error(tucker2R(as.matrix(maize_pop),amb=2,nc1=3,nc2=3),
               "datos must be a data frame")
  expect_error(tucker2R(maize_pop2,amb=2,nc1=3,nc2=3),
               "There is at least one NA  'datos' must be complete")
  expect_error(tucker2R(maize_pop,amb=2,nc1=1,nc2=1),
               "in the combination of components for a solution must use a Diffit criteria")
})
test_that("compare with first function in packages version 1.0",{
  expect_equal_to_reference(prueba1$IND,"output_IND.rds")
  expect_equal_to_reference(prueba1$D,"output_D.rds")
  expect_equal_to_reference(prueba1$iter,"output_iter.rds")
  expect_equal_to_reference(prueba1$sce,"output_sce.rds")
  expect_equal_to_reference(prueba1$var,"output_var.rds")
  expect_equal_to_reference(prueba1$indi,"output_indi.rds")
})

test_that("testing class and other features",{
  expect_output(str(prueba1),"List of 6")
  expect_is(prueba1,"marta")
})
