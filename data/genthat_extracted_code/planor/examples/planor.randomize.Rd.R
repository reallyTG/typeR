library(planor)


### Name: planor.randomize
### Title: Randomize a Factorial Design from an Orthogonal Block Structure
### Aliases: planor.randomize
### Keywords: design

### ** Examples

### Block design
Design <- data.frame(block=rep(1:4,rep(2,4)),
   treatment=c("A1","B1","A2","B2","A3","B3","A4","B4"))
### No within-block randomization
planor.randomize(~block, data=Design)
### Blocks and units within blocks randomization     
planor.randomize(~block/UNITS, data=Design) 
### Row-Column design
RowColDes <- data.frame(row=rep(1:3,rep(3,3)),col=rep(1:3,3),
treatment=LETTERS[c(1:3,2,3,1,3,1,2)],
oldRow=rep(1:3,rep(3,3)),oldCol=rep(1:3,3))
planor.randomize(~row*col, data=RowColDes)


