library(WMWssp)


### Name: WMWssp
### Title: Sample size calculation for the Wilcoxon-Mann-Whitney test.
### Aliases: WMWssp
### Keywords: export

### ** Examples

# Prior information for the reference group
x <- c(315,375,356,374,412,418,445,403,431,410,391,475,379)
# generate data for treatment group based on a shift effect
y <- x - 20

# calculate sample size
ssp <- WMWssp(x, y, alpha = 0.05, power = 0.8, t = 1/2)
summary(ssp)



