library(adaptTest)


### Name: CEF
### Title: Function to specify a conditional error function
### Aliases: CEF

### ** Examples

## Plot two conditional error functions of the Lehmacher-Wassmer (1999) type:
## one to the local level alpha2=0.1, and one that runs through (p1,p2)=(0.3,0.7)
foo1 <- CEF(typ="l", a2=0.1)
foo2 <- CEF(typ="l", p1=0.3, p2=0.7)
plot(foo1, xlim=0:1)
plot(foo2, add=TRUE)

## A different way of doing the same
plotCEF(typ="l", a2=0.1, add=FALSE)
plotCEF(typ="l", p1=0.3, p2=0.7, plt.pt=FALSE)



