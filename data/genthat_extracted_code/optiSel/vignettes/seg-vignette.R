## ------------------------------------------------------------------------
library("optiSel")
data(Cattle)
phen <- Cattle
head(phen)

## ------------------------------------------------------------------------
table(phen$Breed)

## ------------------------------------------------------------------------
data(map)
head(map)

## ------------------------------------------------------------------------
tapply(map$Mb, map$Chr, max)

## ------------------------------------------------------------------------
dir     <- system.file("extdata", package="optiSel")
GTfiles <- file.path(dir, paste("Chr", unique(map$Chr), ".phased", sep=""))

## ---- results="hide"-----------------------------------------------------
Animal <- segInbreeding(GTfiles, map, minSNP=20, minL=1.0)

## ------------------------------------------------------------------------
head(Animal)

## ---- results="hide"-----------------------------------------------------
sKin <- segIBD(GTfiles, map, minSNP=20, minL=1.0)

## ------------------------------------------------------------------------
sKin[1:3,1:3]

## ------------------------------------------------------------------------
Males  <- phen$Indiv[phen$Sex=="male" & phen$Breed=="Angler" & phen$BV>2.0]
sKin[Males, "Angler2", drop=FALSE]

## ------------------------------------------------------------------------
D     <- sim2dis(sKin, a=6.0, baseF=0.03, method=1)
color <- c(Angler="red", Rotbunt="green", Fleckvieh="blue", Holstein="black")
col   <- color[phen[rownames(D), "Breed"]]
Res   <- cmdscale(D)
plot(Res, pch=18, col=col, main="Multidimensional Scaling", cex=0.5, xlab="",ylab="", asp=1)

## ---- fig.width = 5, results="hide"--------------------------------------
Haplo <- haplofreq(GTfiles, phen, map, thisBreed="Angler", refBreeds="Rotbunt", minL=1.0)
plot(Haplo, ID="Angler1", hap=2)

## ---- fig.width = 5, results="hide"--------------------------------------
Haplo <- freqlist(
  haplofreq(GTfiles, phen, map, thisBreed="Angler", refBreeds="Rotbunt", minL=1.0),
  haplofreq(GTfiles, phen, map, thisBreed="Angler", refBreeds="Holstein", minL=1.0),
  haplofreq(GTfiles, phen, map, thisBreed="Angler", refBreeds="Fleckvieh", minL=1.0)
  )

plot(Haplo, ID=1, hap=2, refBreed="Rotbunt")

## ---- results="hide"-----------------------------------------------------
Haplo <- haplofreq(GTfiles, phen, map, thisBreed="Angler", refBreeds="others", minL=2.5)

## ------------------------------------------------------------------------
Haplo$freq[1:10,1:3]

## ------------------------------------------------------------------------
Haplo$match[1:10,1:3]

## ---- results="hide"-----------------------------------------------------
wdir  <- file.path(tempdir(), "HaplotypeEval")
wfile <- haplofreq(GTfiles, phen, map, thisBreed="Angler", minL=1.0, w.dir=wdir)

## ------------------------------------------------------------------------
Comp  <- segBreedComp(Haplo$match, map)
head(Comp[,-1])

## ------------------------------------------------------------------------
Average <- apply(Comp[,-1],2,mean)
round(Average, 3)

## ---- results="hide"-----------------------------------------------------
sKinatN <- segIBDatN(GTfiles, phen, map, thisBreed="Angler", minL=1.0)

## ------------------------------------------------------------------------
sKinatN$of <- sKinatN$Q1/sKinatN$Q2
sKinatN$of["Angler2", "Angler4"]

## ------------------------------------------------------------------------
keep <- phen$Indiv[phen$Breed=="Angler"]
1 - mean(sKin[keep, keep])

## ------------------------------------------------------------------------
sKinatN$mean

## ------------------------------------------------------------------------
1 - sKinatN$mean

## ---- results="hide"-----------------------------------------------------
sKin  <- segIBD(GTfiles, map, minSNP=20, minL=1.0)

## ------------------------------------------------------------------------
CoreSet <- opticomp(sKin, phen)
round(CoreSet$f, 3)

## ------------------------------------------------------------------------
round(CoreSet$Dist, 3)

## ------------------------------------------------------------------------
CoreSet <- opticomp(sKin, phen)
CoreSet$bc

## ------------------------------------------------------------------------
CoreSet$value

## ------------------------------------------------------------------------
CoreSet <- opticomp(sKin, phen, ub=c(Angler=0))
CoreSet$bc

## ------------------------------------------------------------------------
CoreSet$value

