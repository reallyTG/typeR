library(sfsmisc)


### Name: loessDemo
### Title: Graphical Interactive Demo of loess()
### Aliases: loessDemo
### Keywords: loess dynamic hplot

### ** Examples

if(dev.interactive()) {

 if(requireNamespace("lattice")) {
    data("ethanol", package = "lattice")
    attach(ethanol)
    loessDemo(E,NOx, span=.25)
    loessDemo(E,NOx, span=.25, family = "symmetric")

    loessDemo(E,NOx, degree=0)# Tricube Kernel estimate
  }

 ## Artificial Example with one outlier
 n2 <- 50; x <- 1:(1+2*n2)
 fx <- (x/10 - 5)^2
 y <- fx + 4*rnorm(x)
 y[n2+1] <- 1e4
 loessDemo(x,y, span=1/3, ylim= c(0,1000))# not robust !!
 loessDemo(x,y, span=1/3, family = "symm")
 loessDemo(x,y, span=1/3, family = "symm", w.symb = FALSE, ylim = c(0,40))
 loessDemo(x,y, span=1/3, family = "symm", ylim = c(0,40))
 ## but see warnings() --- there's a "fixup"

}



