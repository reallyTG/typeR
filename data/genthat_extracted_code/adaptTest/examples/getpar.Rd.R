library(adaptTest)


### Name: getpar
### Title: Function to calculate the parameter that specifies the
###   conditional error function running through a given point
### Aliases: getpar

### ** Examples

## Plot the conditional error function of the Lehmacher-Wassmer (1999) type that runs through (p1,p2)=(0.3,0.7)
alpha2 <- getpar(typ="l", p1=0.3, p2=0.7)
plotCEF(typ="l", a2=alpha2, add=FALSE)

## Other ways of doing the same as above
plotCEF(typ="l", p1=0.3, p2=0.7, add=FALSE) 
plot(CEF(typ="l", p1=0.3, p2=0.7), xlim=0:1)



