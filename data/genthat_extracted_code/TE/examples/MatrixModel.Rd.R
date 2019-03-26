library(TE)


### Name: MatrixModel
### Title: Implements the matrix model in Promislow et al (1999)
### Aliases: MatrixModel

### ** Examples

# Analyze Gypsy family 24 (Nusif)
data(AetLTR)
dat <- subset(AetLTR, GroupID == 24 & !is.na(Chr))
res1 <- MatrixModel(dat$Mismatch, dat$UngapedLen, nsolo=450, plotFit=TRUE)



