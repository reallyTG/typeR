library(rsm)


### Name: codata
### Title: Automobile emissions data
### Aliases: codata
### Keywords: datasets design

### ** Examples

# Create a coded dataset based on info in BH^2 Fig 11.17
CO <- as.coded.data(codata,  x1 ~ (Ethanol - 0.2)/0.1,  x2 ~ A.F.ratio - 15)
names(CO)[3] <- "CO.conc"



