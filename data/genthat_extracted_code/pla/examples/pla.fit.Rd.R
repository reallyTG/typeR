library(pla)


### Name: pla.fit
### Title: Estimation in parallel line models, with listing of results
### Aliases: pla.fit fit plaFit-class anova,plaFit-method
###   coef,plaFit-method confint,plaFit-method fitted,plaFit-method
###   lm.influence,plaFit-method plot,plaFit-method predict,plaFit-method
###   print,plaFit-method residuals,plaFit-method summary,plaFit-method
###   vcov,plaFit-method
### Keywords: design

### ** Examples

data(Turbidimetric); Data <- Turbidimetric

Design <- "blocks"
Data   <- readAssayTable(paste(system.file(package = "pla"),
                           "vignettes/PhEur/data/AntibioticTurbidimetric.txt",
                           sep = "/"))
Frame  <- as.data.frame(Data, dr = 1.5)

fits   <- pla.fit(Frame, design = Design, sampleLabels = c("S", "T"),
                  dr = 1.5, returnPotencyEstimates = TRUE)

## Alternative on object of class 'pla':

plaModel <- plaRBD(Data)
Fits <- fit(plaModel)



