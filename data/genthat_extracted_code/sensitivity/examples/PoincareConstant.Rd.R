library(sensitivity)


### Name: PoincareConstant
### Title: Poincare constants for Derivative-based Global Sensitivity
###   Measures (DGSM)
### Aliases: PoincareConstant

### ** Examples


# Exponential law (log-concave)
PoincareConstant(dfct=dexp,qfct=qexp,pfct=NULL,rate=1,logconcave=TRUE) # log-concave assumption
PoincareConstant(dfct=dexp,qfct=NULL,pfct=pexp,rate=1,optimize.interval=c(0, 15)) 
          # logistic transport approach

# Weibull law (log-concave)
PoincareConstant(dfct=dweibull,qfct=NULL,pfct=pweibull,optimize.interval=c(0, 15),shape=1,scale=1) 
          # logistic transport approach

## No test: 
# Triangular law (log-concave)
library(triangle)
PoincareConstant(dfct=dtriangle, qfct=qtriangle, pfct=NULL, a=-1, b=1, c=0, logconcave=TRUE) 
          # log-concave assumption
PoincareConstant(dfct=dtriangle, qfct=NULL, pfct=ptriangle, a=-1, b=1, c=0, 
  transport="double_exp", optimize.interval=c(-1,1)) # Double-exponential transport approach
PoincareConstant(dfct=dtriangle, qfct=NULL, pfct=ptriangle, a=-1, b=1, c=0, 
  optimize.interval=c(-1,1)) # Logistic transport calculation

# Normal N(0,1) law truncated on [-1.87,+infty]
PoincareConstant(dfct=dnorm, qfct=qnorm, pfct=pnorm, mean=0, sd=1, logconcave=TRUE, 
  transport="double_exp", truncated=TRUE, min=-1.87, max=999) # log-concave assumption
PoincareConstant(dfct=dnorm.trunc, qfct=qnorm.trunc, pfct=pnorm.trunc, mean=0, sd=1, 
# Double-exponential transport approach
  truncated=TRUE, min=-1.87, max=999,   transport="double_exp", optimize.interval=c(-1.87,20)) 
# Logistic transport approach
PoincareConstant(dfct=dnorm.trunc, qfct=qnorm.trunc, pfct=pnorm.trunc, mean=0, sd=1, 
  truncated=TRUE, min=-1.87, max=999, optimize.interval=c(-1.87,20)) 


# Gumbel law (log-concave)
library(evd)
PoincareConstant(dfct=dgumbel, qfct=qgumbel, pfct=NULL, loc=0, scale=1, logconcave=TRUE,
  transport="double_exp") # log-concave assumption
PoincareConstant(dfct=dgumbel, qfct=NULL, pfct=pgumbel, loc=0, scale=1, 
  transport="double_exp", optimize.interval=c(-3,20)) # Double-exponential transport approach
PoincareConstant(dfct=dgumbel, qfct=qgumbel, pfct=pgumbel, loc=0, scale=1, 
  optimize.interval=c(-3,20)) # Logistic transport approach

# Truncated Gumbel law (log-concave)
# Double-exponential transport approach
PoincareConstant(dfct=dgumbel, qfct=qgumbel, pfct=pgumbel, loc=0, scale=1, logconcave=TRUE, 
  transport="double_exp", truncated=TRUE, min=-0.92, max=3.56) # log-concave assumption
PoincareConstant(dfct=dgumbel.trunc, qfct=NULL, pfct=pgumbel.trunc, loc=0, scale=1, 
  truncated=TRUE, min=-0.92, max=3.56, transport="double_exp", optimize.interval=c(-0.92,3.56))
# Logistic transport approach
PoincareConstant(dfct=dgumbel.trunc, qfct=qgumbel.trunc, pfct=pgumbel.trunc, loc=0, scale=1, 
  truncated=TRUE, min=-0.92, max=3.56, optimize.interval=c(-0.92,3.56)) 
  
## End(No test)




