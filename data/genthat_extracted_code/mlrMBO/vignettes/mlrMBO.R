## ----setup, include = FALSE, cache = FALSE-------------------------------
library(mlrMBO)
library(rgenoud)
set.seed(123)
knitr::opts_chunk$set(cache = TRUE, collapse = FALSE)
knitr::knit_hooks$set(document = function(x){
  gsub("```\n*```r*\n*", "", x)
})

## ----load_package--------------------------------------------------------
library(mlrMBO)

## ----cosine_fun----------------------------------------------------------
obj.fun = makeCosineMixtureFunction(1)
obj.fun = convertToMinimization(obj.fun)
print(obj.fun)
ggplot2::autoplot(obj.fun)

## ----smoof_custom_objective----------------------------------------------
makeSingleObjectiveFunction(
  name = "my_sphere",
  fn = function(x) {
    sum(x*x) + 7
  },
  par.set = makeParamSet(
    makeNumericVectorParam("x", len = 2L, lower = -5, upper = 5)
  ),
  minimize = TRUE
)

## ------------------------------------------------------------------------
des = generateDesign(n = 5, par.set = getParamSet(obj.fun), fun = lhs::randomLHS)

## ------------------------------------------------------------------------
des$y = apply(des, 1, obj.fun)

## ------------------------------------------------------------------------
surr.km = makeLearner("regr.km", predict.type = "se", covtype = "matern3_2", control = list(trace = FALSE))

## ----cosine_setup--------------------------------------------------------
control = makeMBOControl()
control = setMBOControlTermination(control, iters = 10)
control = setMBOControlInfill(control, crit = makeMBOInfillCritEI())

## ----cosine_run, results='hold'------------------------------------------
run = mbo(obj.fun, design = des, learner = surr.km, control = control, show.info = TRUE)
print(run)

## ----cosine_examplerun, results="hide"-----------------------------------
run = exampleRun(obj.fun, learner = surr.km, control = control, show.info = FALSE)

## ----cosine_plot_examplerun, warning=FALSE-------------------------------
print(run)
plotExampleRun(run, iters = c(1L, 2L, 10L), pause = FALSE)

