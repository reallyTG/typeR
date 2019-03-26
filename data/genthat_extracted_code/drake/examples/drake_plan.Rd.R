library(drake)


### Name: drake_plan
### Title: Create a workflow plan data frame for the 'plan' argument of
###   'make()'.
### Aliases: drake_plan

### ** Examples

test_with_dir("Contain side effects", {
# Create workflow plan data frames.
mtcars_plan <- drake_plan(
  write.csv(mtcars[, c("mpg", "cyl")], file_out("mtcars.csv")),
  value = read.csv(file_in("mtcars.csv")),
  strings_in_dots = "literals"
)
mtcars_plan
make(mtcars_plan) # Makes `mtcars.csv` and then `value`
head(readd(value))
# You can use knitr inputs too. See the top command below.
load_mtcars_example()
head(my_plan)
# The `knitr_in("report.Rmd")` tells `drake` to dive into the active
# code chunks to find dependencies.
# There, `drake` sees that `small`, `large`, and `coef_regression2_small`
# are loaded in with calls to `loadd()` and `readd()`.
deps_code("report.Rmd")
# You can create your own custom columns too.
# See ?triggers for more on triggers.
drake_plan(
  website_data = target(
    command = download_data("www.your_url.com"),
    trigger = "always",
    custom_column = 5
  ),
  analysis = analyze(website_data),
  strings_in_dots = "literals"
)
# Are you a fan of tidy evaluation?
my_variable <- 1
drake_plan(
  a = !!my_variable,
  b = !!my_variable + 1,
  list = c(d = "!!my_variable")
)
drake_plan(
  a = !!my_variable,
  b = !!my_variable + 1,
  list = c(d = "!!my_variable"),
  tidy_evaluation = FALSE
)
# For instances of !! that remain unevaluated in the workflow plan,
# make() will run these commands in tidy fashion,
# evaluating the !! operator using the environment you provided.
})



