library(mousetrack)


### Name: interpltraj
### Title: Get Mouse Dependent Variables
### Aliases: interpltraj
### Keywords: ts

### ** Examples


data(mousemove)
x = mousemove$x; y = mousemove$y;
singlepoint = FALSE; tsmax = 101
ans = interpltraj(x, y, singlepoint, tsmax)

str(ans)





