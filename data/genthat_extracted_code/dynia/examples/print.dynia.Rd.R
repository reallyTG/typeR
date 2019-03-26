library(dynia)


### Name: print.dynia
### Title: Print the class of dynia
### Aliases: print.dynia
### Keywords: ts

### ** Examples

data(casualties)
fitdi(z=casualties[,1],T=70,xint=casualties[,2],itype="s",delta0=1,
 order=c(1,0,0),seasonal=list(order=c(0,0,1),period=12))



