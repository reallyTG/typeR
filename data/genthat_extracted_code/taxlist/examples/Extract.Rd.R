library(taxlist)


### Name: Extract
### Title: Extract or Replace Parts of taxlist Objects
### Aliases: Extract [ [,taxlist-method [<- [<-,taxlist-method
###   $,taxlist-method $<- $<-,taxlist-method
### Keywords: methods

### ** Examples

library(taxlist)
data(Easplist)

## Statistics on life forms
summary(as.factor(Easplist$lf_behn_2018))

## First ten concepts in this list
summary(Easplist[1:10,], "all")



