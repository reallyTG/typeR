library(MOTE)


### Name: r.correl
### Title: r to Coefficient of Determination (R2) from F
### Aliases: r.correl
### Keywords: correlation effect size,

### ** Examples


#This example is derived from the mtcars dataset provided in R.

#What is the correlation between miles per gallon and car weight?

cor.test(mtcars$mpg, mtcars$wt)

r.correl(r = -0.8676594, n = 32, a = .05)



