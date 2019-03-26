library(spaa)


### Name: plotlowertri
### Title: Plotting lower semi matrix
### Aliases: plotlowertri
### Keywords: lower matrix semimatrix

### ** Examples

data(testdata)
spmatrix <- data2mat(testdata)
result <- sp.pair(spmatrix)

## Check the legend for 0.00 to 0.33 (Unwanted label)
plotlowertri(result$Pearson, int = 0.5, cex=1.5)
title("Pearson Correlation Lower Matrix Plot")

## Change the size of points and reset the intervals.
## Warning: The lower matrix plot illustrating Pearson 
## Correlation between each pair of species. Note the 
## triangle didn't appeared in the plots, but have been 
## added to the legend. This is due to the distribution 
## of data. Be careful in selection of intervals.


plotlowertri(result$Pearson, int = 0.5, cex=1.5, 
interval = 4, pchlist = c(19, 17, 15, 1, 5), size = TRUE)

title("Pearson Correlation Lower Matrix Plot")

## "Pure" dots, may have to add legend manually...
plotlowertri(result$Pearson, int = 0.5, cex=2.5, 
interval = 4, pchlist = rep(19, 5), size = TRUE, 
show.legend = FALSE)

title("Pearson Correlation Lower Matrix Plot")


## Using BCI data
library(vegan)
data(BCI)
## select the top 30 species according to relative frequency.
sub <- sub.sp.matrix(BCI, common = 30)
## Original 
plotlowertri(cor(sub))

## Change size
plotlowertri(cor(sub), size = TRUE, cex = 3)

## Set the digits to 1
plotlowertri(cor(sub), size = TRUE, cex = 3, digits = 1,
ncex = 0.7)





