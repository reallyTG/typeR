## ----include = FALSE, cache = FALSE--------------------------------------
library(batchtools)
options(batchtools.progress = FALSE, datatable.print.class = TRUE, batchtools.timestamps = FALSE)
if (identical(Sys.getenv("IN_PKGDOWN"), "true")) {
  tmp_dir = fs::path(dirname(tempdir()), "batchtools-vignette")
  if (fs::dir_exists(tmp_dir))
    fs::dir_delete(tmp_dir)
  fs::file_temp_push(fs::path(tmp_dir, letters))
}

## ---- message=FALSE------------------------------------------------------
reg = makeRegistry(NA)
reg$cluster.functions = makeClusterFunctionsSocket(2)

## ----eval=FALSE----------------------------------------------------------
#  Sys.setenv(DEBUGME = "batchtools")
#  library(batchtools)

## ----eval = FALSE--------------------------------------------------------
#  cluster.functions = makeClusterFunctionsInteractive()

## ---- eval = FALSE-------------------------------------------------------
#  work.dir = "~"
#  packages = union(packages, "checkmate")

## ---- message = FALSE----------------------------------------------------
reg = makeRegistry(file.dir = NA, seed = 1)

## ------------------------------------------------------------------------
piApprox = function(n) {
  nums = matrix(runif(2 * n), ncol = 2)
  d = sqrt(nums[, 1]^2 + nums[, 2]^2)
  4 * mean(d <= 1)
}
set.seed(42)
piApprox(1000)

## ------------------------------------------------------------------------
batchMap(fun = piApprox, n = rep(1e5, 10))

## ------------------------------------------------------------------------
names(getJobTable())

## ------------------------------------------------------------------------
submitJobs(resources = list(walltime = 3600, memory = 1024))

## ------------------------------------------------------------------------
getStatus()

## ------------------------------------------------------------------------
waitForJobs()
mean(sapply(1:10, loadResult))
reduceResults(function(x, y) x + y) / 10

## ---- R.options=list(batchtools.verbose=FALSE)---------------------------
res = btlapply(rep(1e5, 10), piApprox)
mean(unlist(res))

## ---- message = FALSE----------------------------------------------------
library(batchtools)
reg = makeExperimentRegistry(file.dir = NA, seed = 1)

## ------------------------------------------------------------------------
subsample = function(data, job, ratio, ...) {
  n = nrow(data)
  train = sample(n, floor(n * ratio))
  test = setdiff(seq_len(n), train)
  list(test = test, train = train)
}

## ------------------------------------------------------------------------
data("iris", package = "datasets")
addProblem(name = "iris", data = iris, fun = subsample, seed = 42)

## ------------------------------------------------------------------------
svm.wrapper = function(data, job, instance, ...) {
  library("e1071")
  mod = svm(Species ~ ., data = data[instance$train, ], ...)
  pred = predict(mod, newdata = data[instance$test, ], type = "class")
  table(data$Species[instance$test], pred)
}
addAlgorithm(name = "svm", fun = svm.wrapper)

## ------------------------------------------------------------------------
forest.wrapper = function(data, job, instance, ...) {
  library("ranger")
  mod = ranger(Species ~ ., data = data[instance$train, ], write.forest = TRUE)
  pred = predict(mod, data = data[instance$test, ])
  table(data$Species[instance$test], pred$predictions)
}
addAlgorithm(name = "forest", fun = forest.wrapper)

## ------------------------------------------------------------------------
reg$problems
reg$algorithms

## ----echo=FALSE----------------------------------------------------------
knitr::include_graphics("tikz_prob_algo_simple.png", auto_pdf = TRUE)

## ------------------------------------------------------------------------
# problem design: try two values for the ratio parameter
pdes = list(iris = data.table(ratio = c(0.67, 0.9)))

# algorithm design: try combinations of kernel and epsilon exhaustively,
# try different number of trees for the forest
ades = list(
  svm = CJ(kernel = c("linear", "polynomial", "radial"), epsilon = c(0.01, 0.1)),
  forest = data.table(ntree = c(100, 500, 1000))
)

addExperiments(pdes, ades, repls = 5)

## ------------------------------------------------------------------------
summarizeExperiments()
summarizeExperiments(by = c("problem", "algorithm", "ratio"))

## ------------------------------------------------------------------------
id1 = head(findExperiments(algo.name = "svm"), 1)
print(id1)
id2 = head(findExperiments(algo.name = "forest", algo.pars = (ntree == 1000)), 1)
print(id2)
testJob(id = id1)
testJob(id = id2)

## ------------------------------------------------------------------------
submitJobs()
waitForJobs()

## ------------------------------------------------------------------------
reduce = function(res) list(mce = (sum(res) - sum(diag(res))) / sum(res))
results = unwrap(reduceResultsDataTable(fun = reduce))
head(results)

## ------------------------------------------------------------------------
pars = unwrap(getJobPars())
tab = ijoin(pars, results)
head(tab)

## ------------------------------------------------------------------------
tab[ratio == 0.67, list(mmce = mean(mce)),
  by = c("algorithm", "kernel", "epsilon", "ntree")]

## ---- message = FALSE----------------------------------------------------
library(batchtools)
reg = makeRegistry(file.dir = NA, seed = 1)

## ------------------------------------------------------------------------
flakeyFunction <- function(value) {
  if (value == 5) warning("Just a simple warning")
  if (value %in% c(2, 9)) stop("Ooops.")
  value^2
}
batchMap(flakeyFunction, 1:10)

## ------------------------------------------------------------------------
testJob(id = 1)

## ------------------------------------------------------------------------
as.character(try(testJob(id = 2)))

## ------------------------------------------------------------------------
submitJobs()
waitForJobs()

## ------------------------------------------------------------------------
getStatus()

## ------------------------------------------------------------------------
findErrors()
getErrorMessages()

## ------------------------------------------------------------------------
tail(getLog(id = 9))

## ----eval=FALSE----------------------------------------------------------
#  grepLogs(pattern = "simple", ignore.case = TRUE)

## ----echo=FALSE----------------------------------------------------------
knitr::include_graphics("function_overview.png", auto_pdf = TRUE)

