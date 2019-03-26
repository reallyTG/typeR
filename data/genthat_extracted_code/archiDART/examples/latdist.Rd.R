library(archiDART)


### Name: latdist
### Title: Computing Lateral Root Length and Density Distribution
### Aliases: latdist

### ** Examples

## Locate folder with DART and RSML files
path <- system.file("extdata", package="archiDART")

##-----------------
## DART files only
##-----------------

## Plotting the results for the primary root
## output="lrd", interpol=NULL, int.length=5
res3a <- latdist(inputrac=path, output="lrd", res=75, unitlength="cm",
int.length=5)

plot(res3a$results$ch7[[1]]$DBase, res3a$results$ch7[[1]]$LRD, pch=16, 
xlab="DBase (cm)",ylab="Lateral root density (roots/cm)", main="LRD-interpol=NULL-int.length=5",
las=1, bty="l", xaxp=c(0,90,9))

plot(res3a$results$ch7[[1]]$DBase, res3a$results$ch7[[1]]$LRL, pch=16, 
xlab="DBase (cm)",ylab="Lateral root length (cm/cm)", main="LRL-interpol=NULL-int.length=5",
las=1, bty="l", xaxp=c(0,90,9))

## output="lrd", interpol=1000, int.length=5
res3b <- latdist(inputrac=path, output="lrd", res=75, unitlength="cm",
int.length=5, interpol=1000)

plot(res3b$results$ch7[[1]]$DBase, res3b$results$ch7[[1]]$LRD, pch=16, 
xlab="DBase (cm)", ylab="Lateral root density (roots/cm)", main="LRD-interpol=1000-int.length=5", 
las=1, bty="l", xaxp=c(0,90,9))

plot(res3b$results$ch7[[1]]$DBase, res3b$results$ch7[[1]]$LRL, pch=16, 
xlab="DBase (cm)", ylab="Lateral root length (cm/cm)", main="LRL-interpol=1000-int.length=5", 
las=1, bty="l", xaxp=c(0,90,9))

## output="dtp"
res3c <- latdist(inputrac=path, output="dtp", res=75, unitlength="cm")

plot(res3c$results$ch7[[1]]$DBase, res3c$results$ch7[[1]]$DTP, pch=16, 
xlab="DBase (cm)", ylab="Distance to the previous root (cm)", main="DTP", las=1, bty="l",
xaxp=c(0,90,9))

##-----------------
## RSML files only
##-----------------

## output="lrd", interpol=200, int.length=1
res3d <- latdist(inputrsml=path, unitlength="cm", output="lrd", int.length=1, interpol=200,
rsml.connect=TRUE)

##output="dtp"
res3e <- latdist(inputrsml=path, output="dtp", unitlength="cm")

##---------------------
## DART and RSML files
##---------------------

## output="lrd", interpol=200, int.length=2
res3f <- latdist(inputrac=path, inputrsml=path, output="lrd", res=75, unitlength="cm",
int.length=2, interpol=200, rsml.connect=TRUE)

## output="dtp"
res3g <- latdist(inputrac=path, inputrsml=path, output="dtp", res=75, unitlength="cm")



