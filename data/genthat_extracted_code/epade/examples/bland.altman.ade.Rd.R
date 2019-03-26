library(epade)


### Name: bland.altman.ade
### Title: Bland-Altman plot
### Aliases: bland.altman.ade
### Keywords: scatter

### ** Examples

x<-rnorm(1000, 0, 3)
y<-x+rnorm(1000, 1, 0.5)
bland.altman.ade(x, y, wall=2)



