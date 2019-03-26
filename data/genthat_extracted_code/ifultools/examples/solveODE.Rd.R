library(ifultools)


### Name: solveODE
### Title: Numerical integration of ODEs
### Aliases: solveODE
### Keywords: math

### ** Examples

## estimate response of the chaotic Lorenz system 
"lorode" <- function(x, sigma = 10, r = 28, b = 8/3){
    c(sigma * (x[2] - x[1]), x[1] * (r - x[3]) - x[2],  - b * x[3]
       + x[1] * x[2])
}

z <- solveODE(lorode,  initial=c(0.1,0.3,1), n.transient=1500,
    n.sample=2000)
nms <- c("X","Y","Z")

## plot the results 
stackPlot(x=seq(150, by=0.1, length=2000), y=z,
    ylab=nms, main="Lorenz System in Chaos", xlab="Time")



