library(GRAPE)


### Name: getPathwayScores
### Title: Calculate Pathway Scores
### Aliases: getPathwayScores

### ** Examples

## Toy example: 50 reference samples
set.seed(10);
refmat <- matrix(rnorm(5*50),nrow=5,ncol=50); rownames(refmat) <- paste0("g",1:5)
### make g2 and g5 larger in refmat
refmat[2,] <- rnorm(50,3,2); refmat[5,] <- rnorm(50,4,4)
### 15 new samples
newmat <- matrix(rnorm(5*15),nrow=5,ncol=15); rownames(newmat) <- paste0("g",1:5)
### make g2 and g3 larger in newmat
newmat[2,] <- rnorm(15,2,3); newmat[3,] <- rnorm(15,4,3)
ps_new <- getPathwayScores(refmat,newmat) ### get pathway scores of new samples
ps_ref <- getPathwayScores(refmat,refmat) ### get pathway scores of reference samples
ps_both <- getPathwayScores(refmat,cbind(refmat,newmat)) ### get pathway scores of both
# > ps_new
# [1]  6.2720  8.5696  9.9904  6.9056  3.7824  8.9344 13.0880 10.2912  3.7824
# 0.0384 13.1136  6.8032  4.8512 12.8512 10.2912



