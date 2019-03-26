library(secr)


### Name: hornedlizard
### Title: Flat-tailed Horned Lizard Dataset
### Aliases: hornedlizard hornedlizardCH
### Keywords: datasets

### ** Examples


plot(hornedlizardCH, tracks = TRUE, varycol = FALSE,
    lab1 = TRUE, laboff = 6, border = 10, title =
    "Flat-tailed Horned Lizards (Royle & Young 2008)")

table(table(animalID(hornedlizardCH)))
traps(hornedlizardCH)

## show first few x-y coordinates
head(xy(hornedlizardCH))

## Not run: 
##D ## Compare default (Poisson) and binomial models for number
##D ## caught
##D FTHL.fit <- secr.fit(hornedlizardCH)
##D FTHLbn.fit <- secr.fit(hornedlizardCH, details =
##D     list(distribution = "binomial"))
##D collate(FTHL.fit, FTHLbn.fit)[,,,"D"]
##D 
##D ## Collapse occasions (does not run faster)
##D hornedlizardCH.14 <- reduce(hornedlizardCH, newoccasions =
##D     list(1:14), outputdetector = "polygon")
##D FTHL14.fit <- secr.fit(hornedlizardCH.14, binomN = 14)
## End(Not run)




