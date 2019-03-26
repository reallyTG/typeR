library(EQL)


### Name: eql
### Title: The Extended Quasi-Likelihood Function
### Aliases: eql plot.eql

### ** Examples

## Power Variance Family
# Data from Box and Cox (1964)
x <- (-1:1)
y <- c(674,370,292,338,266,210,170,118,90,1414,1198,634,1022,620,438,
       442,332,220,3636,3184,2000,1568,1070,566,1140,884,360)
yarn.raw <- data.frame(expand.grid(x3=x, x2=x, x1=x), cycles=y)
yarn <- data.frame(x1=yarn.raw$x1, x2=yarn.raw$x2, x3=yarn.raw$x3,
   cycles=yarn.raw$cycles)
attach(yarn)

ps.power <- list(theta=seq(1, 4, length = 20))
eq.power <- eql(cycles~x1+x2+x3, param.space=ps.power,
   family=powerVarianceFamily("log"), smooth.grid=500)
plot(eq.power)

## Not run: 
##D ## Extended Binomial Variance Family
##D # Data from McCullagh & Nelder: GLM, p. 329
##D # (zeros replaced by 'NA')
##D 
##D site <- rep(1:9, each=10)
##D variety <- rep(1:10, 9)
##D resp <- c(0.05,NA,NA,0.10,0.25,0.05,0.50,1.30,1.50,1.50,
##D    NA,0.05,0.05,0.30,0.75,0.30,3,7.50,1,12.70,1.25,1.25,
##D    2.50,16.60,2.50,2.50,NA,20,37.50,26.25,2.50,0.50,0.01,
##D    3,2.50,0.01,25,55,5,40,5.50,1,6,1.10,2.50,8,16.50,
##D    29.50,20,43.50,1,5,5,5,5,5,10,5,50,75,5,0.10,5,5,
##D    50,10,50,25,50,75,5,10,5,5,25,75,50,75,75,75,17.50,
##D    25,42.50,50,37.50,95,62.50,95,95,95) / 100
##D 
##D ps.binomial <- list(seq(1, 2.2, length=32), seq(1, 3, length=32))
##D eq.binomial <- eql(resp~site*variety, param.space=ps.binomial,
##D    family=extBinomialVarianceFamily())
##D plot(eq.binomial)
## End(Not run)



