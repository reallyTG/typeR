library(ChemoSpec)


### Name: splitSpectraGroups
### Title: Create New Groups from an Existing Spectra Object
### Aliases: splitSpectraGroups
### Keywords: utilities

### ** Examples


data(metMUD2)
levels(metMUD2$groups) # original factor encoding

# Split those original levels into 2 new ones (re-code them)
new.grps <- list(geneBb = c("B", "b"), geneCc = c("C", "c"))
res <- splitSpectraGroups(metMUD2, new.grps)
str(res) # note two new elements, "geneBb" and "geneCc"
sumSpectra(res) # reports on extra elements

# Note that if you want to use a newly created group in
# plotScores and other functions to drive the color scheme
# and labeling, you'll have to update the groups element:
res$groups <- as.factor(paste(res$geneBb, res$geneCc, sep = ""))




