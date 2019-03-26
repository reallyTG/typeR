library(mlrMBO)


### Name: mlrMBO_examples
### Title: mlrMBO examples
### Aliases: mlrMBO_examples

### ** Examples

#####################################################
###
### optimizing a simple sin(x) with mbo / EI
###
#####################################################
## Not run: 
##D library(ggplot2)
##D library(mlrMBO)
##D configureMlr(show.learner.output = FALSE)
##D set.seed(1)
##D 
##D obj.fun = makeSingleObjectiveFunction(
##D   name = "Sine",
##D   fn = function(x) sin(x),
##D   par.set = makeNumericParamSet(lower = 3, upper = 13, len = 1),
##D   global.opt.value = -1
##D )
##D 
##D ctrl = makeMBOControl(propose.points = 1)
##D ctrl = setMBOControlTermination(ctrl, iters = 10L)
##D ctrl = setMBOControlInfill(ctrl, crit = makeMBOInfillCritEI(), 
##D   opt = "focussearch", opt.focussearch.points = 500L)
##D 
##D lrn = makeMBOLearner(ctrl, obj.fun)
##D 
##D design = generateDesign(6L, getParamSet(obj.fun), fun = lhs::maximinLHS)
##D 
##D run = exampleRun(obj.fun, design = design, learner = lrn,
##D   control = ctrl, points.per.dim = 100, show.info = TRUE)
##D 
##D plotExampleRun(run, densregion = TRUE, gg.objects = list(theme_bw()))
## End(Not run)
#####################################################
###
### optimizing branin in 2D with mbo / EI #####
###
#####################################################
## Not run: 
##D library(mlrMBO)
##D library(ggplot2)
##D set.seed(1)
##D configureMlr(show.learner.output = FALSE)
##D 
##D obj.fun = makeBraninFunction()
##D 
##D ctrl = makeMBOControl(propose.points = 1L)
##D ctrl = setMBOControlTermination(ctrl, iters = 10L)
##D ctrl = setMBOControlInfill(ctrl, crit = makeMBOInfillCritEI(), 
##D   opt = "focussearch", opt.focussearch.points = 2000L)
##D 
##D lrn = makeMBOLearner(ctrl, obj.fun)
##D design = generateDesign(10L, getParamSet(obj.fun), fun = lhs::maximinLHS)
##D 
##D run = exampleRun(obj.fun, design = design, learner = lrn, control = ctrl,
##D 	points.per.dim = 50L, show.info = TRUE)
##D 
##D print(run)
##D 
##D plotExampleRun(run, gg.objects = list(theme_bw()))
## End(Not run)
#####################################################
###
### optimizing a simple sin(x) with multipoint proposal
###
#####################################################
## Not run: 
##D library(mlrMBO)
##D library(ggplot2)
##D set.seed(1)
##D configureMlr(show.learner.output = FALSE)
##D 
##D obj.fun = makeSingleObjectiveFunction(
##D   name = "Sine",
##D   fn = function(x) sin(x),
##D   par.set = makeNumericParamSet(lower = 3, upper = 13, len = 1L),
##D   global.opt.value = -1
##D )
##D 
##D ctrl = makeMBOControl(propose.points = 2L)
##D ctrl = setMBOControlTermination(ctrl, iters = 10L)
##D ctrl = setMBOControlInfill(ctrl, crit = makeMBOInfillCritMeanResponse())
##D ctrl = setMBOControlMultiPoint(
##D 	ctrl,
##D   method = "moimbo",
##D   moimbo.objective = "ei.dist",
##D   moimbo.dist = "nearest.neighbor",
##D   moimbo.maxit = 200L
##D )
##D 
##D lrn = makeMBOLearner(ctrl, obj.fun)
##D 
##D design = generateDesign(4L, getParamSet(obj.fun), fun = lhs::maximinLHS)
##D 
##D run = exampleRun(obj.fun, design = design, learner = lrn,
##D   control = ctrl, points.per.dim = 100, show.info = TRUE)
##D 
##D print(run)
##D 
##D plotExampleRun(run, densregion = TRUE, gg.objects = list(theme_bw()))
## End(Not run)
#####################################################
###
### optimizing branin in 2D with multipoint proposal #####
###
#####################################################
## Not run: 
##D library(mlrMBO)
##D library(ggplot2)
##D set.seed(2)
##D configureMlr(show.learner.output = FALSE)
##D 
##D obj.fun = makeBraninFunction()
##D 
##D ctrl = makeMBOControl(propose.points = 5L)
##D ctrl = setMBOControlInfill(ctrl, crit = makeMBOInfillCritMeanResponse())
##D ctrl = setMBOControlTermination(ctrl, iters = 10L)
##D ctrl = setMBOControlMultiPoint(ctrl,
##D   method = "moimbo",
##D   moimbo.objective = "ei.dist",
##D   moimbo.dist = "nearest.neighbor",
##D   moimbo.maxit = 200L
##D )
##D 
##D lrn = makeLearner("regr.km", predict.type = "se")
##D design = generateDesign(10L, getParamSet(obj.fun), fun = lhs::maximinLHS)
##D 
##D run = exampleRun(obj.fun, design = design, learner = lrn, control = ctrl,
##D 	points.per.dim = 50L, show.info = TRUE)
##D 
##D print(run)
##D 
##D plotExampleRun(run, gg.objects = list(theme_bw()))
## End(Not run)
#####################################################
###
### optimizing a simple noisy sin(x) with mbo / EI
###
#####################################################
## Not run: 
##D library(mlrMBO)
##D library(ggplot2)
##D set.seed(1)
##D configureMlr(show.learner.output = FALSE)
##D 
##D # function with noise
##D obj.fun = makeSingleObjectiveFunction(
##D   name = "Some noisy function",
##D   fn = function(x) sin(x) + rnorm(1, 0, 0.1),
##D   par.set = makeNumericParamSet(lower = 3, upper = 13, len = 1L),
##D   noisy = TRUE,
##D   global.opt.value = -1,
##D   fn.mean = function(x) sin(x)
##D )
##D 
##D ctrl = makeMBOControl(
##D   propose.points = 1L,
##D   final.method = "best.predicted",
##D   final.evals = 10L
##D )
##D ctrl = setMBOControlTermination(ctrl, iters = 5L)
##D 
##D ctrl = setMBOControlInfill(ctrl, crit = makeMBOInfillCritEI(),
##D  opt = "focussearch", opt.focussearch.points = 500L)
##D 
##D lrn = makeMBOLearner(ctrl, obj.fun)
##D 
##D design = generateDesign(6L, getParamSet(obj.fun), fun = lhs::maximinLHS)
##D 
##D run = exampleRun(obj.fun, design = design, learner = lrn,
##D   control = ctrl, points.per.dim = 200L, noisy.evals = 50L,
##D   show.info = TRUE)
##D 
##D print(run)
##D 
##D plotExampleRun(run, densregion = TRUE, gg.objects = list(theme_bw()))
## End(Not run)
#####################################################
###
### optimizing 1D fun with 3 categorical level and
### noisy outout with random forest
###
#####################################################
## Not run: 
##D library(mlrMBO)
##D library(ggplot2)
##D set.seed(1)
##D configureMlr(show.learner.output = FALSE)
##D 
##D obj.fun = makeSingleObjectiveFunction(
##D   name = "Mixed decision space function",
##D   fn = function(x) {
##D     if (x$foo == "a") {
##D       return(5 + x$bar^2 + rnorm(1))
##D     } else if (x$foo == "b") {
##D       return(4 + x$bar^2 + rnorm(1, sd = 0.5))
##D     } else {
##D       return(3 + x$bar^2 + rnorm(1, sd = 1))
##D     }
##D   },
##D   par.set = makeParamSet(
##D     makeDiscreteParam("foo", values = letters[1:3]),
##D     makeNumericParam("bar", lower = -5, upper = 5)
##D   ),
##D   has.simple.signature = FALSE, # function expects a named list of parameter values
##D   noisy = TRUE
##D )
##D 
##D ctrl = makeMBOControl()
##D ctrl = setMBOControlTermination(ctrl, iters = 10L)
##D 
##D # we can basically do an exhaustive search in 3 values
##D ctrl = setMBOControlInfill(ctrl, crit = makeMBOInfillCritEI(),
##D   opt.restarts = 1L, opt.focussearch.points = 3L, opt.focussearch.maxit = 1L)
##D 
##D design = generateDesign(20L, getParamSet(obj.fun), fun = lhs::maximinLHS)
##D 
##D lrn = makeMBOLearner(ctrl, obj.fun)
##D 
##D run = exampleRun(obj.fun, design = design, learner = lrn, control = ctrl,
##D 	points.per.dim = 50L, show.info = TRUE)
##D 
##D print(run)
##D plotExampleRun(run, densregion = TRUE, gg.objects = list(theme_bw()))
## End(Not run)
#####################################################
###
### optimizing mixed space function
###
#####################################################
## Not run: 
##D library(mlrMBO)
##D library(ggplot2)
##D set.seed(1)
##D configureMlr(show.learner.output = FALSE)
##D 
##D obj.fun = makeSingleObjectiveFunction(
##D   name = "Mixed functions",
##D   fn = function(x) {
##D     if (x$cat == "a")
##D       x$num^2
##D     else
##D       x$num^2 + 3
##D   },
##D   par.set = makeParamSet(
##D     makeDiscreteParam("cat", values = c("a", "b")),
##D     makeNumericParam("num", lower = -5, upper = 5)
##D   ),
##D   has.simple.signature = FALSE,
##D   global.opt.value = -1
##D )
##D 
##D ctrl = makeMBOControl(propose.points = 1L)
##D ctrl = setMBOControlTermination(ctrl, iters = 10L)
##D ctrl = setMBOControlInfill(ctrl, crit = makeMBOInfillCritEI(), 
##D   opt = "focussearch", opt.focussearch.points = 500L)
##D 
##D lrn = makeMBOLearner(ctrl, obj.fun)
##D 
##D design = generateDesign(4L, getParamSet(obj.fun), fun = lhs::maximinLHS)
##D 
##D run = exampleRun(obj.fun, design = design, learner = lrn,
##D   control = ctrl, points.per.dim = 100L, show.info = TRUE)
##D 
##D print(run)
##D 
##D plotExampleRun(run, densregion = TRUE, gg.objects = list(theme_bw()))
## End(Not run)
#####################################################
###
### optimizing multi-objective function
###
#####################################################
## Not run: 
##D library(mlrMBO)
##D library(ggplot2)
##D set.seed(1)
##D configureMlr(show.learner.output = FALSE)
##D 
##D obj.fun = makeZDT1Function(dimensions = 2L)
##D 
##D ctrl = makeMBOControl(n.objectives = 2L, propose.points = 2L, save.on.disk.at = integer(0L))
##D ctrl = setMBOControlTermination(ctrl, iters = 5L)
##D ctrl = setMBOControlInfill(ctrl, crit = makeMBOInfillCritDIB(),
##D   opt.focussearch.points = 10000L)
##D ctrl = setMBOControlMultiObj(ctrl, parego.s = 100)
##D learner = makeMBOLearner(ctrl, obj.fun)
##D 
##D design = generateDesign(5L, getParamSet(obj.fun), fun = lhs::maximinLHS)
##D 
##D run = exampleRunMultiObj(obj.fun, design = design, learner = learner, ctrl, points.per.dim = 50L,
##D   show.info = TRUE, nsga2.args = list())
##D 
##D plotExampleRun(run, gg.objects = list(theme_bw()))
## End(Not run)
#####################################################
###
### optimizing multi objective function and plots
###
#####################################################
## Not run: 
##D library(mlrMBO)
##D library(ggplot2)
##D set.seed(1)
##D configureMlr(show.learner.output = FALSE)
##D 
##D obj.fun = makeDTLZ1Function(dimensions = 5L, n.objectives = 2L)
##D 
##D ctrl = makeMBOControl(n.objectives = 2L,
##D   propose.points = 2L)
##D ctrl = setMBOControlTermination(ctrl, iters = 10L)
##D ctrl = setMBOControlInfill(ctrl, crit = makeMBOInfillCritEI(), opt.focussearch.points = 1000L,
##D   opt.focussearch.maxit = 3L)
##D ctrl = setMBOControlMultiObj(ctrl, method = "parego")
##D lrn = makeMBOLearner(ctrl, obj.fun)
##D 
##D design = generateDesign(8L, getParamSet(obj.fun), fun = lhs::maximinLHS)
##D 
##D res = mbo(obj.fun, design = design, learner = lrn, control = ctrl, show.info = TRUE)
##D 
##D plot(res)
## End(Not run)



