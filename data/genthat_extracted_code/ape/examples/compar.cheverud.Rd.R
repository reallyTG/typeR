library(ape)


### Name: compar.cheverud
### Title: Cheverud's Comparative Method
### Aliases: compar.cheverud
### Keywords: regression

### ** Examples

### Example from Harvey and Pagel's book:
y<-c(10,8,3,4)
W <- matrix(c(1,1/6,1/6,1/6,1/6,1,1/2,1/2,1/6,1/2,1,1,1/6,1/2,1,1), 4)
compar.cheverud(y,W)
### Example from Rohlf's 2001 article:
W<- matrix(c(
  0,1,1,2,0,0,0,0,
  1,0,1,2,0,0,0,0,
  1,1,0,2,0,0,0,0,
  2,2,2,0,0,0,0,0,
  0,0,0,0,0,1,1,2,
  0,0,0,0,1,0,1,2,
  0,0,0,0,1,1,0,2,
  0,0,0,0,2,2,2,0
),8)
W <- 1/W
W[W == Inf] <- 0
y<-c(-0.12,0.36,-0.1,0.04,-0.15,0.29,-0.11,-0.06)
compar.cheverud(y,W)



