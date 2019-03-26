library(ChemoSpec)


### Name: aov_pcaSpectra
### Title: ANOVA-PCA Analysis of Spectra Data
### Aliases: aov_pcaSpectra
### Keywords: htest multivariate

### ** Examples


data(metMUD2)

# Original factor encoding:
levels(metMUD2$groups)

# Split those original levels into 2 new ones (re-code them)
new.grps <- list(geneBb = c("B", "b"), geneCc = c("C", "c"))
mM3 <- splitSpectraGroups(metMUD2, new.grps)

# run aov_pcaSpectra
mats <-aov_pcaSpectra(mM3, fac = c("geneBb", "geneCc"))
apca1 <- aovPCAscores(mM3, mats, plot = 1, main = "aovPCA: B vs b", ellipse = "cls")
apca2 <- aovPCAscores(mM3, mats, plot = 2, main = "aovPCA: C vs c")
apca3 <- aovPCAscores(mM3, mats, plot = 3, main = "aovPCA: Interaction Term")
apca4 <- aovPCAloadings(spectra = mM3, LM = mats, pca = apca1,
  main = "aov_pcaSpectra: Bb Loadings")




