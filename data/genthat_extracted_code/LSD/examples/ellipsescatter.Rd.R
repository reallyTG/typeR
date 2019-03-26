library(LSD)


### Name: ellipsescatter
### Title: Visualize subgroups of two-dimensional data assuming normal
###   distributions
### Aliases: LSD.ellipsescatter ellipsescatter
### Keywords: scatterplot

### ** Examples

x = c(rnorm(50),rnorm(100,2),rnorm(50,4))
y = (x + rnorm(200,0,0.8))*rep(c(1,4,1),c(50,100,50))
x = sign(x)*abs(x)^1.3

groups = list("Green" = 1:50,"Red" = 51:150,"Blue" = 151:200)
colors = c("darkgreen","darkred","darkblue")
ellipsescatter(x,y,groups,colors,location = "topleft")



