library(WMWssp)


### Name: WMWssp_minimize
### Title: Minimizing samplesize for a given Type I and II error rate and
###   prior information x and y
### Aliases: WMWssp_minimize
### Keywords: export

### ** Examples

# Prior information for the reference group
x <- c(315,375,356,374,412,418,445,403,431,410,391,475,379)
# generate data for treatment group based on a shift effect
y <- x - 20

# calculate optimal t
ssp <- WMWssp_minimize(x, y, alpha = 0.05, power = 0.8)
summary(ssp)



