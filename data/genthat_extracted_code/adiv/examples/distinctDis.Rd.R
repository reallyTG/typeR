library(adiv)


### Name: distinctDis
### Title: Dissimilarity-based Species' Originality
### Aliases: distinctDis
### Keywords: models

### ** Examples

e <- rlnorm(10)
e <- sort(e)
names(e) <- paste("s", 1:10, sep="")
d <- dist(e)
barplot(e)

D <- distinctDis(d, standardized = TRUE)

par(mfrow=c(3,1))
plot(e, D[,1], xlab="trait", ylab="Rb")
plot(e, D[,2], xlab="trait", ylab="AV")
plot(e, D[,3], xlab="trait", ylab="FV")

plot(D[,1], D[,2], xlab="Rb", ylab="AV")
plot(D[,1], D[,3], xlab="Rb", ylab="FV")
plot(D[,2], D[,3], xlab="AV", ylab="FV")
par(mfrow=c(1,1))



