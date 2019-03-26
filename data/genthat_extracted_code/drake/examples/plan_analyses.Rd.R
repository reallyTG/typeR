library(drake)


### Name: plan_analyses
### Title: Generate a workflow plan data frame to analyze multiple datasets
###   using multiple methods of analysis.
### Aliases: plan_analyses

### ** Examples

# Create the piece of the workflow plan for the datasets.
datasets <- drake_plan(
  small = simulate(5),
  large = simulate(50))
# Create a template for the analysis methods.
methods <- drake_plan(
  regression1 = reg1(dataset__),
  regression2 = reg2(dataset__))
# Evaluate the wildcards to create the part of the workflow plan
# encoding the analyses of the datasets.
ans <- plan_analyses(methods, datasets = datasets)
ans
# For the final workflow plan, row bind the pieces together.
my_plan <- rbind(datasets, ans)
my_plan



