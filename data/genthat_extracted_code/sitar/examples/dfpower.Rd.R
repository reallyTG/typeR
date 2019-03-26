library(sitar)


### Name: dfpower
### Title: Tabulate BIC of SITAR models by degrees of freedom and xy power
###   transformations
### Aliases: dfpower

### ** Examples

data(heights)
m1 <- sitar(log(age), height, id, heights, 4)
dfpower(m1, df=4:5, xpowers=0:1, maxIter=4)



