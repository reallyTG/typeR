library(TransP)


### Name: nwc
### Title: Implements North-West Corner Algorithm to solve transportation
###   problem
### Aliases: nwc

### ** Examples

## Not run: 
##D 
##D #Input matrix where last row is the Demand and last column is the Supply
##D ex_matrix=data.frame(M1=c(13,10,25,17,210),M2=c(25,19,10,24,240),
##D                      M3=c(8,18,15,18,110),M4=c(13,5,14,13,80),M5=c(20,12,18,19,170),
##D                      Supply=c(430,150,100,130,810),
##D                      row.names = c("W1","W2","W3","W4","Demand"))
##D 
##D ex_matrix
##D          M1  M2  M3 M4  M5 Supply
##D W1      13  25   8 13  20    430
##D W2      10  19  18  5  12    150
##D W3      25  10  15 14  18    100
##D W4      17  24  18 13  19    130
##D Demand 210 240 110 80 170    810
##D 
##D nwc(ex_matrix)
##D $Alloc_Matrix
##D     M1  M2  M3 M4  M5
##D W1 210 220   0  0   0
##D W2   0  20 110 20   0
##D W3   0   0   0 60  40
##D W4   0   0   0  0 130
##D 
##D $Total_Cost
##D [1] 14720
##D 
## End(Not run)




