library(contoureR)


### Name: contourLinesR
### Title: Get Contour Lines (list)
### Aliases: contourLinesR

### ** Examples

library(contoureR)
library(ggplot2)
x = runif(100)
y = runif(100)
df = expand.grid(x=x,y=y)
z  = with(df,x+y)
result = contourLinesR(df$x,df$y,z)



