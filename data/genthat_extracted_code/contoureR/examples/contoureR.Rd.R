library(contoureR)


### Name: contoureR
### Title: contoureR: Contouring of Non-Regular Three-Dimensional Data
### Aliases: contoureR

### ** Examples

# Contour Lines for a Function, Constrained to a limited domain
# Example of the provision of non-regular data
library(contoureR)
library(ggplot2)
a  = -2; b = +2; n  = 150
x  = runif(n*n,a,b)
y  = runif(n*n,a,b)
df = data.frame(x,y)
df$z   = with(df,-x*y*exp(-x^2-y^2))
df.sub = subset(df,x^2 + y^2 < 2)
df.cnt = getContourLines(df.sub,nlevels=20)
ggplot(data=df.cnt,aes(x,y,group=Group,colour=z)) + geom_path() + theme_bw()



