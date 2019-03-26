library(TE)


### Name: MasterGene
### Title: Implements the master gene model in Marchani et al (2009)
### Aliases: MasterGene

### ** Examples

# Analyze Gypsy family 24 (Nusif)
data(AetLTR)
dat <- subset(AetLTR, GroupID == 24 & !is.na(Chr))
res2 <- MasterGene(dat$Mismatch, dat$UngapedLen, plotFit=TRUE)



