library(regsem)


### Name: xmed
### Title: Function to performed exploratory mediation with continuous and
###   categorical variables
### Aliases: xmed

### ** Examples

## Not run: 
##D # example
##D library(ISLR)
##D College1 = College[which(College$Private=="Yes"),]
##D Data = data.frame(scale(College1[c("Grad.Rate","Accept","Outstate","Room.Board","Books","Expend")]))
##D Data$Grad.Rate <- ifelse(Data$Grad.Rate > 0,1,0)
##D Data$Grad.Rate <- as.factor(Data$Grad.Rate)
##D #lavaan model with all mediators
##D model1 <-
##D  ' # direct effect (c_prime)
##D Grad.Rate ~ c_prime*Accept
##D # mediators
##D Outstate ~ a1*Accept
##D Room.Board ~ a2*Accept
##D Books ~ a3*Accept
##D Expend ~ a6*Accept
##D Grad.Rate ~ b1*Outstate + b2*Room.Board + b3*Books + b6*Expend
##D # indirect effects (a*b)
##D a1b1 := a1*b1
##D a2b2 := a2*b2
##D a3b3 := a3*b3
##D a6b6 := a6*b6
##D # total effect (c)
##D c := c_prime + (a1*b1) + (a2*b2) + (a3*b3) + (a6*b6)
##D '
##D #p-value approach using delta method standard errors
##D fit.delta = sem(model1,data=Data,fixed.x=TRUE,ordered="Grad.Rate")
##D summary(fit.delta)
##D 
##D #xmed()
##D 
##D iv <- "Accept"
##D dv <- "Grad.Rate"
##D mediators <- c("Outstate","Room.Board","Books","Expend")
##D 
##D out <- xmed(Data,iv,mediators,dv)
##D out
## End(Not run)



