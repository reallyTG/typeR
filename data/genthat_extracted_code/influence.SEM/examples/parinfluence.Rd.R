library(influence.SEM)


### Name: parinfluence
### Title: Case influence on model parameters.
### Aliases: parinfluence
### Keywords: multivariate

### ** Examples

## not run: this example take several minutes
data("PDII")
model <- "
  F1 =~ y1+y2+y3+y4
"
# fit0 <- sem(model, data=PDII)
# PAR <- c("F1=~y2","F1=~y3","F1=~y4")
# LY <- parinfluence(PAR,model,PDII)
# str(LY)
# explore.influence(LY$Dparm[,1])

## not run: this example take several minutes
## an example in which the deletion of a case yelds a solution 
## with negative estimated variances
model <- "
  F1 =~ x1+x2+x3
  F2 =~ y1+y2+y3+y4
  F3 =~ y5+y6+y7+y8
"

# fit0 <- sem(model, data=PDII)
# PAR <- c("F2=~y2","F2=~y3","F2=~y4")
# LY <- parinfluence(PAR,model,PDII)

## not run: this example take several minutes
## dealing with ordinal data
data(Q)
model <- "
 F1 =~ it1+it2+it3+it4+it5+it6+it7+it8+it9+it10
"

# fit0 <- sem(model, data=Q, ordered=colnames(Q))
# LY <- parinfluence("F1=~it4",model,Q,ordered=colnames(Q))
# explore.influence(LY$Dparm[,1])



