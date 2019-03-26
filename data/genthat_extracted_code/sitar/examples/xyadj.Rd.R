library(sitar)


### Name: xyadj
### Title: Adjust x and y variables for SITAR random effects
### Aliases: xyadj

### ** Examples


data(heights)
## fit sitar model for height
m1 <- sitar(x=age, y=height, id=id, data=heights, df=5)

## plot unadjusted data as growth curves
plot(m1, opt='u')

## overplot with adjusted data as points
with(heights, points(xyadj(m1), col='red', pch=19))




