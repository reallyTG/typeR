library(spaa)


### Name: niche.overlap.boot
### Title: Boostrap of niche overlap
### Aliases: niche.overlap.boot
### Keywords: niche bootstrap overlap

### ** Examples


data(datasample)
niche.overlap.boot(datasample[,1:4], method = "pianka")
niche.overlap.boot(datasample[,1:4], method = "schoener")
niche.overlap.boot(datasample[,1:4], method = "czech") 
niche.overlap.boot(datasample[,1:4], method = "levins")



