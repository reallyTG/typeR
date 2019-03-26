library(changepoint.mv)


### Name: show
### Title: Displays S4 objects produced by changepoint.mv methods
### Aliases: show show,changepoint.mv.mrc.class-method

### ** Examples


library(changepoint.mv)
data(mrcexample)
res<-mrc(mrcexample)
# the following lines all produce the same output
res
summary(res)
show(res)
print(res)




