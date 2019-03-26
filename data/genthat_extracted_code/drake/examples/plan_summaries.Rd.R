library(drake)


### Name: plan_summaries
### Title: Generate a workflow plan data frame for summarizing multiple
###   analyses of multiple datasets multiple ways.
### Aliases: plan_summaries

### ** Examples

# Create the part of the workflow plan data frame for the datasets.
datasets <- drake_plan(
  small = simulate(5),
  large = simulate(50))
# Create a template workflow plan containing the analysis methods.
methods <- drake_plan(
  regression1 = reg1(dataset__),
  regression2 = reg2(dataset__))
# Generate the part of the workflow plan to analyze the datasets.
analyses <- plan_analyses(methods, datasets = datasets)
# Create a template workflow plan dataset with the
# types of summaries you want.
summary_types <- drake_plan(
  summ = summary(analysis__),
  coef = coefficients(analysis__))
# Evaluate the appropriate wildcards to encode the summary targets.
plan_summaries(summary_types, analyses, datasets, gather = NULL)
plan_summaries(summary_types, analyses, datasets)
plan_summaries(summary_types, analyses, datasets, gather = "list")
summs <- plan_summaries(
  summary_types, analyses, datasets, gather = c("list", "rbind"))
# For the final workflow plan, row bind the pieces together.
my_plan <- rbind(datasets, analyses, summs)
my_plan



