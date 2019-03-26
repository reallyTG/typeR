library(drake)


### Name: map_plan
### Title: Create a plan that maps a function to a grid of arguments.
### Aliases: map_plan

### ** Examples

# For the full tutorial, visit
# https://ropenscilabs.github.io/drake-manual/plans.html#map_plan.
my_model_fit <- function(x1, x2, data) {
  lm(as.formula(paste("mpg ~", x1, "+", x1)), data = data)
}
covariates <- setdiff(colnames(mtcars), "mpg")
args <- t(combn(covariates, 2))
colnames(args) <- c("x1", "x2")
args <- tibble::as_tibble(args)
args$data <- "mtcars"
args$data <- rlang::syms(args$data)
args$id <- paste0("fit_", args$x1, "_", args$x2)
args
plan <- map_plan(args, my_model_fit)
plan
# Consider `trace = TRUE` to include the columns in `args`
# in your plan.
map_plan(args, my_model_fit, trace = TRUE)
# And of course, you can execute the plan and
# inspect your results.
cache <- storr::storr_environment()
make(plan, verbose = FALSE, cache = cache)
readd(fit_cyl_disp, cache = cache)



