library(lmf)


### Name: lmf
### Title: Fitting age-structured selection model
### Aliases: lmf print.lmf

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#Fit model
lmf.1 <- lmf(formula = cbind(recruits, survival) ~ weight + tars,
               age = age, year = year, data = sparrowdata)
#View diagnostic plots
plot(lmf.1)
#View output
print(lmf.1)
#Print summary
summary(lmf.1)



