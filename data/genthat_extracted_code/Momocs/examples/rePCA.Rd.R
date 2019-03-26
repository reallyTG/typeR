library(Momocs)


### Name: rePCA
### Title: "Redo" a PCA on a new Coe
### Aliases: rePCA

### ** Examples

b <- filter(bot, type=="beer")
w <- filter(bot, type=="whisky")

bf <- efourier(b, 8)
bp <- PCA(bf)

wf <- efourier(w, 8)

# and we use the "beer" PCA on the whisky coefficients
wp <- rePCA(bp, wf)

plot(wp)

plot(bp, eig=FALSE)
points(wp$x[, 1:2], col="red", pch=4)




