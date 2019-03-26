library(HRW)


### Name: capm
### Title: Stock indices
### Aliases: capm

### ** Examples

# The Capital Asset Pricing Model (CAPM) states that the excess returns on a stock 
# have a linear relationship with the returns on the market. This example investigates
# the CAPM for General Electric stock:

library(HRW) ; data(capm)
n <- dim(capm)[1]
riskfree <- capm$Close.tbill[2:n]/365
elrGE <- diff(log(capm$Close.ge)) - riskfree
elrSP500 <- diff(log(capm$Close.sp500)) - riskfree
plot(elrSP500,elrGE,col = "blue",cex = 0.2)
fitOLS <- lm(elrGE ~ elrSP500)
summary(fitOLS)
par(mfrow = c(2,2)) ; plot(fitOLS)



