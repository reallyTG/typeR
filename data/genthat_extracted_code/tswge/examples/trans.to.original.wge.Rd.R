library(tswge)


### Name: trans.to.original.wge
### Title: Transforms dual data set back to original time scale
### Aliases: trans.to.original.wge
### Keywords: TVF dual Glambda

### ** Examples
data(fig13.2c)
                   yd=trans.to.dual.wge(fig13.2c,lambda=-.4,offset=63)
                   yo=trans.to.original.wge(yd$intY,lambda=-.4,offset=63,h=yd$h)



