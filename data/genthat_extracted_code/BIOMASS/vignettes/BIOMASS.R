## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)
test <- TRUE
CACHE <- TRUE
require(knitr)
require(BIOMASS)

## ---- eval=F-------------------------------------------------------------
#  install.packages("BIOMASS")

## ---- eval=F-------------------------------------------------------------
#  require(BIOMASS)
#  require(knitr) # To build tables in this document

## ---- cache=CACHE--------------------------------------------------------
data(KarnatakaForest)
str(KarnatakaForest)
#
data(NouraguesHD)
str(NouraguesHD)

## ---- cache=CACHE--------------------------------------------------------
selecPlot <- KarnatakaForest$plotId %in% c("BSP2", "BSP12", "BSP14", "BSP26", "BSP28", "BSP30", "BSP34", "BSP44", "BSP63", "BSP65")
KarnatakaForestsub <- droplevels(KarnatakaForest[selecPlot, ])

## ----eval=test, cache=CACHE----------------------------------------------
Taxo <- correctTaxo(genus = KarnatakaForestsub$genus, species = KarnatakaForestsub$species, useCache = T, verbose = F)
KarnatakaForestsub$genusCorr <- Taxo$genusCorrected
KarnatakaForestsub$speciesCorr <- Taxo$speciesCorrected

## ----eval=test, cache=CACHE----------------------------------------------
APG <- getTaxonomy(KarnatakaForestsub$genusCorr, findOrder = T)
KarnatakaForestsub$familyAPG <- APG$family
KarnatakaForestsub$orderAPG <- APG$order

## ----eval=test, cache=CACHE----------------------------------------------
dataWD <- getWoodDensity(
  genus = KarnatakaForestsub$genusCorr,
  species = KarnatakaForestsub$speciesCorr,
  stand = KarnatakaForestsub$plotId
)

## ----eval=test, cache=CACHE----------------------------------------------
LocalWoodDensity <- data.frame(
  genus = c("Ziziphus", "Terminalia", "Garcinia"),
  species = c("oenopolia", "bellirica", "indica"),
  wd = c(0.65, 0.72, 0.65)
)

dataWD <- getWoodDensity(
  genus = KarnatakaForestsub$genusCorr,
  species = KarnatakaForestsub$speciesCorr,
  family = KarnatakaForestsub$familyAPG,
  stand = KarnatakaForestsub$plotID,
  addWoodDensityData = LocalWoodDensity
)

## ----eval=test, cache=CACHE----------------------------------------------
# At species level
sum(dataWD$levelWD == "species")
# At genus level
sum(dataWD$levelWD == "genus")
# At plot level
sum(!dataWD$levelWD %in% c("genus", "species"))

## ----echo=TRUE, cache=CACHE----------------------------------------------
result <- modelHD(
  D = NouraguesHD$D,
  H = NouraguesHD$H,
  useWeight = TRUE
)
kable(result)

## ---- cache=CACHE--------------------------------------------------------
HDmodel <- modelHD(
  D = NouraguesHD$D,
  H = NouraguesHD$H,
  method = "log2",
  useWeight = TRUE
)

## ---- cache=CACHE--------------------------------------------------------
HDmodelPerPlot <- modelHD(
  D = NouraguesHD$D, H = NouraguesHD$H, method = "weibull",
  useWeight = T, plot = NouraguesHD$plotId
)
ResHD <- t(sapply(HDmodelPerPlot, function(x) c(coef(x$model), RSE = x$RSE)))
kable(ResHD, row.names = T, digits = 3)

## ---- cache=CACHE--------------------------------------------------------
dataHlocal <- retrieveH(
  D = KarnatakaForestsub$D,
  model = HDmodel
)

## ---- cache=CACHE--------------------------------------------------------
dataHfeld <- retrieveH(
  D = KarnatakaForestsub$D,
  region = "SEAsia"
)

## ---- eval=F, cache=CACHE------------------------------------------------
#  dataHchave <- retrieveH(
#    D = KarnatakaForestsub$D,
#    coord = KarnatakaForestsub[, c("long", "lat")]
#  )

## ---- cache=CACHE--------------------------------------------------------
KarnatakaForestsub$WD <- dataWD$meanWD
KarnatakaForestsub$H <- dataHlocal$H
KarnatakaForestsub$Hfeld <- dataHfeld$H

## ----warning=F, cache=CACHE----------------------------------------------
AGBtree <- computeAGB(
  D = KarnatakaForestsub$D,
  WD = KarnatakaForestsub$WD,
  H = KarnatakaForestsub$H
)

## ----warning=F, cache=CACHE----------------------------------------------
AGBplot <- summaryByPlot(AGBtree, KarnatakaForestsub$plotId)

## ----warning=F, eval=F, cache=CACHE--------------------------------------
#  AGBplotChave <- summaryByPlot(
#    computeAGB(
#      D = KarnatakaForestsub$D, WD = KarnatakaForestsub$WD,
#      coord = KarnatakaForestsub[, c("long", "lat")]
#    ),
#    KarnatakaForestsub$plotId
#  )

## ----warning=F, cache=CACHE----------------------------------------------
AGBplotFeld <- summaryByPlot(
  computeAGB(
    D = KarnatakaForestsub$D, WD = KarnatakaForestsub$WD,
    H = KarnatakaForestsub$Hfeld
  ),
  plot = KarnatakaForestsub$plotId
)

## ---- cache=CACHE--------------------------------------------------------
KarnatakaForestsub$sdWD <- dataWD$sdWD
KarnatakaForestsub$HfeldRSE <- dataHfeld$RSE

## ---- cache=CACHE--------------------------------------------------------
resultMC <- AGBmonteCarlo(D = KarnatakaForestsub$D, WD = KarnatakaForestsub$WD, errWD = KarnatakaForestsub$sdWD, HDmodel = HDmodel, Dpropag = "chave2004")
Res <- summaryByPlot(resultMC$AGB_simu, KarnatakaForestsub$plotId)
Res <- Res[order(Res$AGB), ]
plot(Res$AGB, pch = 20, xlab = "Plots", ylab = "AGB (Mg/ha)", ylim = c(0, max(Res$Cred_97.5)), las = 1, cex.lab = 1.3)
segments(seq(nrow(Res)), Res$Cred_2.5, seq(nrow(Res)), Res$Cred_97.5, col = "red")

## ---- eval=F, cache=CACHE------------------------------------------------
#  resultMC <- AGBmonteCarlo(
#    D = KarnatakaForestsub$D,
#    WD = KarnatakaForestsub$WD,
#    errWD = KarnatakaForestsub$sdWD,
#    H = KarnatakaForestsub$Hfeld,
#    errH = KarnatakaForestsub$HfeldRSE,
#    Dpropag = "chave2004"
#  )
#  
#  Res <- summaryByPlot(resultMC$AGB_simu, KarnatakaForestsub$plotId)
#  Res <- Res[order(Res$AGB), ]
#  plot(Res$AGB, pch = 20, xlab = "Plots", ylab = "AGB (Mg/ha)", ylim = c(0, max(Res$Cred_97.5)), las = 1, cex.lab = 1.3)
#  segments(seq(nrow(Res)), Res$Cred_2.5, seq(nrow(Res)), Res$Cred_97.5, col = "red")

## ---- eval=F,cache=CACHE-------------------------------------------------
#  resultMC <- AGBmonteCarlo(
#    D = KarnatakaForestsub$D,
#    WD = KarnatakaForestsub$WD,
#    errWD = KarnatakaForestsub$sdWD,
#    coord = KarnatakaForestsub[, c("long", "lat")],
#    Dpropag = "chave2004"
#  )
#  Res <- summaryByPlot(resultMC$AGB_simu, KarnatakaForestsub$plotId)
#  Res <- Res[order(Res$AGB), ]
#  plot(Res$AGB, pch = 20, xlab = "Plots", ylab = "AGB (Mg/ha)", ylim = c(0, max(Res$Cred_97.5)), las = 1, cex.lab = 1.3)
#  segments(seq(nrow(Res)), Res$Cred_2.5, seq(nrow(Res)), Res$Cred_97.5, col = "red")

## ---- cache=CACHE--------------------------------------------------------
NouraguesHD$Hmix <- NouraguesHD$H
NouraguesHD$RSEmix <- 0.5
filt <- is.na(NouraguesHD$Hmix)
NouraguesHD$Hmix[filt] <- retrieveH(NouraguesHD$D, model = HDmodel)$H[filt]
NouraguesHD$RSEmix[filt] <- HDmodel$RSE

## ----eval=F, cache=CACHE-------------------------------------------------
#  wd <- getWoodDensity(NouraguesHD$genus, NouraguesHD$species)
#  resultMC <- AGBmonteCarlo(
#    D = NouraguesHD$D, WD = wd$meanWD, errWD = wd$sdWD,
#    H = NouraguesHD$Hmix, errH = NouraguesHD$RSEmix,
#    Dpropag = "chave2004"
#  )
#  Res <- summaryByPlot(resultMC$AGB_simu, NouraguesHD$plotId)
#  Res <- Res[order(Res$AGB), ]
#  plot(Res$AGB, pch = 20, xlab = "Plots", ylab = "AGB (Mg/ha)", ylim = c(0, max(Res$Cred_97.5)), las = 1, cex.lab = 1.3)
#  segments(1:nrow(Res), Res$Cred_2.5, 1:nrow(Res), Res$Cred_97.5, col = "red")

