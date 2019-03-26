library(impimp)


### Name: rbindimpimp
### Title: Combine impimp Objects
### Aliases: rbindimpimp
### Keywords: datagen

### ** Examples

A <- data.frame(x1 = c(1,0), x2 = c(0,0),
                y1 = c(1,0), y2 = c(2,2))
B <- data.frame(x1 = c(1,1,0), x2 = c(0,0,0),
                z1 = c(0,1,1), z2 = c(0,1,2))
impA <- impimp(A, B, method = "case_wise")
impB <- impimp(B, A, method = "case_wise")
rbindimpimp(impA, impB)




