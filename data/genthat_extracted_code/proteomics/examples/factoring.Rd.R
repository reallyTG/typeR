library(proteomics)


### Name: factoring
### Title: Sample design - Generating multiple factor designs from
###   one-dimensional factor
### Aliases: factoring

### ** Examples

channels <- c("X113", "X114", "X115", "X116", "X117", "X118", "X119") #, "X121")
typus     <- c(rep(c("A", "B", "C"), each=2), "reference")
treatment <- c(rep(c("I", "II"), 3), "mixed")
convmat   <- data.frame(channels=channels, typus=typus, treatment=treatment)
print(convmat)
## Not run: factoring(dwide, cvmat=convmat)



