library(LSD)


### Name: heathist
### Title: Color a histogram
### Aliases: LSD.heathist heathist
### Keywords: histogram

### ** Examples

x = rnorm(1000,mean = sample(c(0,3),size = 1000,prob = c(0.4,0.6),replace = TRUE))
heathist(x,xlab="x",add.density=TRUE,col.rug="darkred")

heathist(x,xlab="x",colpal = "matlablike")



