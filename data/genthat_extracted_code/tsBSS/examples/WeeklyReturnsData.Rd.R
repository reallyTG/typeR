library(tsBSS)


### Name: WeeklyReturnsData
### Title: Logarithmic Returns of Exchange Rates of 7 Currencies Against US
###   Dollar
### Aliases: WeeklyReturnsData
### Keywords: datasets

### ** Examples

plot(WeeklyReturnsData)

res <- gSOBI(WeeklyReturnsData)
res

coef(res)
plot(res)
head(bss.components(res))




