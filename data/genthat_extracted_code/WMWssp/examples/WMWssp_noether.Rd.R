library(WMWssp)


### Name: WMWssp_noether
### Title: Sample size calculation for the Wilcoxon-Mann-Whitney test using
###   the Noether formula
### Aliases: WMWssp_noether
### Keywords: export

### ** Examples

# Prior information for the reference group
x <- c(315,375,356,374,412,418,445,403,431,410,391,475,379)
# generate data for treatment group based on a shift effect
y <- x - 20
# this data leads to a relative effect of p = 0.349

# calculate sampe size for a balanced design
ssp <- WMWssp_noether(alpha = 0.05, power = 0.8, t =1/2, p = 0.349)
summary(ssp)



