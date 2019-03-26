## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, dev = "png", fig.width = 7, fig.height = 5, message = FALSE, warning = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("minval")

## ---- message=FALSE------------------------------------------------------
library("minval")
#library("sybilSBML")
library("sybil")
library("glpkAPI")

## ---- eval= FALSE--------------------------------------------------------
#  "H2O[c] + Urea-1-Carboxylate[c] <=> 2 CO2[c] + 2 NH3[c]"
#  "ADP[c] + Phosphoenolpyruvate[c] => ATP[c] + Pyruvate[c]"
#  "CO2[c] <=>"

## ------------------------------------------------------------------------
reactants(reactionList = "ADP[c] + Phosphoenolpyruvate[c] => ATP[c] + Pyruvate[c]")
products(reactionList = "ADP[c] + Phosphoenolpyruvate[c] => ATP[c] + Pyruvate[c]")

## ------------------------------------------------------------------------
reactants(reactionList = "H2O[c] + Urea-1-Carboxylate[c] <=> 2 CO2[c] + 2 NH3[c]")
products(reactionList = "H2O[c] + Urea-1-Carboxylate[c] <=> 2 CO2[c] + 2 NH3[c]")

## ------------------------------------------------------------------------
glycolysis <- read.csv(file = system.file("extdata", "glycolysisModel.csv",
                                          package = "minval"), 
                        stringsAsFactors = FALSE,
                        sep = '\t'
                        )
glycolysis$REACTION

## ------------------------------------------------------------------------
colnames(glycolysis)

## ------------------------------------------------------------------------
writeSBMLmod(modelData = glycolysis,
          modelID = "Glycolysis",
          outputFile = "glycolysis.xml"
          )

## ------------------------------------------------------------------------
# glycoModel <- sybilSBML::readSBMLmod("glycolysis.xml")
# glycoModel

## ------------------------------------------------------------------------
# sybil::optimizeProb(glycoModel)

## ------------------------------------------------------------------------
validateSyntax(reactionList = glycolysis$REACTION)

## ---- eval = FALSE-------------------------------------------------------
#  ChEBI <- downloadChEBI(release = "latest",
#                         woAssociations = TRUE
#                         )

## ------------------------------------------------------------------------
chemicalData <- read.csv2(file = system.file("extdata", "chemData.csv", 
                                             package = "minval")
                          )
head(chemicalData)

## ------------------------------------------------------------------------
checkBalance(reactionList = glycolysis$REACTION,
             referenceData = chemicalData,
             ids = "NAME",
             mFormula = "FORMULA"
             )

## ------------------------------------------------------------------------
glycolysis$REACTION[3] <- "D-Glyceraldehyde 3-phosphate[c] + Orthophosphate[c] + NAD+[c] <=> 3-Phospho-D-glyceroyl phosphate[c] + NADH[c] + H+[c]"

checkBalance(reactionList = glycolysis$REACTION,
             referenceData = chemicalData,
             ids = "NAME",
             mWeight = "MASS"
             )

## ------------------------------------------------------------------------
writeSBMLmod(modelData = glycolysis,
          modelID = "GlycolysisBalanced",
          outputFile = "glycolysisBalanced.xml"
          )

# sybil::optimizeProb(sybilSBML::readSBMLmod("glycolysisBalanced.xml"))

## ------------------------------------------------------------------------
checkBalance(reactionList = glycolysis$REACTION,
             referenceData = chemicalData,
             ids = "NAME",
             mCharge = "CHARGE"
             )

## ------------------------------------------------------------------------
stoichiometricMatrix(reactionList = glycolysis$REACTION)

## ------------------------------------------------------------------------
metabolites(reactionList = glycolysis$REACTION)

## ------------------------------------------------------------------------
metabolites(reactionList = glycolysis$REACTION,
            woCompartment = TRUE)

## ------------------------------------------------------------------------
compartments(reactionList = glycolysis$REACTION)

## ------------------------------------------------------------------------
orphanMetabolites(reactionList = glycolysis$REACTION[1:10])

## ------------------------------------------------------------------------
orphanReactants(reactionList = glycolysis$REACTION[1:10])
orphanProducts(reactionList = glycolysis$REACTION[1:10])


## ------------------------------------------------------------------------
writeTSVmod(modelData = glycolysis,
          modelID = "Glycolysis",
          outputFile = "glycolysis"
          )

sybil::readTSVmod(prefix = "glycolysis",quoteChar = "\"")

