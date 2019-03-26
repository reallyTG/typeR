library(WMWssp)


### Name: WMWssp_maximize
### Title: Maximizing power for a given Type I error rate and prior
###   information x and y
### Aliases: WMWssp_maximize
### Keywords: export

### ** Examples

# Prior information for the reference group
x <- c(315,375,356,374,412,418,445,403,431,410,391,475,379)
# generate data for treatment group based on a shift effect
y <- x - 20

#
N <- 112

# calculate optimal t
ssp <- WMWssp_maximize(x, y, alpha = 0.05, N)
summary(ssp)



