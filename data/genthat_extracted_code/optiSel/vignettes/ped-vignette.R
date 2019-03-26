## ------------------------------------------------------------------------
Pedigree <- data.frame(
  Indiv= c("Iffes",     "Peter",    "Anna-Lena", "Kevin",    "Horst"),
  Sire = c("Kevin",     "Kevin",     NA,          0,         "Horst"),
  Dam  = c("Chantalle", "Angelika", "Chantalle", "",           NA),
  Breed= c("Angler",    "Angler",   "Angler",    "Holstein", "Angler"),
  Born = c(2015,        2016,       2011,       2010,        2015)
  )
Pedigree

## ------------------------------------------------------------------------
library("optiSel")
Pedig <- prePed(Pedigree)

## ------------------------------------------------------------------------
Pedig[,-1]

## ---- warning=FALSE------------------------------------------------------
sPed <- subPed(Pedig, keep = c("Chantalle","Angelika"), prevGen = 2, succGen = 1)
pedplot(sPed, label = c("Indiv", "Born", "Breed"), cex = 0.55)

## ---- results="hide"-----------------------------------------------------
data("PedigWithErrors")
data("Phen")
Pedig <- prePed(PedigWithErrors)

## ------------------------------------------------------------------------
compl <- completeness(Pedig, keep=Phen$Indiv, by="Indiv")
head(compl)

## ---- warning=FALSE------------------------------------------------------
compl <- completeness(Pedig, keep=Phen$Indiv, by="Sex")
library("ggplot2")
ggplot(compl, aes(x=Generation, y=Completeness, col=Sex)) + geom_line()

## ------------------------------------------------------------------------
Summary <- summary(Pedig, keep.only=Phen$Indiv)
head(Summary[Summary$equiGen>3.0, -1])

## ------------------------------------------------------------------------
Animal <- pedInbreeding(Pedig)
mean(Animal$Inbr[Animal$Indiv %in% Phen$Indiv])

## ------------------------------------------------------------------------
pKin   <- pedIBD(Pedig, keep.only=Phen$Indiv)
isMale <- Pedig$Sex=="male" & (Pedig$Indiv %in% Phen$Indiv[Phen$BV>1.0])
males  <- Pedig$Indiv[isMale & summary(Pedig)$equiGen>5]
pKin[males, "276000812750188", drop=FALSE]

## ---- results="hide"-----------------------------------------------------
Pedig <- prePed(PedigWithErrors, thisBreed="Hinterwaelder", lastNative=1970)

## ------------------------------------------------------------------------
cont  <- pedBreedComp(Pedig, thisBreed="Hinterwaelder")
Pedig$NC <- cont$native
head(cont[rev(Phen$Indiv), 2:6])

## ---- results="hide"-----------------------------------------------------
pKinatN <- pedIBDatN(Pedig, thisBreed="Hinterwaelder", keep.only=Phen$Indiv)

## ------------------------------------------------------------------------
pKinatN$of <- pKinatN$Q1/pKinatN$Q2
pKinatN$of["276000891862786","276000812497659"]

## ------------------------------------------------------------------------
Pedig[c("276000891862786", "276000812497659"),c("Born","NC")]

## ------------------------------------------------------------------------
pKinatN$mean

## ------------------------------------------------------------------------
subKin    <- pKin[Phen$Indiv, Phen$Indiv]
subNatKin <- pKinatN$of[Phen$Indiv, Phen$Indiv]
diag(subKin)    <- NA
diag(subNatKin) <- NA
cor(c(subKin), c(subNatKin), use="complete.obs")

## ------------------------------------------------------------------------
1 - mean(pKin[Phen$Indiv, Phen$Indiv])

## ------------------------------------------------------------------------
pKinatN$mean

## ------------------------------------------------------------------------
1 - pKinatN$mean

## ------------------------------------------------------------------------
pKinatN  <- pedIBDatN(Pedig, thisBreed="Hinterwaelder", keep.only=Phen$Indiv, nGen=6)

## ------------------------------------------------------------------------
attributes(pKinatN)$nativeNe

## ------------------------------------------------------------------------
id     <- Summary$Indiv[Summary$equiGen>=4 & Summary$Indiv %in% Phen$Indiv]
g      <- Summary[id, "equiGen"]
N      <- length(g)
n      <- (matrix(g, N, N, byrow=TRUE) + matrix(g, N, N, byrow=FALSE))/2
deltaC <- 1 - (1-pKin[id,id])^(1/n)
Ne     <- 1/(2*mean(deltaC))
Ne

## ---- results="hide"-----------------------------------------------------
data("PedigWithErrors")
Pedig <- prePed(PedigWithErrors, thisBreed="Hinterwaelder", lastNative=1970)
set.seed(0)
keep <- sampleIndiv(Pedig[Pedig$Breed=="Hinterwaelder",], from="Born", each=50)
cand <- candes(phen   = Pedig[keep,],
               pKin   = pedIBD(Pedig, keep.only=keep), 
               pKinatN= pedIBDatN(Pedig, thisBreed="Hinterwaelder", keep.only=keep), 
               quiet=TRUE, reduce.data=FALSE)

## ---- fig.show='hold'----------------------------------------------------
sy <- summary(cand, tlim=c(1970, 2000), histNe=150, base=1800, df=4)
ggplot(sy, aes(x=t, y=Ne)) + geom_line() + ylim(c(0,100))
ggplot(sy, aes(x=t, y=NGE)) + geom_line() + ylim(c(0,7))

## ---- fig.width = 5, fig.height = 3--------------------------------------
use  <- Pedig$Breed=="Hinterwaelder" & Pedig$Born %in% (1950:1995)
cont <- pedBreedComp(Pedig, thisBreed="Hinterwaelder")
contByYear <- conttac(cont, cohort=Pedig$Born, use=use, mincont = 0.01)
ggplot(contByYear, aes(x=Year, y=Contribution, fill=Breed)) + geom_area(color="black")

