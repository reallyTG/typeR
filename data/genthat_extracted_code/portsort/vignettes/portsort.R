## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----pressure, echo=FALSE, fig.cap="Portfolio composition matrix",fig.align='center', out.width = '50%'----
knitr::include_graphics("grid.jpg")

## ---- echo=TRUE, message=FALSE, warning = FALSE--------------------------
# Load the portsort package and the pre-loaded data
library(portsort)
library(PerformanceAnalytics)
library(xts)
data(Factors)
# Lagged returns, lagged volumes are stored in the Factors list
R.Forward = Factors[[1]]; R.Lag = Factors[[2]]; V.Lag = Factors[[3]]
Fa = R.Lag; Fb = V.Lag
#Specify the dimension of the sort - let's use terciles
dimA = 0:3/3;dimB = 0:3/3;dimC = c(0,1)
# Run the conditional sort with quantiles computed using method 7 from the quantile function (stats package)
sort.output.con = conditional.sort(Fa,Fb,Fc=NULL,R.Forward,dimA,dimB,dimC,type = 7)
# Run the unconditional sort with quantiles computed using method 7 from the quantile function (stats package)
sort.output.uncon = unconditional.sort(Fa,Fb,Fc=NULL,R.Forward,dimA,dimB,dimC, type = 7)

# Compare the risk and return of each sub-portfolio using PerformanceAnalytics
# Set the scale to 365 (Cryptocurreny markets have no close) and geometric to FALSE (we are using log returns)
table.AnnualizedReturns(sort.output.con$returns, scale = 365, geometric = FALSE, digits = 3)
table.AnnualizedReturns(sort.output.uncon$returns, scale = 365, geometric = FALSE, digits = 3)

## ---- echo=TRUE, message=FALSE, warning = FALSE--------------------------
# Load the portsort package and the pre-loaded data
library(portsort)
library(PerformanceAnalytics)
library(xts)
data(Factors)
# Lagged returns, lagged volumes are stored in the Factors list
R.Forward = Factors[[1]]; R.Lag = Factors[[2]]; V.Lag = Factors[[3]]
Fa = R.Lag; Fb = V.Lag
#Specify the dimension of the sort - let's use terciles
dimA = 0:3/3;dimB = 0:3/3;dimC = c(0,1)
# Run either the conditional or unconditional sort function 
sort.output = conditional.sort(Fa,Fb,Fc=NULL,R.Forward,dimA,dimB,dimC)
# Run the turnover function
turnover.output = portfolio.turnover(sort.output)
turnover.output$`Mean Turnover`

## ---- echo=TRUE, message=FALSE, warning = FALSE--------------------------
# Load the portsort package and the pre-loaded data
library(portsort)
library(PerformanceAnalytics)
library(xts)
data(Factors)
# Lagged returns, lagged volumes are stored in the Factors list
R.Forward = Factors[[1]]; R.Lag = Factors[[2]]; V.Lag = Factors[[3]]
Fa = R.Lag; Fb = V.Lag
#Specify the dimension of the sort - let's use terciles
dimA = 0:3/3;dimB = 0:3/3;dimC = c(0,1)
# Run either the conditional or unconditional sort function 
sort.output = conditional.sort(Fa,Fb,Fc=NULL,R.Forward,dimA,dimB,dimC)
# Run the portfolio.frequency function with rank = 1
# to see which cryptocurrency appeared the most in each sub-portfolio
portfolio.frequency(sort.output, rank = 1)
# To see which crypto pair appeared the second most, set rank = 2 
portfolio.frequency(sort.output, rank = 2)

## ---- echo=TRUE, message=FALSE, warning = FALSE--------------------------
# Load the portsort package and the pre-loaded data
library(portsort)
library(PerformanceAnalytics)
library(xts)
data(Factors)
# Lagged returns, lagged volumes are stored in the Factors list
R.Forward = Factors[[1]]; R.Lag = Factors[[2]]; V.Lag = Factors[[3]]
Fa = R.Lag; Fb = V.Lag
#Specify the dimension of the sort - let's use terciles
dimA = 0:3/3;dimB = 0:3/3;dimC = c(0,1)
# Run the conditional sort function 
sort.output.con = conditional.sort(Fa,Fb,Fc=NULL,R.Forward,dimA,dimB,dimC)
# Run the unconditional sort function 
sort.output.uncon = unconditional.sort(Fa,Fb,Fc=NULL,R.Forward,dimA,dimB,dimC)

# Investigate mean portfolio size - conditional sort
portfolio.mean.size(sort.output = sort.output.con)

# Investigate mean portfolio size - unconditional sort
portfolio.mean.size(sort.output = sort.output.uncon)

## ---- echo=TRUE, message=FALSE, warning = FALSE, fig.align='center'------
# Load the portsort package and the pre-loaded data
library(portsort)
library(PerformanceAnalytics)
library(xts)
data(Factors)

# Compute momentum for the 26 cryptocurrency pairs - this will become Factor A (Fa)
# The look-back-period
s = 21
# The skip-period to account for short-term reversals
k = 1
# Define an empty xts to store the momentum calculations
# Lagged returns, lagged volumes are stored in the Factors list
R.Forward = Factors[[1]]; R.Lag = Factors[[2]]; V.Lag = Factors[[3]]
XSMOM = R.Lag
XSMOM[1:nrow(XSMOM),1:ncol(XSMOM)] <- NA
# Compute Momentum
for (i in 1:ncol(R.Lag)){
    
    for (t in (s + 1):nrow(R.Lag)){
        XSMOM[t,i] =  sum(R.Lag[(t-s):(t-1-k),i])
        
    }
  }

# Remove the formation period (s) by using na.omit
XSMOM = na.omit(XSMOM)
# Re-subset R.Forward
R.Forward = R.Forward[(s + 1):nrow(R.Forward), ]

# Specify the factors we need - specify Fb and Fc as NULL
Fa = XSMOM; Fb = NULL; Fc = NULL

#Specify the dimension of the sort - let's use quintiles
dimA = 0:5/5
# Run either the conditional or unconditional sort function (for univariate sorts there is no difference)
XSMOM.output = conditional.sort(Fa=Fa,R.Forward=R.Forward,dimA=dimA)

# Let's now investigate the risk and return profiles of the sub-portfolios
table.AnnualizedReturns(XSMOM.output$returns,scale = 365, geometric = FALSE)
# Investigate the mean sub-portfolio turnover over the sample period
portfolio.turnover(XSMOM.output)$`Mean Turnover`
# Lets see which crypto occurred the most in each sub-portfolio
portfolio.frequency(XSMOM.output, rank = 1)
# Evaluate the mean sub-portfolio size
portfolio.mean.size(XSMOM.output)

# Following the methodology of Jegadeesh and Titman, 1993, we will now form a long-short, zero-cost portfolio which initiates a long position in the high momentum sub-portfolio (portfolio 5) and a short position in the low momentum sub-portfolio (portfolio 1)

LS.Portfolio = XSMOM.output$returns[,5] + (-1*XSMOM.output$returns[,1])
# Investigate risk and return
table.AnnualizedReturns(LS.Portfolio,scale = 365, geometric = FALSE)
# We can now plot the back-tested results
chart.CumReturns(LS.Portfolio, geometric = FALSE, main = "XSMOM Long-Short Portfolio")

## ---- echo=TRUE, message=FALSE, warning = FALSE, fig.align='center'------
# Load the portsort package and the pre-loaded data
library(portsort)
library(PerformanceAnalytics)
library(xts)
data(Factors)

# Specify the factors we need - lagged returns and lagged volume denominated in BTC
# Lagged returns, lagged volumes are stored in the Factors list
R.Forward = Factors[[1]]; R.Lag = Factors[[2]]; V.Lag = Factors[[3]]
Fa = R.Lag; Fb = V.Lag

#Specify the dimension of the sort - let's try a 3x3 sort (3 breakpoints for each factor)
dimA = 0:3/3
dimB = 0:3/3
# Run both the conditional and unconditional sort
sort.con = conditional.sort(Fa=Fa,Fb=Fb,R.Forward = R.Forward,dimA=dimA,dimB=dimB)
sort.uncon = unconditional.sort(Fa=Fa,Fb=Fb,R.Forward = R.Forward,dimA=dimA,dimB=dimB)

# Let's now investigate the risk and return profiles of the sub-portfolios
table.AnnualizedReturns(sort.con$returns,scale = 365, geometric = FALSE)
table.AnnualizedReturns(sort.uncon$returns,scale = 365, geometric = FALSE)

# Investigate the mean sub-portfolio turnover over the sample period
portfolio.turnover(sort.con)$`Mean Turnover`
portfolio.turnover(sort.uncon)$`Mean Turnover`
# Lets see which crypto occurred the most in each sub-portfolio
portfolio.frequency(sort.con, rank = 1)
portfolio.frequency(sort.uncon, rank = 1)
# Evaluate the mean sub-portfolio size
portfolio.mean.size(sort.con)
portfolio.mean.size(sort.uncon)

# Following the methodology of Gargano et al. 2017 and Bianchi and Dickerson (2018), we will now form a long-short, zero-cost portfolio which initiates a long position in the low prior return/low volume sub-portfolio (sub-portfolio 1) and a short position in the low return/high volume sub-portfolio (sub-portfolio 7).

Conditonal.LS.Portfolio = sort.con$returns[,1] + (-1*sort.con$returns[,9])
Unconditonal.LS.Portfolio = sort.uncon$returns[,1] + (-1*sort.uncon$returns[,9])

Portfolios = cbind(Conditonal.LS.Portfolio,Unconditonal.LS.Portfolio)
colnames(Portfolios) = c("Conditional","Unconditional")
# Chart the logarithmic cumulative returns
chart.CumReturns(Portfolios, geometric = FALSE, legend.loc = "topleft",
                  main = "Sorting Comparison")
# Investigate risk and return
table.AnnualizedReturns(Portfolios,scale = 365, geometric = FALSE)

