library(lamme)


### Name: lanova
### Title: Logged ANOVA
### Aliases: lanova

### ** Examples

# generate data
y1=rnorm(1000,5,1)+rnorm(1000)
y2=rnorm(1000,5.5,1)+rnorm(1000)
y3=rnorm(1000,6,1)+rnorm(1000)
y1=exp(y1)
y2=exp(y2)
y3=exp(y3)
dep=c(y1,y2,y3)
tc=rep(c(0,1,2),each=1000)
# applying lanova with the generated data
lanova(dep,tc)



