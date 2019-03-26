library(tdROC)


### Name: calc.AUC
### Title: Calculate the area under a ROC curve (AUC)
### Aliases: calc.AUC

### ** Examples

sens <- c(0.99, 0.97, 0.83, 0.60, 0.40, 0.20) ;
spec <- c(0.50, 0.61, 0.80, 0.90, 0.95, 0.98) ;
plot( 1-spec, sens, type = "l" ) ;
points(1-spec, sens) ;
calc.AUC( sens, spec ) ;




