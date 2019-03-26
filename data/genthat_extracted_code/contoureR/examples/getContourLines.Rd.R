library(contoureR)


### Name: getContourLines
### Title: Get Contour Lines (data.frame)
### Aliases: getContourLines

### ** Examples

# Contour Lines for Volcano Data
library(ggplot2)
data(volcano)
x = 1:nrow(volcano)
y = 1:ncol(volcano)
z = expand.grid(x=x,y=y); z$z = apply(z,1,function(xx){ volcano[ xx[1],xx[2] ]} )
df = getContourLines(z)
ggplot(df,aes(x,y,group=Group,colour=z)) + geom_path()

# Contour Lines for a Function
library(ggplot2)
a      = -2; b = 2; n = 75
x  = y = seq(a,b,by=diff(c(a,b))/(n+1))
df     = expand.grid(x=x,y=y)
df$z   = with(df,-x*y*exp(-x^2-y^2))
df.cnt = getContourLines(df)
ggplot(data=df.cnt,aes(x,y,group=Group,colour=z)) + geom_path()



