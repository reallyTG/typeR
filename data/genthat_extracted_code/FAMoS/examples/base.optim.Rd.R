library(FAMoS)


### Name: base.optim
### Title: Fit Parameters of a Model
### Aliases: base.optim

### ** Examples

future::plan(future::sequential)

#setting data
x.values <- 1:7
y.values <-  3^2 * x.values^2 - exp(2 * x.values)

#define initial parameter values and corresponding test function
inits <- c(p1 = 3, p2 = 4, p3 = -2, p4 = 2, p5 = 0)

cost_function <- function(parms, x.vals, y.vals){
 if(max(abs(parms)) > 5){
   return(NA)
 }
 with(as.list(c(parms)), {
   res <- p1*4 + p2^2*x.vals^2 + p3*sin(x.vals) + p4*x.vals - exp(p5*x.vals)
   diff <- sum((res - y.vals)^2)
 })
}

#create directories if needed
make.directories(getwd())

#optimise the model parameters
base.optim(binary = c(0,1,1,0,1),
           parms = inits,
           fit.fn = cost_function,
           nr.of.data = length(x.values),
           homedir = getwd(),
           x.vals = x.values,
           y.vals = y.values)



