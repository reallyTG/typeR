### R code from vignette source 'micEconAids_vignette.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: micEconAids_vignette.Rnw:366-367 (eval = FALSE)
###################################################
## aidsEst( priceNames, shareNames, totExpName, data )


###################################################
### code chunk number 2: micEconAids_vignette.Rnw:394-396
###################################################
library(micEconAids)
data( "Blanciforti86" )


###################################################
### code chunk number 3: micEconAids_vignette.Rnw:415-416
###################################################
Blanciforti86 <- Blanciforti86[ 1:32, ]


###################################################
### code chunk number 4: micEconAids_vignette.Rnw:421-423
###################################################
priceNames <- c( "pFood1", "pFood2", "pFood3", "pFood4" )
shareNames <- c( "wFood1", "wFood2", "wFood3", "wFood4" )


###################################################
### code chunk number 5: micEconAids_vignette.Rnw:430-433
###################################################
laaidsResult <- aidsEst( priceNames, shareNames, "xFood", data = Blanciforti86,
   priceIndex = "S"  )
print( laaidsResult )


###################################################
### code chunk number 6: micEconAids_vignette.Rnw:441-442
###################################################
summary( laaidsResult )


###################################################
### code chunk number 7: micEconAids_vignette.Rnw:464-465
###################################################
options( digits = 3)


###################################################
### code chunk number 8: micEconAids_vignette.Rnw:486-488
###################################################
laaidsResultSL <- aidsEst( priceNames, shareNames, "xFood", data = Blanciforti86,
   priceIndex = "SL" )


###################################################
### code chunk number 9: micEconAids_vignette.Rnw:505-514
###################################################
instNames <- c( paste( "l", priceNames, sep = "" ), "lxFood" )
for( i in 1:4 ){
   Blanciforti86[[ instNames[ i ] ]] <-
      log( Blanciforti86[[ priceNames[ i ] ]] )
}
Blanciforti86[[ "lxFood" ]] <- log( Blanciforti86[[ "xFood" ]] )

laaidsResultIV <- aidsEst( priceNames, shareNames, "xFood",
   data = Blanciforti86, priceIndex = "S", instNames = instNames )


###################################################
### code chunk number 10: micEconAids_vignette.Rnw:547-555
###################################################
laaidsResultP <- aidsEst( priceNames, shareNames, "xFood",
   data = Blanciforti86, priceIndex = "P" )

laaidsResultL <- aidsEst( priceNames, shareNames, "xFood",
   data = Blanciforti86, priceIndex = "L" )

laaidsResultT <- aidsEst( priceNames, shareNames, "xFood",
   data = Blanciforti86, priceIndex = "T" )


###################################################
### code chunk number 11: micEconAids_vignette.Rnw:572-574
###################################################
laaidsResultLs <- aidsEst( priceNames, shareNames, "xFood",
   data = Blanciforti86 )


###################################################
### code chunk number 12: micEconAids_vignette.Rnw:582-586
###################################################
all.equal( coef( laaidsResultL )$alpha, coef( laaidsResultLs )$alpha )
all.equal( coef( laaidsResultL )$beta, coef( laaidsResultLs )$beta )
all.equal( coef( laaidsResultL )$gamma, coef( laaidsResultLs )$gamma )
all.equal( laaidsResultL$r2, laaidsResultLs$r2 )


###################################################
### code chunk number 13: micEconAids_vignette.Rnw:698-700
###################################################
aidsResult <- aidsEst( priceNames, shareNames, "xFood",
   data = Blanciforti86, method = "IL" )


###################################################
### code chunk number 14: micEconAids_vignette.Rnw:710-711
###################################################
options( digits = 7 )


###################################################
### code chunk number 15: micEconAids_vignette.Rnw:736-740
###################################################
all.equal( sum( coef( aidsResult )$alpha ), 1 )
all.equal( sum( coef( aidsResult )$beta ), 0 )
all.equal( colSums( coef( aidsResult )$gamma ), rep( 0, 4 ),
   check.attributes = FALSE )


###################################################
### code chunk number 16: micEconAids_vignette.Rnw:748-751
###################################################
all.equal( rowSums( coef( aidsResult )$gamma ), rep( 0, 4 ),
   check.attributes = FALSE )
isSymmetric( coef( aidsResult )$gamma, tol = 1e-10, check.attributes = FALSE )


###################################################
### code chunk number 17: micEconAids_vignette.Rnw:764-767
###################################################
aidsResultHom <- aidsEst( priceNames, shareNames, "xFood", data = Blanciforti86,
   method = "IL", sym = FALSE )
isSymmetric( coef( aidsResultHom )$gamma, tol = 1e-10, check.attributes = FALSE )


###################################################
### code chunk number 18: micEconAids_vignette.Rnw:775-776
###################################################
lrtest( aidsResult, aidsResultHom )


###################################################
### code chunk number 19: micEconAids_vignette.Rnw:783-787
###################################################
aidsResultUnr <- aidsEst( priceNames, shareNames, "xFood", data = Blanciforti86,
   method = "IL", hom = FALSE, sym = FALSE )
all.equal( rowSums( coef( aidsResultUnr )$gamma ), rep( 0, 4 ),
   check.attributes = FALSE )


###################################################
### code chunk number 20: micEconAids_vignette.Rnw:793-794
###################################################
lrtest( aidsResultHom, aidsResultUnr )


###################################################
### code chunk number 21: micEconAids_vignette.Rnw:802-803
###################################################
lrtest( aidsResult, aidsResultUnr )


###################################################
### code chunk number 22: micEconAids_vignette.Rnw:823-824 (eval = FALSE)
###################################################
## aidsMono( priceNames, totExpName, coef, data )


###################################################
### code chunk number 23: micEconAids_vignette.Rnw:841-843
###################################################
aidsMono( priceNames, "xFood", coef = coef( aidsResult ),
   data = Blanciforti86 )


###################################################
### code chunk number 24: micEconAids_vignette.Rnw:859-865
###################################################
aidsMono( priceNames, "xFood", coef = coef( laaidsResult ),
   data = Blanciforti86, priceIndex = "S" )
aidsMono( priceNames, "xFood", coef = coef( laaidsResultT ),
   data = Blanciforti86, priceIndex = "T",
   basePrices = laaidsResultT$basePrices,
   baseShares = laaidsResultT$baseShares )


###################################################
### code chunk number 25: micEconAids_vignette.Rnw:876-880
###################################################
aidsMono( priceNames, "xFood", coef = coef( laaidsResult ),
   data = Blanciforti86, priceIndex = laaidsResult$lnp )
aidsMono( priceNames, "xFood", coef = coef( laaidsResultT ),
   data = Blanciforti86, priceIndex = laaidsResultT$lnp )


###################################################
### code chunk number 26: micEconAids_vignette.Rnw:917-918 (eval = FALSE)
###################################################
## aidsConcav( priceNames, totExpName, coef, data )


###################################################
### code chunk number 27: micEconAids_vignette.Rnw:926-928
###################################################
aidsConcav( priceNames, "xFood", coef = coef( aidsResult ),
   data = Blanciforti86 )


###################################################
### code chunk number 28: micEconAids_vignette.Rnw:937-939
###################################################
aidsConcav( priceNames, "xFood", coef = coef( aidsResult ),
   data = Blanciforti86, shareNames = shareNames )


###################################################
### code chunk number 29: micEconAids_vignette.Rnw:955-959
###################################################
laaidsCoef <- coef( laaidsResult )
laaidsCoef$alpha0 <- 1
aidsConcav( priceNames, "xFood", coef = laaidsCoef,
   data = Blanciforti86 )


###################################################
### code chunk number 30: micEconAids_vignette.Rnw:971-972 (eval = FALSE)
###################################################
## aidsConsist( priceNames, totExpName, coef, data )


###################################################
### code chunk number 31: micEconAids_vignette.Rnw:983-985
###################################################
aidsConsist( priceNames, "xFood", coef = coef( aidsResult ),
   data = Blanciforti86 )


###################################################
### code chunk number 32: micEconAids_vignette.Rnw:1006-1007
###################################################
aidsResultConsist <- checkConsist( aidsResult )


###################################################
### code chunk number 33: micEconAids_vignette.Rnw:1019-1020
###################################################
aidsResultConsistObs <- checkConsist( aidsResult, observedShares = TRUE )


###################################################
### code chunk number 34: micEconAids_vignette.Rnw:1064-1065
###################################################
options( digits = 3)


###################################################
### code chunk number 35: micEconAids_vignette.Rnw:1074-1075 (eval = FALSE)
###################################################
## aidsElas( coef, prices = NULL, shares = NULL, totExp = NULL )


###################################################
### code chunk number 36: micEconAids_vignette.Rnw:1094-1099
###################################################
pMeans <- colMeans( Blanciforti86[ , priceNames ] )
wMeans <- colMeans( Blanciforti86[ , shareNames ] )
aidsResultElas <- aidsElas( coef( aidsResult ), prices = pMeans,
   shares = wMeans )
print( aidsResultElas )


###################################################
### code chunk number 37: micEconAids_vignette.Rnw:1109-1113
###################################################
xtMean <- mean( Blanciforti86[ , "xFood" ] )
aidsResultElas2 <- aidsElas( coef( aidsResult ), prices = pMeans,
   totExp = xtMean )
all.equal( aidsResultElas, aidsResultElas2 )


###################################################
### code chunk number 38: micEconAids_vignette.Rnw:1144-1148
###################################################
aidsResultElasCov <- aidsElas( coef( aidsResult ), prices = pMeans,
   totExp = xtMean, coefCov = vcov( aidsResult ),
   df = df.residual( aidsResult ) )
summary( aidsResultElasCov )


###################################################
### code chunk number 39: micEconAids_vignette.Rnw:1161-1163
###################################################
aidsResultElasCov2 <- elas( aidsResult )
all.equal( aidsResultElasCov, aidsResultElasCov2 )


###################################################
### code chunk number 40: micEconAids_vignette.Rnw:1174-1175
###################################################
aidsResultElasCovObs <- elas( aidsResult, observedShares = TRUE )


###################################################
### code chunk number 41: micEconAids_vignette.Rnw:1267-1270
###################################################
laaidsResultElasB1 <- aidsElas( coef( laaidsResult ),
   prices = pMeans, totExp = xtMean, method = "B1",
   priceIndex = "S" )


###################################################
### code chunk number 42: micEconAids_vignette.Rnw:1274-1276
###################################################
laaidsResultElasB1a <- elas( laaidsResult, method = "B1" )
all.equal( laaidsResultElasB1, laaidsResultElasB1a )


###################################################
### code chunk number 43: micEconAids_vignette.Rnw:1301-1302
###################################################
laaidsResultElasB2 <- elas( laaidsResult, method = "B2" )


###################################################
### code chunk number 44: micEconAids_vignette.Rnw:1329-1330
###################################################
laaidsResultElasGo <- elas( laaidsResult, method = "Go" )


###################################################
### code chunk number 45: micEconAids_vignette.Rnw:1348-1349
###################################################
laaidsResultElasEU <- elas( laaidsResult, method = "EU" )


###################################################
### code chunk number 46: micEconAids_vignette.Rnw:1558-1559 (eval = FALSE)
###################################################
## aidsCalc( priceNames, totExpName, coef, data )


###################################################
### code chunk number 47: micEconAids_vignette.Rnw:1577-1579
###################################################
B86new <- Blanciforti86
B86new$pFood1 <- B86new$pFood1 * 1.10


###################################################
### code chunk number 48: micEconAids_vignette.Rnw:1586-1588
###################################################
aidsMeat10 <- aidsCalc( priceNames, "xFood",
   coef( aidsResult ), data = B86new )


###################################################
### code chunk number 49: micEconAids_vignette.Rnw:1596-1597
###################################################
aidsMeat10$quant[ 32, ] / fitted( aidsResult )$quant[ 32, ]


###################################################
### code chunk number 50: micEconAids_vignette.Rnw:1599-1600
###################################################
quantRatio <- aidsMeat10$quant[ 32, ] / fitted( aidsResult )$quant[ 32, ]


###################################################
### code chunk number 51: micEconAids_vignette.Rnw:1636-1638
###################################################
laaidsMeat10 <- aidsCalc( priceNames, "xFood",
   coef( laaidsResult ), data = B86new, priceIndex = "S" )


###################################################
### code chunk number 52: micEconAids_vignette.Rnw:1655-1657
###################################################
laaidsSLMeat10 <- aidsCalc( priceNames, "xFood",
   coef( laaidsResultSL ), data = B86new, priceIndex = "SL" )


###################################################
### code chunk number 53: micEconAids_vignette.Rnw:1675-1685
###################################################
laaidsLMeat10 <- aidsCalc( priceNames, "xFood",
   coef( laaidsResultL ), data = B86new, priceIndex = "L",
   basePrices = laaidsResultL$basePrices,
   baseShares = laaidsResultL$baseShares )

laaidsLsMeat10 <- aidsCalc( priceNames, "xFood",
   coef( laaidsResultLs ), data = B86new, priceIndex = "Ls",
   baseShares = laaidsResultLs$baseShares )

all.equal( laaidsLMeat10$quant, laaidsLsMeat10$quant, check.attributes = FALSE )


###################################################
### code chunk number 54: micEconAids_vignette.Rnw:1711-1719
###################################################
laaidsPMeat10 <- aidsCalc( priceNames, "xFood",
   coef( laaidsResultP ), data = B86new, priceIndex = "P",
   basePrices = laaidsResultP$basePrices )

laaidsTMeat10 <- aidsCalc( priceNames, "xFood",
   coef( laaidsResultT ), data = B86new, priceIndex = "T",
   basePrices = laaidsResultT$basePrices,
   baseShares = laaidsResultT$baseShares )


###################################################
### code chunk number 55: micEconAids_vignette.Rnw:1729-1730 (eval = FALSE)
###################################################
## predict( object, newdata = NULL, observedShares = FALSE )


###################################################
### code chunk number 56: micEconAids_vignette.Rnw:1750-1755
###################################################
aidsMeat10a <- predict( aidsResult, newdata = B86new )
all.equal( aidsMeat10, aidsMeat10a )

laaidsMeat10a <- predict( laaidsResult, newdata = B86new )
all.equal( laaidsMeat10, laaidsMeat10a )


###################################################
### code chunk number 57: micEconAids_vignette.Rnw:1797-1805
###################################################
priceNamesScaled <- paste( priceNames, "Scaled", sep = "" )
for( i in 1:4 ){
   Blanciforti86[[ priceNamesScaled[ i ] ]] <-
      Blanciforti86[[ priceNames[i] ]] /
      Blanciforti86[ "1972", priceNames[ i ] ]
}
Blanciforti86$xFoodScaled <- Blanciforti86$xFood /
   Blanciforti86[ "1972", "xFood" ]


###################################################
### code chunk number 58: micEconAids_vignette.Rnw:1825-1830
###################################################
estResultLA <- aidsEst( priceNamesScaled, shareNames, "xFoodScaled",
   data = Blanciforti86, priceIndex = "SL", maxiter = 100 )
estResultLA
elas( estResultLA )$exp
elas( estResultLA )$marshall


###################################################
### code chunk number 59: micEconAids_vignette.Rnw:1850-1857
###################################################
estResultLAnh <- aidsEst( priceNamesScaled, shareNames, "xFood",
   data = Blanciforti86, priceIndex = "SL", hom = FALSE, sym = FALSE,
   maxiter = 100 )
estResultLAnh
estResultLAnh$r2
elas( estResultLAnh )$exp
elas( estResultLAnh )$marshall


###################################################
### code chunk number 60: micEconAids_vignette.Rnw:1870-1876
###################################################
estResultLAns <- aidsEst( priceNamesScaled, shareNames, "xFood",
   data = Blanciforti86, priceIndex = "SL", sym = FALSE, maxiter = 100 )
estResultLAns
estResultLAns$r2
elas( estResultLAns )$exp
elas( estResultLAns )$marshall


###################################################
### code chunk number 61: micEconAids_vignette.Rnw:1889-1893
###################################################
estResultA <- aidsEst( priceNames, shareNames, "xFood",
   data = Blanciforti86[ -1, ], method = "IL", maxiter = 100 )
elas( estResultA )$exp
diag( elas( estResultA )$marshall )


###################################################
### code chunk number 62: micEconAids_vignette.Rnw:1912-1924
###################################################
diag( elas( estResultA, method = "AIDS" )$marshall )

estResultLA <- aidsEst( priceNames, shareNames, "xFood",
   data = Blanciforti86, priceIndex = "S", maxiter = 100 )

diag( elas( estResultLA, method = "AIDS" )$marshall )

diag( elas( estResultLA, method = "EU" )$marshall )

diag( elas( estResultLA, method = "Ch" )$marshall )

diag( elas( estResultLA, method = "GA" )$marshall )


