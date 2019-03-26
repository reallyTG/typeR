library(asymmetry)


### Name: plot.slidevector
### Title: Configuration Plot for the Slide-vector Model
### Aliases: plot.slidevector

### ** Examples

## 2D plot for the slide-vector model on generated data
dis <- matrix(c(1, 2, 3, 4, 5, 6, 2, 8, 9, 3), nrow = 5, ncol = 2)   #configuration
a <- rbind(dis, dis+1.5)                                             #generate slide-vector
test <- as.matrix(dist(a))[1:5, 6:10]                                #extract data
v <- slidevector(test, ndim = 2, itmax = 250, eps = .001)
plot(v)



