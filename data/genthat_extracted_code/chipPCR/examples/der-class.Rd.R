library(chipPCR)


### Name: der
### Title: Class '"der"'
### Aliases: der der-class show.der show,der-method
### Keywords: classes

### ** Examples

pcr <- AmpSim(cyc = 1:40)
res <- inder(pcr[, 1], pcr[, 2])
sums <- summary(res)
print(sums)



