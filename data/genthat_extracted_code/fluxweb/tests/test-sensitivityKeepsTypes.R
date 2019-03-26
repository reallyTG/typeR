context("check if sensitivity function keep variable types")
load("groups.level.RData")
test_that('objects remain the same',{
  var = 0.05
  losses = 0.71*groups.level$bodymasses^-0.25
  res = sensitivity(fluxing, "efficiencies", var, 50, 
                    mat = groups.level$mat, 
                    biomasses = groups.level$biomasses, 
                    losses = losses, 
                    efficiencies = groups.level$efficiencies)

  expect_true(is.matrix(res[[2]]))
}) 
