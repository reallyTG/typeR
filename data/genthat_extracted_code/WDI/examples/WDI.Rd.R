library(WDI)


### Name: WDI
### Title: WDI: World Development Indicators (World Bank)
### Aliases: WDI

### ** Examples

WDI(country="all", indicator=c("AG.AGR.TRAC.NO","TM.TAX.TCOM.BC.ZS"),
    start=1990, end=2000)
WDI(country=c("US","BR"), indicator="NY.GNS.ICTR.GN.ZS", start=1999, end=2000,
    extra=TRUE, cache=NULL)



