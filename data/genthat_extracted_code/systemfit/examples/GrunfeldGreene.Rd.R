library(systemfit)


### Name: GrunfeldGreene
### Title: Grunfeld Data as published by Greene (2003)
### Aliases: GrunfeldGreene
### Keywords: datasets

### ** Examples

## Repeating the OLS and SUR estimations in Greene (2003, pp. 351)
data( "GrunfeldGreene" )
library( "plm" )
GGPanel <- pdata.frame( GrunfeldGreene, c( "firm", "year" ) )
formulaGrunfeld <- invest ~ value + capital
# OLS
greeneOls <- systemfit( formulaGrunfeld, "OLS",
   data = GGPanel )
summary( greeneOls )
sapply( greeneOls$eq, function(x){return(summary(x)$ssr/20)} ) # sigma^2
# OLS Pooled
greeneOlsPooled <- systemfit( formulaGrunfeld, "OLS",
   data = GGPanel, pooled = TRUE )
summary( greeneOlsPooled )
sum( sapply( greeneOlsPooled$eq, function(x){return(summary(x)$ssr)}) )/97 # sigma^2
# SUR
greeneSur <- systemfit( formulaGrunfeld, "SUR",
   data = GGPanel, methodResidCov = "noDfCor" )
summary( greeneSur )
# SUR Pooled
greeneSurPooled <- systemfit( formulaGrunfeld, "SUR",
   data = GGPanel, pooled = TRUE, methodResidCov = "noDfCor",
   residCovWeighted = TRUE )
summary( greeneSurPooled )

## Repeating the OLS and SUR estimations in Theil (1971, pp. 295, 300)
GrunfeldTheil <- subset( GrunfeldGreene,
   firm %in% c( "General Electric", "Westinghouse" ) )
GTPanel <- pdata.frame( GrunfeldTheil, c( "firm", "year" ) )
formulaGrunfeld <- invest ~ value + capital
# OLS
theilOls <- systemfit( formulaGrunfeld, "OLS",
   data = GTPanel )
summary( theilOls )
# SUR
theilSur <- systemfit( formulaGrunfeld, "SUR",
   data = GTPanel, methodResidCov = "noDfCor" )
summary( theilSur )



