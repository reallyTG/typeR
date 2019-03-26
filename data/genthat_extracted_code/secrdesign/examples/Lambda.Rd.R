library(secrdesign)


### Name: Lambda
### Title: Expected Detections
### Aliases: Lambda Enrm minnrRSE
### Keywords: manip

### ** Examples


tr <- traps(captdata)
detector(tr) <- "multi"
msk <- make.mask(tr, buffer = 100, type = 'trapbuffer')

L <- Lambda(tr, msk, list(lambda0 = 0.2, sigma = 20), 5)
nrm <- Enrm(D = 5, tr, msk, list(lambda0 = 0.2, sigma = 20), 5)
nrm

plot(L, cov = "Lambda", dots = FALSE)
plot(tr, add = TRUE)
mtext(side = 3,  paste(paste(names(nrm), round(nrm,1)), collapse = ", "))




