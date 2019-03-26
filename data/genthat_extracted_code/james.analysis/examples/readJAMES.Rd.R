library(james.analysis)


### Name: readJAMES
### Title: Read analysis results from JSON file
### Aliases: readJAMES

### ** Examples

# get path to raw JSON file included in package distribution
json.file <- system.file("extdata", "james.json", package = "james.analysis")

# read results from file
james <- readJAMES(json.file)
summary(james)

# plot convergence curves for coconut data set
plotConvergence(james, problem = "coconut", min.time = 1000, max.time = 100000)

# create box plots of solution values (quality) and convergence times
boxplot(james, problem = "coconut")
boxplot(james, problem = "coconut", type = "time")

# extract solution values and convergence times for parallel tempering and random descent
values.pt <- getBestSolutionValues(james, problem = "coconut", search = "Parallel Tempering")
times.pt <- getConvergenceTimes(james, problem = "coconut", search = "Parallel Tempering")
values.rd <- getBestSolutionValues(james, problem = "coconut", search = "Random Descent")
times.rd <- getConvergenceTimes(james, problem = "coconut", search = "Random Descent")

# perform wilcoxon test to compare distributions across algorithms
values.test <- wilcox.test(values.pt, values.rd)
values.test
times.test <- wilcox.test(times.pt, times.rd)
times.test

# adjust p-values for multiple testing
p.adjust(c(values.test$p.value, times.test$p.value))



