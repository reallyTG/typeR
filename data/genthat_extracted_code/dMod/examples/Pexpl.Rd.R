library(dMod)


### Name: Pexpl
### Title: Parameter transformation
### Aliases: Pexpl

### ** Examples


logtrafo <- c(k1 = "exp(logk1)", k2 = "exp(logk2)", 
              A = "exp(logA)", B = "exp(logB)")
p_log <- P(logtrafo)

pars <- c(logk1 = 1, logk2 = -1, logA = 0, logB = 0)
out <- p_log(pars)
getDerivs(out)



