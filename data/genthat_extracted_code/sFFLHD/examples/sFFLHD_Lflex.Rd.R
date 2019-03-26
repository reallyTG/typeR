library(sFFLHD)


### Name: sFFLHD_Lflex
### Title: sFFLHD with flexible L
### Aliases: sFFLHD_Lflex
### Keywords: datasets

### ** Examples

s <- sFFLHD_Lflex$new(D=8,L=4)
s$get.batch()
# sFFLHD(D=7,L=10)$get.batch() doesn't work, needs L=7,8,9,11
s <- sFFLHD_Lflex$new(D=7,L=10) # Uses L=9
s$get.batch()
s <- sFFLHD_Lflex$new(D=7,L=10, prefer_L="up") # Should use 11



