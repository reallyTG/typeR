library(drake)


### Name: reduce_plan
### Title: Write commands to reduce several targets down to one.
### Aliases: reduce_plan

### ** Examples

# Workflow plan for datasets:
x_plan <- evaluate_plan(
  drake_plan(x = VALUE),
  wildcard = "VALUE",
  values = 1:8
)
x_plan
# Create a new target from the sum of the others.
reduce_plan(x_plan, target = "x_sum", pairwise = FALSE, append = FALSE)
# Optionally include the original rows with `append = TRUE`.
reduce_plan(x_plan, target = "x_sum", pairwise = FALSE, append = TRUE)
# For memory efficiency and parallel computing,
# reduce pairwise:
reduce_plan(x_plan, target = "x_sum", pairwise = TRUE, append = FALSE)
# Optionally define your own function and use it as the
# binary operator in the reduction.
x_plan <- evaluate_plan(
  drake_plan(x = VALUE),
  wildcard = "VALUE",
  values = 1:9
)
x_plan
reduce_plan(
  x_plan, target = "x_sum", pairwise = TRUE,
  begin = "fun(", op = ", ", end = ")"
)



