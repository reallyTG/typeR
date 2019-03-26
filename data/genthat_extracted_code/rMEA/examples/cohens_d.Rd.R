library(rMEA)


### Name: cohens_d
### Title: Cohen's d A simple function to calculate Cohen's d effect size
### Aliases: cohens_d

### ** Examples

# Generates two samples with means distance of 1 sd
x = rnorm(1000, mean = 10, sd = 1.5)
y = rnorm(1000, mean = 11.5, sd = 1.5)
# cohen's d should approximate to 1
cohens_d(x,y)



