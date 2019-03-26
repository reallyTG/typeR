library(lasso2)


### Name: plot.l1celist
### Title: Plot Method for 'l1celist' Objects
### Aliases: plot.l1celist
### Keywords: hplot

### ** Examples

data(Prostate)
l1c.P <- l1ce(lpsa ~ ., Prostate, bound=(1:20)/20)
length(l1c.P)# 20 l1ce models
plot(l1c.P)



