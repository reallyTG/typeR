library(BradleyTerry2)


### Name: springall
### Title: Springall (1973) Data on Subjective Evaluation of Flavour
###   Strength
### Aliases: springall
### Keywords: datasets

### ** Examples


##
## Fit the same response-surface model as in section 7 of 
## Springall (1973).
##
## Differences from Springall's fit are minor, arising from the 
## different treatment of ties.
##
## Springall's model in the paper does not include the random effect.  
## In this instance, however, that makes no difference: the random-effect 
## variance is estimated as zero.
##
summary(springall.model <- BTm(cbind(win.adj, loss.adj), col, row, 
                               ~ flav[..] + gel[..] + 
                                 flav.2[..] + gel.2[..] + flav.gel[..] +
                                 (1 | ..),
                               data = springall))




