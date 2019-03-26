library(sommer)


### Name: overlay
### Title: Overlay Matrix
### Aliases: overlay

### ** Examples

  
####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples
####=========================================####
data("DT_halfdiallel")
head(DT)
DT$femalef <- as.factor(DT$female)
DT$malef <- as.factor(DT$male)
DT$genof <- as.factor(DT$geno)

A <- diag(7); colnames(A) <- rownames(A) <- 1:7;A # if you want to provide a covariance matrix
#### model using overlay
modh <- mmer(sugar~1, 
             random=~vs(overlay(femalef,malef), Gu=A) 
                     + genof,
              data=DT)




