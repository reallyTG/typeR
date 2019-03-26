library(shotGroups)


### Name: drawCircle
### Title: Draw a circle
### Aliases: drawCircle drawCircle.list drawCircle.default

### ** Examples

c1 <- c(1, 2)                 # circle center
c2 <- c(2, 3)                 # another circle center
r1 <- 2                       # circle radius
r2 <- 0.5                     # another circle radius

# determine axis limits so that circles will be visible
xLims <- c1[1] + c(-r1, r1)
yLims <- c1[2] + c(-r1, r1)

plot(c1[1], c1[2], type='n', asp=1, xlim=xLims, ylim=yLims)
drawCircle(c1, r1, fg='blue', colCtr='blue', pch=19)
drawCircle(c2, r2, fg='red', bg='red', colCtr='black', pch=4)



