library(gMCP)


### Name: exampleGraphs
### Title: Functions that create different example graphs
### Aliases: BauerEtAl2001 BonferroniHolm BretzEtAl2009a BretzEtAl2009b
###   BretzEtAl2009c BretzEtAl2011 Entangled1Maurer2012
###   Entangled2Maurer2012 Ferber2011 FerberTimeDose2011 HommelEtAl2007
###   HommelEtAl2007Simple HungEtWang2010 HuqueAloshEtBhore2011
###   MaurerEtAl1995 WangTing2014 cycleGraph exampleGraphs fallback
###   fixedSequence generalSuccessive improvedFallbackI improvedFallbackII
###   improvedParallelGatekeeping parallelGatekeeping simpleSuccessiveI
###   simpleSuccessiveII truncatedHolm
### Keywords: graphs misc

### ** Examples


g <- BonferroniHolm(5)

gMCP(g, pvalues=c(0.1, 0.2, 0.4, 0.4, 0.7))

HungEtWang2010()
HungEtWang2010(nu=1)




