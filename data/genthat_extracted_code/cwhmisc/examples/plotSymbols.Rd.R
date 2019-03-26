library(cwhmisc)


### Name: plotSymbols
### Title: Plot symbols, colours, and allow to choose
### Aliases: plotSymbols plotSymbolsFonts availColors
### Keywords: color hplot iplot

### ** Examples

  # A first impression:
    opar <- par(mfrow=c(1,2))
  n<-1:34; plot(n,pch=n) # There is a gap between 25 and 34
  plotSymbols(TRUE)
  par(opar)



