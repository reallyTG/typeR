library(TeachingDemos)


### Name: pairs2
### Title: Create part of a scatterplot matrix
### Aliases: pairs2
### Keywords: hplot

### ** Examples

pairs2(iris[,1:2], iris[,3:4], col=c('red','green','blue')[iris$Species])

# compare the following plot:
pairs(state.x77, panel=panel.smooth)

# to the following 4 plots

pairs(state.x77[,1:4], panel=panel.smooth)
pairs(state.x77[,5:8], panel=panel.smooth)
pairs2( state.x77[,1:4], state.x77[,5:8], panel=panel.smooth)
pairs2( state.x77[,5:8], state.x77[,1:4], panel=panel.smooth)




