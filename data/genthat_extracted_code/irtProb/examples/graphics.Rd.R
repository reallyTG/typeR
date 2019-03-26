library(irtProb)


### Name: graphics
### Title: Graphic Functions to Illustrate Response Curves and Parameter
###   Estimation
### Aliases: PCC
### Keywords: graphs

### ** Examples

## PCC curves grouped on a single figure
 res1 <- PCC(theta=c(-2,-2,-2),S=0, C=c(0.0, 0.1, 0.6), D=0.2,
             b=seq(-5,5,length=3000), ID=NULL, groups=TRUE,
             type=c("g","a"))
 res1
 
## PCC curves shingled on a single figure for each subject
 res2 <- PCC(theta=c(-2,-1,0),S=c(4.0,0.0, 1.0), C=c(0.0, 0.1, 0.6), D=0.2,
             b=seq(-5,5,length=3000), ID=NULL, groups=FALSE,
             type=c("g","a"))
 res2
 


