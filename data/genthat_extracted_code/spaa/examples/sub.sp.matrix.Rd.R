library(spaa)


### Name: sub.sp.matrix
### Title: Subset species matrix according to relative frequency
### Aliases: sub.sp.matrix
### Keywords: sub matrix frequency

### ** Examples


library(vegan)
data(BCI)
## Select the species whose relative frequency 
## more than 0.5, from BCI data 
sub <- sub.sp.matrix(BCI, freq = 0.5)
## Select the top 30 species according to relative frequency 
sub <- sub.sp.matrix(BCI, common = 30)



