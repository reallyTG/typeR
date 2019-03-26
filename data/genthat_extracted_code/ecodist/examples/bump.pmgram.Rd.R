library(ecodist)


### Name: bump.pmgram
### Title: Nine-bump spatial pattern
### Aliases: bump.pmgram
### Keywords: datasets

### ** Examples

data(bump)

par(mfrow=c(1, 2))
image(bump, col=gray(seq(0, 1, length=5)))

z <- as.vector(bump)
x <- rep(1:25, times=25)
y <- rep(1:25, each=25)

X <- col(bump)
Y <- row(bump)
# calculate dissimilarities for data and space
geo.dist <- dist(cbind(as.vector(X), as.vector(Y)))
value.dist <- dist(as.vector(bump))

### pgram() is time-consuming, so this was generated
### in advance and saved.
### set.seed(1234)
### bump.pmgram <- pmgram(value.dist, geo.dist, nperm=10000)
### save(bump.pmgram, file="ecodist/data/bump.pmgram.rda")

data(bump.pmgram)
plot(bump.pmgram)




