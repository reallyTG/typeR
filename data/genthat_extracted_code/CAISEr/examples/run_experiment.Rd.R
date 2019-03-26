library(CAISEr)


### Name: run_experiment
### Title: Run a full experiment
### Aliases: run_experiment

### ** Examples

# Example using dummy algorithms and instances. See ?dummyalgo for details.
# In this case all instances are the same, so we expect all cases to return
# a percent difference of approx. phi.j = 1.0 and sample sizes of
# approx. n1 = 31, n2 = 87
algorithm1 <- list(FUN = "dummyalgo", alias = "algo1",
                   distribution.fun = "rnorm",
                   distribution.pars = list(mean = 10, sd = 1))
algorithm2 <- list(FUN = "dummyalgo", alias = "algo2",
                   distribution.fun = "rnorm",
                   distribution.pars = list(mean = 20, sd = 4))
algolist <- list(algorithm1, algorithm2)
instlist <- vector(100, mode = "list")
for (i in 1:100) instlist[[i]] <- list(FUN = "dummyinstance",
                                       alias = paste0("Inst. ", i))

my.results <- run_experiment(Instance.list = instlist,
                             Algorithm.list = algolist,
                             power = 0.8,
                             d = 1,
                             sig.level = 0.01,
                             se.max = 0.05,
                             dif = "perc",
                             nmax   = 200,
                             seed   = 1234,
                             ncpus  = 1)

# Take a look at the summary table
my.results$data.summary

# To perform inference on the results:
t.test(my.results$data.summary$phi.j, conf.level = 0.95)

# Test assumption of normality (of the data)
shapiro.test(my.results$data.summary$phi.j)



