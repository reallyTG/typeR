library(EDA)


### Name: EDA
### Title: Energy consumption analysis for calculating carbon emission
###   changes
### Aliases: EDA print.EDA plot.EDA

### ** Examples

library(EDA)
data(carbon)
data(factordata)
## set parameters
cdata <- carbon[,-c(1,2)]
Year <- 2001:2005
Sector <- c("b1", "b2", "b3")
Fuel <- colnames(cdata)
Factor <- names(factordata)
## run EDA model
eda1 <- EDA(cdata, factordata, Year = Year, Factor = Factor, 
    Fuel = Fuel, Sector = Sector, method = "LMDI")
eda1
plot(eda1)




