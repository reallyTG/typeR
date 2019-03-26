library(vegan)


### Name: clamtest
### Title: Multinomial Species Classification Method (CLAM)
### Aliases: clamtest summary.clamtest plot.clamtest
### Keywords: htest

### ** Examples

data(mite)
data(mite.env)
sol <- with(mite.env, clamtest(mite, Shrub=="None", alpha=0.005))
summary(sol)
head(sol)
plot(sol)



