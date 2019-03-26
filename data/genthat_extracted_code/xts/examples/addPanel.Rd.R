library(xts)


### Name: addPanel
### Title: Add a panel to an existing xts plot
### Aliases: addPanel

### ** Examples

library(xts)
data(sample_matrix)
sample.xts <- as.xts(sample_matrix)

calcReturns <- function(price, method = c("discrete", "log")){
  px <- try.xts(price)
  method <- match.arg(method)[1L]
  returns <- switch(method,
    simple = ,
    discrete = px / lag(px) - 1,
    compound = ,
    log = diff(log(px)))
  reclass(returns, px)
}

# plot the Close
plot(sample.xts[,"Close"])
# calculate returns 
addPanel(calcReturns, method="discrete", type="h")
# Add simple moving average to panel 1
addPanel(rollmean, k=20, on=1)
addPanel(rollmean, k=40, col="blue", on=1)



