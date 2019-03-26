library(drake)


### Name: code_to_plan
### Title: Turn an R script file or knitr / R Markdown report into a
###   'drake' workflow plan data frame.
### Aliases: code_to_plan

### ** Examples

plan <- drake_plan(
  raw_data = read_excel(file_in("raw_data.xlsx")),
  data = raw_data,
  hist = create_plot(data),
  fit = lm(Sepal.Width ~ Petal.Width + Species, data),
  strings_in_dots = "literals"
)
file <- tempfile()
# Turn the plan into an R script a the given file path.
plan_to_code(plan, file)
# Here is what the script looks like.
cat(readLines(file), sep = "\n")
# Convert back to a drake plan.
if (requireNamespace("CodeDepends")) {
  code_to_plan(file)
}



