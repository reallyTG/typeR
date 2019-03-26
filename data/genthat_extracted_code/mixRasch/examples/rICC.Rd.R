library(mixRasch)


### Name: rICC
### Title: Function for producing theoretical and empirical item
###   characteristic curves.
### Aliases: rICC
### Keywords: misc

### ** Examples


library(mixRasch)
# Example data included with mixRasch
data(exRasch)

rasch1 <- mixRasch(exRasch,1,50, conv.crit=.0001, n.c=1)

# ICC for item 1
rICC(rasch1$item.par$delta[,1], rasch1$person.par$theta, 
     exRasch[,1], empICC=TRUE, colTheme="cavaliers")



