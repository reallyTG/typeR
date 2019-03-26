library(pim)


### Name: Extract.pim.summary
### Title: Extract method for pim.summary objects
### Aliases: Extract.pim.summary [,pim.summary-method

### ** Examples

data(FEVData)
Model <- pim(FEV~ Smoke*Sex , data=FEVData)

thesummary <- summary(Model)
thesummary[,2:3]
thesummary["Sex"]




