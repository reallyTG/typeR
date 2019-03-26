library(lmf)


### Name: summary.lmf
### Title: Summarizing lmf fits
### Aliases: summary.lmf print.summary.lmf

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#Fit model
lmf.1 <- lmf(formula = cbind(recruits, survival) ~ weight + tars,
               age = age, year = year, data = sparrowdata)
#Summary
summary(lmf.1)
#Summary from within years
summary(lmf.1, what.level = "year")
#Summary from within age classes
summary(lmf.1, what.level = "age")



