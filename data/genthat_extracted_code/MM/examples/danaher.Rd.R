library(MM)


### Name: danaher
### Title: Dataset due to Danaher
### Aliases: danaher
### Keywords: datasets

### ** Examples

data(danaher)
Lindsey_MB(danaher)

# Dataset from table 3 follows; see also the example at Lindsey.Rd
mags <-
c(2463, 35, 44, 14, 16, 7, 262, 20, 2, 2, 0, 0, 0, 2, 17, 2,
0, 2, 0, 0, 3, 8, 0, 0, 1, 0, 0, 4, 8, 0, 1, 1, 0, 0, 3, 3,
0, 0, 0, 0, 0, 1, 52, 2, 1, 0, 2, 0, 22)
dim(mags) <- c(7,7)
mags <- as.Oarray(mags,offset=0)
dimnames(mags) <- 
list(AA=as.character(0:6),Sig=as.character(0:6))  # messy kludge in Lindsey_MB()
summary(Lindsey_MB(mags))




