
eqnfile <- system.file("MPTmodels/2htm.eqn", package="TreeBUGS")
model <- "# 2HTM
Target    Hit    Do
Target    Hit    (1-Do)*g
Target    Miss   (1-Do)*(1-g)
Lure      FA     (1-Dn)*g
Lure      CR     (1-Dn)*(1-g)
Lure      CR     Dn
"



test_that('readEQN results in proper MPT model', {

  expect_is(readEQN(eqnfile), "data.frame")
  expect_is(readEQN(model), "data.frame")

  res <- readEQN(model)
  expect_named(res, c("Tree","Category","Equation"))

  expect_is(readEQN(model, restrictions = list("g=.5","Dn=Do")),
            "data.frame")

  ## misspecified constraints
  expect_error(readEQN(model, restrictions = list("g=.5","Dnasd=Do")))
  expect_error(readEQN(model, restrictions = list("g=.1=.5")))
  expect_warning(readEQN(model, restrictions = list("g=-4")))
})
