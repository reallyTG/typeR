library(samplingbook)


### Name: submean
### Title: Sub-sample Mean Estimation
### Aliases: submean

### ** Examples

y <- c(23,33,24,25,72,74,71,37,42)
psu <- as.factor(c(1,1,1,1,2,2,2,3,3))
# with finite population correction
submean(y, PSU=psu, N=700, M=23, Nl=c(100,50,75), method='ratio')
# without finite population correction
submean(y, PSU=psu, N=700, m.weight=3/23, n.weight=c(4/100,3/50,2/75), method='ratio')

# Chinese wage data
data(wage)
summary(wage)
submean(wage$Wage,PSU=wage$Region, N=990, M=33, Nl=rep(30,14))



