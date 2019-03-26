library(ChemoSpec)


### Name: hypTestScores
### Title: Conduct MANOVA using PCA Scores and Factors in a Spectra Object
### Aliases: hypTestScores
### Keywords: htest multivariate

### ** Examples


data(metMUD2)

# Original factor encoding:
levels(metMUD2$groups)

# Split those original levels into 2 new ones (re-code them)
new.grps <- list(geneBb = c("B", "b"), geneCc = c("C", "c"))
mM3 <- splitSpectraGroups(metMUD2, new.grps)

# Now do the PCA and anova
pca <- c_pcaSpectra(mM3)
hypTestScores(mM3, pca, fac = c("geneBb", "geneCc"))





