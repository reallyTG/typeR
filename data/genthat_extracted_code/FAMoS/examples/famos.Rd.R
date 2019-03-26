library(FAMoS)


### Name: famos
### Title: Automated Model Selection
### Aliases: famos

### ** Examples

future::plan(future::sequential)

#setting data
x.values <- 1:7
y.values <-  3^2 * x.values^2 - exp(2 * x.values)

#define initial conditions and corresponding test function
inits <- c(p1 = 3, p2 = 4, p3 = -2, p4 = 2, p5 = 0)

cost_function <- function(parms, x.vals, y.vals){
 if(max(abs(parms)) > 5){
   return(NA)
 }
 with(as.list(c(parms)), {
   res <- 4*p1 + p2^2*x.vals^2 + p3*sin(x.vals) + p4*x.vals - exp(p5*x.vals)
   diff <- sum((res - y.vals)^2)
 })
}

#set swap set
swaps <- list(c("p1", "p5"))

#perform model selection
res <- famos(init.par = inits,
            fit.fn = cost_function,
            nr.of.data = length(y.values),
            homedir = getwd(),
            method = "swap",
            swap.parameters = swaps,
            init.model.type = c("p1", "p3"),
            optim.runs = 1,
            x.vals = x.values,
            y.vals = y.values)



