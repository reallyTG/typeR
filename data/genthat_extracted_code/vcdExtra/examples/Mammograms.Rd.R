library(vcdExtra)


### Name: Mammograms
### Title: Mammogram Ratings
### Aliases: Mammograms
### Keywords: datasets

### ** Examples

data(Mammograms)
B <- agreementplot(Mammograms, main="Mammogram ratings")
# agreement measures
B
Kappa(Mammograms)

## other displays
mosaic(Mammograms, shade=TRUE)

sieve(Mammograms, pop = FALSE, shade = TRUE)
labeling_cells(text = Mammograms, gp_text = gpar(fontface = 2, cex=1.75))(as.table(Mammograms))



