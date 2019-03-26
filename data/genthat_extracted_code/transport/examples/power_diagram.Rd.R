library(transport)


### Name: power_diagram
### Title: Compute the Power Diagram of Weighted Sites in 2-Dimensional
###   Space
### Aliases: power_diagram plot.power_diagram

### ** Examples

    xi <- runif(100)
    eta <- runif(100)
    w <- runif(100,0,0.005)
    x <- power_diagram(xi,eta,w,rect=c(0,1,0,1))
    plot(x,weights=TRUE)



