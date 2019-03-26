library(sommer)


### Name: DT_halfdiallel
### Title: half diallel data for corn hybrids
### Aliases: DT_halfdiallel
### Keywords: datasets

### ** Examples


####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples
####=========================================####

data(DT_halfdiallel)
head(DT)

####=========================================####
####=========================================####
DT$femalef <- as.factor(DT$female)
DT$malef <- as.factor(DT$male)
DT$genof <- as.factor(DT$geno)
#### model using overlay
modh <- mmer(sugar~1, 
              random=~vs(overlay(femalef,malef)) + genof,
              rcov=~units,
              data=DT)
summary(modh)
#### model using overlay and covariance structures

A <- diag(7); A[1,2] <- 0.5; A[2,1] <- 0.5 # fake covariance structure
colnames(A) <- as.character(1:7); rownames(A) <- colnames(A);A

modh2 <- mmer(sugar~1, 
              random=~ vs(overlay(female,male),Gu=A) + geno,
              data=DT)
summary(modh2)




