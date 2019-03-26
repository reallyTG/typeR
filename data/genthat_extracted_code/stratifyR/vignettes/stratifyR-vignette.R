## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----include=TRUE--------------------------------------------------------
data(quakes)
head(quakes)
mag <- quakes$mag
length(mag)
hist(mag) #to see the distribution
library(stratifyR)
strata.data(mag, h = 2, n=300) # a 2-strata solution

## ----include=TRUE--------------------------------------------------------
data(quakes) 
depth <- quakes$depth
hist(depth) #see distribution
min(depth); max(depth); d=max(depth)-min(depth);d #min, max and range of data 
# the 2-strata solution is
strata.distr(h=2, initval=40, dist=640, distr = "triangle",
             params = c(min=39.99998, max=680, mode=39.99999), n=300, N=1000)

## ----include=TRUE--------------------------------------------------------
set.seed(8235411)
pareto_data <- rpareto(5000, shape=5, scale=8)
head(pareto_data)
hist(pareto_data, breaks=100)
min(pareto_data); max(pareto_data); d=max(pareto_data)-min(pareto_data);d
fit <- fitdist(pareto_data, "pareto", start = list(shape = 1, scale = 500))
fit
strata.data(pareto_data, h = 2, n=500) # a 2-strata solution

## ----include=TRUE--------------------------------------------------------
strata.distr(h=2, initval=0.15, dist=38.55, distr = "pareto",
             params = c(shape=5.05, scale=8.20), n=500, N=5000)

## ----include=TRUE--------------------------------------------------------
data(math)
final_marks <- math$final_marks
hist(final_marks)
strata.data(final_marks, h = 2, n=150) # a 2-strata solution

## ----include=TRUE--------------------------------------------------------
data(math)
final_marks <- math$final_marks
eps = 1e-8; a <- min(final_marks); b <- max(final_marks); c=b-a# and with mode=54
a;b;c
#find out the estimated parameters
fit <- fitdist(final_marks, distr = "triang", method="mle", lower=c(0,0),
               start = list(min = a-eps, max = b+eps, mode = 54))
fit
# 2-strata solution
strata.distr(h=2, initval=7, dist=90, distr = "triangle",
      params = c(min=6.205364, max=98.469797, mode=53.999994), n=150, N=352)

## ----include=TRUE--------------------------------------------------------
#Generate RT data
set.seed(12546)
data <- rtriangle(n=1000, a=2, b=8, c=2) #right-triangular since a=c
hist(data)
strata.data(data, h = 2, n=500) # a 2-strata solution

## ----include=TRUE--------------------------------------------------------
strata.distr(h=2, initval=1.007202, dist=0.992781, distr = "rtriangle",
         params = c(min=2, max=10, mode=2), n=500, N=1000)

## ----include=TRUE--------------------------------------------------------
data(anaemia) #using the anaemia data
Iron <- anaemia$Iron
hist(Iron)
strata.data(Iron, h = 2, n=500) # a 2-strata solution

## ----include=TRUE--------------------------------------------------------
strata.distr(h=2, initval=2.9, dist=55.9, distr = "weibull",
       params = c(shape=2.144586, scale=13.790744), n=500, N=5000)

## ----include=TRUE--------------------------------------------------------
data(anaemia)
Folate <- anaemia$Folate
hist(Folate)
strata.data(Folate, h = 2, n=500) # a 2-strata solution

## ----include=TRUE--------------------------------------------------------
strata.distr(h=2, initval=0.5, dist=50, distr = "gamma",
       params = c(shape=3.835768, rate=0.340328), n=500, N=12000)

## ----include=TRUE--------------------------------------------------------
set.seed(28951)
data <- rexp(5000, rate = 1.36)
hist(data)
strata.data(data, h = 2, n=500) # a 2-strata solution

## ----include=TRUE--------------------------------------------------------
set.seed(28951)
data <- rexp(5000, rate = 1.36)
min(data); max(data); d=max(data)-min(data);d
fit <- fitdist(data, distr="exp", method="mle")
fit
strata.distr(h=2, initval=5.748e-05, dist=8.017, distr = "exp", 
             params = c(rate=1.36), n=500, N=5000) #a 2-strata solution

## ----include=TRUE--------------------------------------------------------
set.seed(15669)
data <- runif(5000, min = 2, max = 15)
hist(data)
strata.data(data, h = 2, n=450) # a 2-strata solution

## ----include=TRUE--------------------------------------------------------
strata.distr(h=2, initval=3, dist=12, distr = "unif",
                 params = c(min=3, max=15), n=450, N=5000)

## ----include=TRUE--------------------------------------------------------
set.seed(89821)
data <- rnorm(5000, mean = 16, sd = 1.65)
hist(data)
strata.data(data, h = 2, n=500) #construct a 2-strata solution

## ----include=TRUE--------------------------------------------------------
set.seed(89821)
data <- rnorm(5000, mean = 16, sd = 1.65)
min(data); max(data); d=max(data)-min(data);d
fit <- fitdist(data, distr="norm", method="mle")
fit
strata.distr(h=2, initval=9.923816, dist=12.58885, distr = "norm",
             params = c(mean=16.010776, sd=1.662357), n=500, N=5000)

## ----include=TRUE--------------------------------------------------------
data(hies)
Expenditure <- hies$Expenditure
head(Expenditure);length(Expenditure)
hist(Expenditure)
min(Expenditure); max(Expenditure); d=max(Expenditure)-min(Expenditure);d
fit <- fitdist(Expenditure, distr="lnorm", method="mle")
fit
strata.data(Expenditure, h = 2, n=500) 


## ----include=TRUE--------------------------------------------------------
strata.distr(h=2, initval=10, dist=188, distr = "lnorm",
             params = c(meanlog=3.23, sdlog=0.65), n=500, N=1588)

## ----include=TRUE--------------------------------------------------------
data(Boston) #Housing Values in Suburbs of Boston
black = Boston$black
hist(black)
min(black); max(black); d=max(black)-min(black);d
fit <- fitdist(black, distr="cauchy", method="mle")
fit
strata.data(black, h = 2, n=500)

## ----include=TRUE--------------------------------------------------------
#for a cauchy distribution with initial value of x0=-1, d=2 and 
#location and scale parameters 0 and 1 respectively
strata.distr(h=2, initval=-1, dist=2, distr = "cauchy",
             params = c(location=0, scale=1), n=500, N=5000)

