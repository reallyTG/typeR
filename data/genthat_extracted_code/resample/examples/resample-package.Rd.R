library(resample)


### Name: resample-package
### Title: Overview of the resample package
### Aliases: resample-package
### Keywords: nonparametric htest

### ** Examples

data(Verizon)
ILEC <- with(Verizon, Time[Group == "ILEC"])
CLEC <- with(Verizon, Time[Group == "CLEC"])

#### Sections in this set of examples
### Different ways to specify the data and statistic
### Example with plots and confidence intervals.


### Different ways to specify the data and statistic
# This code is flexible; there are different ways to call it,
# depending on how the data are stored and on the statistic.

## One-sample Bootstrap

## Not run: 
##D # Ordinary vector, give statistic as a function
##D bootstrap(CLEC, mean)
##D 
##D # Vector by name, give statistic as an expression
##D bootstrap(CLEC, mean(CLEC))
##D 
##D # Vector created by an expression, use the name 'data'
##D bootstrap(with(Verizon, Time[Group == "CLEC"]), mean(data))
##D 
##D # A column in a data frame; use the name of the column
##D temp <- data.frame(foo = CLEC)
##D bootstrap(temp, mean(foo))
##D 
##D # Put function arguments into an expression
##D bootstrap(CLEC, mean(CLEC, trim = .25))
##D 
##D # Put function arguments into a separate list
##D bootstrap(CLEC, mean, args.stat = list(trim = .25))
## End(Not run)

## Don't show: 
# Ordinary vector, give statistic as a function
bootstrap(CLEC, mean, R = 100)

# Vector by name, give statistic as an expression
bootstrap(CLEC, mean(CLEC), R = 100)

# Vector created by an expression, use the name 'data'
bootstrap(with(Verizon, Time[Group == "CLEC"]), mean(data), R = 100)

# A column in a data frame; use the name of the column
temp <- data.frame(foo = CLEC)
bootstrap(temp, mean(foo), R = 100)

# Put function arguments into an expression
bootstrap(CLEC, mean(CLEC, trim = .25), R = 100)

# Put function arguments into a separate list
bootstrap(CLEC, mean, args.stat = list(trim = .25), R = 100)
## End(Don't show)


## One-sample jackknife

# Like bootstrap. E.g.
jackknife(CLEC, mean)


## One-sample permutation test

# To test H0: two variables are independent, exactly
# one of them just be permuted. For the CLEC data,
# we'll create an artificial variable.
CLEC2 <- data.frame(Time = CLEC, index = 1:length(CLEC))

## Not run: 
##D permutationTest(CLEC2, cor(Time, index),
##D                 resampleColumns = "index")
##D # Could permute "Time" instead.
##D 
##D # resampleColumns not needed for variables outside 'data'
##D permutationTest(CLEC, cor(CLEC, 1:length(CLEC)))
## End(Not run)

## Don't show: 
permutationTest(CLEC2, cor(Time, index),
                resampleColumns = "index", R = 99)
# Could permute "Time" instead.

# resampleColumns not needed for variables outside 'data'
permutationTest(CLEC, cor(CLEC, 1:length(CLEC)), R = 99)
## End(Don't show)


### Two-sample problems
## Different ways to specify data and statistic

## Two-sample bootstrap

# Two data objects (one for each group)
## Don't show: 
bootstrap2(CLEC, data2 = ILEC, mean, R=100)
## End(Don't show)
## Not run: bootstrap2(CLEC, data2 = ILEC, mean)

# data frame containing y variable(s) and a treatment variable
## Don't show: 
bootstrap2(Verizon, mean(Time), treatment = Group, R=100)
## End(Don't show)
## Not run: bootstrap2(Verizon, mean(Time), treatment = Group)

# treatment variable as a separate object
temp <- Verizon$Group
## Don't show: 
bootstrap2(Verizon$Time, mean, treatment = temp, R=100)
## End(Don't show)
## Not run: bootstrap2(Verizon$Time, mean, treatment = temp)


## Two-sample permutation test

# Like bootstrap2. E.g.
## Don't show: 
permutationTest2(CLEC, data2 = ILEC, mean, R=99)
## End(Don't show)
## Not run: permutationTest2(CLEC, data2 = ILEC, mean


### Example with plots and confidence intervals.
## Not run: 
##D boot <- bootstrap2(CLEC, data2 = ILEC, mean)
##D perm <- permutationTest2(CLEC, data2 = ILEC, mean,
##D                          alternative = "greater")
## End(Not run)
## Don't show: 
boot <- bootstrap2(CLEC, data2 = ILEC, mean, R=100)
perm <- permutationTest2(CLEC, data2 = ILEC, mean,
                         alternative = "greater", R=99)
## End(Don't show)
## Not run: 
##D par(mfrow = c(2,2))
##D hist(boot)
##D qqnorm(boot)
##D qqline(boot$replicates)
##D hist(perm)
## End(Not run)

# P-value
perm

# Standard error, and bias estimate
boot

# Confidence intervals
CI.percentile(boot) # Percentile interval
CI.t(boot)  # t interval using bootstrap SE
# CI.bootstrapT and CI.bca do't currently support two-sample problems.

# Statistic can be multivariate.
# For the bootstrap2, it must have the estimate first, and a standard
# error second (don't need to divide by sqrt(n), that cancels out).
bootC <- bootstrap(CLEC, mean, seed = 0)
bootC2 <- bootstrap(CLEC, c(mean = mean(CLEC), sd = sd(CLEC)), seed = 0)
identical(bootC$replicates[, 1], bootC2$replicates[, 1])

CI.percentile(bootC)
CI.t(bootC)
CI.bca(bootC)
CI.bootstrapT(bootC2)
# The bootstrapT is the most accurate for skewed data, especially
# for small samples.

# By default the percentile interval is "expanded", for better coverage
# in small samples. To turn this off:
CI.percentile(bootC, expand = FALSE)



