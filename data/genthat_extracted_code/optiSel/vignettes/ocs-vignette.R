## ------------------------------------------------------------------------
library("optiSel")
data(Cattle)
head(Cattle)

## ------------------------------------------------------------------------
data(map)
dir     <- system.file("extdata", package="optiSel")
GTfiles <- file.path(dir, paste("Chr", unique(map$Chr), ".phased", sep=""))
head(map)

## ------------------------------------------------------------------------
cont  <- data.frame(
  age   = c(   1,    2,    3,    4,    5,    6,    7,   8,    9,    10), 
  male  = c(0.14, 0.14, 0.09, 0.04, 0.03, 0.03, 0.02, 0.02, 0.01, 0.01),
  female= c(0.08, 0.08, 0.07, 0.06, 0.05, 0.04, 0.03, 0.02, 0.02, 0.02))

## ------------------------------------------------------------------------
L <- 1/(4*cont$male[1]) + 1/(4*cont$female[1])
L

## ------------------------------------------------------------------------
phen <- Cattle[Cattle$Breed=="Angler",]
phen$isCandidate <- phen$Born<=2013

## ------------------------------------------------------------------------
sKin <- segIBD(GTfiles, map)

## ------------------------------------------------------------------------
cand  <- candes(phen=phen, sKin=sKin, cont=cont)

## ------------------------------------------------------------------------
cand$mean

## ------------------------------------------------------------------------
Ne <- 100

con <- list(
  uniform = "female",
  ub.sKin = cand$mean$sKin + (1-cand$mean$sKin)*(1/(2*Ne*L))
)

## ------------------------------------------------------------------------
Offspring <- opticont("max.BV", cand, con, trace=FALSE)

## ------------------------------------------------------------------------
Offspring$info

## ------------------------------------------------------------------------
Offspring$obj.fun

## ------------------------------------------------------------------------
Offspring$mean

## ------------------------------------------------------------------------
Candidate <- Offspring$parent[,  c("Indiv", "Sex", "oc", "herd")]
head(Candidate[Candidate$Sex=="male" & Candidate$oc>0.001,])

## ------------------------------------------------------------------------
Candidate$n <- noffspring(Candidate, N=20)$nOff
head(Candidate[Candidate$Sex=="male" & Candidate$oc>0.001,])

## ------------------------------------------------------------------------
Mating <- matings(Candidate, Kin=sKin)
head(Mating)

## ------------------------------------------------------------------------
attributes(Mating)$objval

## ---- results="hide"-----------------------------------------------------
wdir  <- file.path(tempdir(), "HaplotypeEval")
wfile <- haplofreq(GTfiles, Cattle, map, thisBreed="Angler", minL=1.0, w.dir=wdir)
Comp  <- segBreedComp(wfile$match, map)
Cattle[rownames(Comp), "NC"] <- Comp$native

## ------------------------------------------------------------------------
head(Cattle[,-1])

## ---- results="hide"-----------------------------------------------------
phen    <- Cattle[Cattle$Breed=="Angler",]
phen$isCandidate <- phen$Born<=2013

sKin    <- segIBD(GTfiles, map, minL=1.0)
sKinatN <- segIBDatN(GTfiles, Cattle, map, thisBreed="Angler", minL=1.0)

## ------------------------------------------------------------------------
cand  <- candes(phen=phen, sKin=sKin, sKinatN=sKinatN, cont=cont)

## ------------------------------------------------------------------------
cand$mean

## ------------------------------------------------------------------------
con <- list(
  uniform = "female",
  ub.sKin = cand$mean$sKin + (1-cand$mean$sKin)*(1/(2*Ne*L))
  )

## ---- results="hide"-----------------------------------------------------
Offspring   <- opticont("max.BV", cand, con, trace=FALSE)

## ------------------------------------------------------------------------
Offspring$info

## ------------------------------------------------------------------------
Offspring$mean

## ---- results="hide"-----------------------------------------------------
con <- list(
  uniform    ="female",
  ub.sKin    = cand$mean$sKin    + (1-cand$mean$sKin)*(1/(2*Ne*L)),
  ub.sKinatN = cand$mean$sKinatN + (1-cand$mean$sKinatN)*(1/(2*Ne*L)),
  lb.NC      = cand$mean$NC
  )

Offspring2 <- opticont("max.BV", cand, con)

## ------------------------------------------------------------------------
rbind(Ref=cand$mean, maxBV=Offspring$mean, maxBV2=Offspring2$mean)

## ------------------------------------------------------------------------
con  <- list(uniform="female")

## ---- results="hide"-----------------------------------------------------
Offspring   <- opticont("min.sKin", cand, con)

## ------------------------------------------------------------------------
rbind(cand$mean, Offspring$mean)

## ---- results="hide"-----------------------------------------------------
con <- list(
  uniform    = "female",
  lb.NC      = cand$mean$NC + 0.04,
  ub.sKinatN = cand$mean$sKinatN + (1-cand$mean$sKinatN)*(1/(2*Ne*L))
)
Offspring2     <- opticont("min.sKin", cand, con)

## ------------------------------------------------------------------------
rbind(Ref=cand$mean, minKin=Offspring$mean, minKin2=Offspring2$mean)

## ---- results="hide"-----------------------------------------------------
con <- list(
  uniform    = "female",
  ub.sKin    = cand$mean$sKin    + (1-cand$mean$sKin   )*(1/(2*Ne*L)),
  ub.sKinatN = cand$mean$sKinatN + (1-cand$mean$sKinatN)*(1/(2*Ne*L))
)
Offspring <- opticont("max.NC", cand, con)

## ------------------------------------------------------------------------
Offspring$info

## ------------------------------------------------------------------------
Offspring$mean

## ---- results="hide"-----------------------------------------------------
con <- list(
  uniform    = "female",
  ub.sKin    = cand$mean$sKin    + (1-cand$mean$sKin   )*(1/(2*Ne*L)),
  ub.sKinatN = cand$mean$sKinatN + (1-cand$mean$sKinatN)*(1/(2*Ne*L)),
  lb.BV      = cand$mean$BV
)

Offspring2  <- opticont("max.NC", cand, con)

## ------------------------------------------------------------------------
rbind(Ref=cand$mean, maxNC=Offspring$mean, maxNC2=Offspring2$mean)

## ------------------------------------------------------------------------
Cattle$isCandidate <- Cattle$Born<=2013
cand <- candes(phen=Cattle, sKin=sKin, sKinatN.Angler=sKinatN, bc="sKin", cont=cont)
 
mKin <- cand$mean$sKinatN.Angler
con  <- list(
  uniform = c("Angler.female", "Fleckvieh", "Holstein", "Rotbunt"), 
  ub.sKinatN.Angler = mKin + (1-mKin)*(1/(2*Ne*L))
  )

## ------------------------------------------------------------------------
Offspring <- opticont("min.sKin", cand, con, trace=FALSE)

## ------------------------------------------------------------------------
Offspring$info

## ------------------------------------------------------------------------
Offspring$mean

## ------------------------------------------------------------------------
head(Offspring$parent[Offspring$parent$oc>0.02,c("Breed","lb","oc","ub")])

## ---- results="hide"-----------------------------------------------------
data("PedigWithErrors")
Pedig <- prePed(PedigWithErrors, thisBreed="Hinterwaelder", lastNative=1970)

## ------------------------------------------------------------------------
tail(Pedig[,-1])

## ------------------------------------------------------------------------
cont     <- pedBreedComp(Pedig, thisBreed="Hinterwaelder")
Pedig$NC <- cont$native
tail(cont[, 2:5])

## ------------------------------------------------------------------------
use   <- Pedig$Born %in% (1980:1990) & Pedig$Breed=="Hinterwaelder"
use   <- use & summary(Pedig)$equiGen>=4
phen  <- Pedig[use, c("Indiv", "Sex", "Breed", "Born", "BV", "NC")]
phen$isCandidate <- phen$Born<=1991

## ------------------------------------------------------------------------
cont     <- agecont(Pedig, phen$Indiv)
head(cont)

## ------------------------------------------------------------------------
L <- 1/(4*cont$male[1]) + 1/(4*cont$female[1])
L

## ---- results="hide"-----------------------------------------------------
pKin    <- pedIBD(Pedig, keep.only=phen$Indiv)
pKinatN <- pedIBDatN(Pedig, thisBreed="Hinterwaelder", keep.only=phen$Indiv)

## ------------------------------------------------------------------------
cand <- candes(phen=phen, pKin=pKin, pKinatN=pKinatN, cont=cont)

## ------------------------------------------------------------------------
cand$mean

## ------------------------------------------------------------------------
con <- list(
  uniform = "female",
  ub.pKin = cand$mean$pKin + (1-cand$mean$pKin)*(1/(2*Ne*L))
)

## ---- results="hide"-----------------------------------------------------
Offspring <- opticont("max.BV", cand, con)

## ------------------------------------------------------------------------
rbind(cand$mean, Offspring$mean)

## ---- results="hide"-----------------------------------------------------
con <- list(
  uniform    = "female",
  ub.pKin    = cand$mean$pKin    + (1-cand$mean$pKin)*(1/(2*Ne*L)),
  ub.pKinatN = cand$mean$pKinatN + (1-cand$mean$pKinatN)*(1/(2*Ne*L)),
  lb.NC      = cand$mean$NC
)
Offspring2     <- opticont("max.BV", cand, con)

## ------------------------------------------------------------------------
rbind(Ref=cand$mean, maxBV=Offspring$mean, maxBV2=Offspring2$mean)

## ------------------------------------------------------------------------
con  <- list(uniform="female")

## ---- results="hide"-----------------------------------------------------
Offspring <- opticont("min.pKin", cand, con)

## ------------------------------------------------------------------------
rbind(cand$mean, Offspring$mean)

## ---- results="hide"-----------------------------------------------------
con  <- list(
  uniform = "female",
  lb.NC   = 1.02*cand$mean$NC,
  ub.pKin = cand$mean$pKin + (1-cand$mean$pKin)*(1/(2*Ne*L))
)

Offspring2  <- opticont("min.pKinatN", cand, con)

## ------------------------------------------------------------------------
rbind(Ref=cand$mean, minKin=Offspring$mean, minKin2=Offspring2$mean)

## ---- results="hide"-----------------------------------------------------
con <- list(
  uniform    = "female",
  ub.pKin    = cand$mean$pKin    + (1-cand$mean$pKin   )*(1/(2*Ne*L)),
  ub.pKinatN = cand$mean$pKinatN + (1-cand$mean$pKinatN)*(1/(2*Ne*L))
)
Offspring <- opticont("max.NC", cand, con)

## ------------------------------------------------------------------------
Offspring$mean

## ---- results="hide"-----------------------------------------------------
con <- list(
  uniform    = "female",
  ub.pKin    = cand$mean$pKin    + (1-cand$mean$pKin   )*(1/(2*Ne*L)),
  ub.pKinatN = cand$mean$pKinatN + (1-cand$mean$pKinatN)*(1/(2*Ne*L)),
  lb.BV      = cand$mean$BV
)
Offspring2 <- opticont("max.NC", cand, con)

## ------------------------------------------------------------------------
rbind(Ref=cand$mean, maxNC=Offspring$mean, maxNC2=Offspring2$mean)

