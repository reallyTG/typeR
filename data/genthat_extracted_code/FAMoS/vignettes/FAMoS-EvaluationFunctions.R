## ----setup, include = FALSE, echo = FALSE--------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----createdata, echo = T, results="hide", warning=FALSE-----------------
library(FAMoS)
 #set the future plan (see future documentation for more information)
 future::plan(future::sequential)

 #create data with standard deviation of 1
 x.values <- 1:7
 y.values <-  9 * x.values^2 - exp(2 * x.values)
 sd.y.values <- rep(1,7)

 #define initial parameter values
 inits <- c(p1 = 3, p2 = 4, p3 = -2, p4 = 2, p5 = 0)

 #define cost function that returns the negative log-likelihood
 cost_function <- function(parms, x.vals, y.vals, sd.y){
  # restrict the search range to -5 to +5
  if(max(abs(parms)) > 5){
    return(NA)
  }
  with(as.list(c(parms)), {
    res <- p1*4 + p2*x.vals + p3^2*x.vals^2 + p4*sin(x.vals)  - exp(p5*x.vals)
    diff <- sum((res - y.vals)^2/sd.y)
  })
 }

 #define swap parameter sets
 swaps <- list(c("p1", "p5"))
 
 #perform model selection
 res <- famos(init.par = inits,
            fit.fn = cost_function,
            nr.of.data = length(y.values),
            homedir = getwd(),
            init.model.type = c("p1", "p2"),
            optim.runs = 1,
            method = "swap",
            swap.parameters = swaps,
            x.vals = x.values,
            y.vals = y.values,
            sd.y = sd.y.values,
            save.performance = F)

## ----famosperformance, fig.width = 4, fig.align= "center", fig.height=6----
famos.performance(input = res$mrun)

## ----ic.order, fig.width = 4, fig.align= "center", fig.height=4----------
 ic.order(input = getwd(), mrun = res$mrun, log = "y")

## ----ic.order2,fig.width = 4, fig.align= "center", fig.height=4----------
 par(mfrow = c(1,2))
 ic.order(input = getwd(), mrun = res$mrun, colour.par = "p1", log = "y")
 ic.order(input = getwd(), mrun = res$mrun, colour.par = "p5", log = "y")

## ----aicc.weights,fig.width = 4, fig.align= "center", fig.height=4-------
aicc.weights(input = getwd(), mrun = res$mrun)

