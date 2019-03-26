library(surveillance)


### Name: twinSIR_simulation
### Title: Simulation of Epidemic Data
### Aliases: simEpidata simulate.twinSIR
### Keywords: datagen models

### ** Examples

## Generate a data frame containing a hypothetic population with 100 individuals
set.seed(1234)
n <- 100
pos <- matrix(rnorm(n*2), ncol=2, dimnames=list(NULL, c("x", "y")))
pop <- data.frame(id=1:n, x=pos[,1], y=pos[,2], 
                  gender=sample(0:1, n, replace=TRUE),
                  I0col=c(rep(1,3),rep(0,n-3)), # 3 initially infectious
                  start=rep(0,n), stop=rep(Inf,n))

## Simulate an SIR epidemic in this population
set.seed(123)
infPeriods <- setNames(c(1:3/10, rexp(n-3, rate=1)), 1:n)
epi <- simEpidata(
    cbind(start,stop) ~ cox(gender), data = pop,
    id = "id", I0.col = "I0col", coords.cols = c("x","y"),
    beta = c(-2), h0 = -1, alpha = c(B1=0.1), f = list(B1=function(u) u<=1),
    infPeriod = function(ids) infPeriods[ids],
    ##remPeriod = function(ids) rexp(length(ids), rate=0.1), end = 30   # -> SIRS
)

## extract event times by id
head(summary(epi)$byID)

## Plot the numbers of susceptible, infectious and removed individuals
plot(epi)


## load data of an artificial epidemic
data("fooepidata")
summary(fooepidata)
plot(fooepidata)

if (surveillance.options("allExamples"))
{
  ## simulate a new evolution of the epidemic
  set.seed(1)
  simepi <- simEpidata(cbind(start, stop) ~ cox(z1) + cox(z1):cox(z2),
      data = fooepidata, 
      beta = c(1,0.5), h0 = -7, alpha = c(B2 = 0.01, B1 = 0.005),
      f = list(B1 = function(u) u <= 1, B2 = function(u) u > 1),
      infPeriod = function(ids) rexp(length(ids), rate=0.2), trace = FALSE)
  summary(simepi)
  plot(simepi)
  intensityplot(simepi)
}

## load a model fitted to the 'fooepidata' epidemic
data("foofit")
foofit

## simulate a new epidemic using the model and parameter estimates of 'foofit'
## and set simulation period = observation period
# a) with observed infPeriods (i.e. fixed length 3 days):
simfitepi1 <- simulate(foofit, data=fooepidata)
plot(simfitepi1)
# b) with new infPeriods (simuluated from the Exp(0.3) distribution):
simfitepi2 <- simulate(foofit, data=fooepidata,
                       infPeriod=function(ids) rexp(length(ids), rate=0.3))
plot(simfitepi2)
intensityplot(simfitepi2, which="total", aggregate=FALSE,
              col=rgb(0,0,0,alpha=0.1))



