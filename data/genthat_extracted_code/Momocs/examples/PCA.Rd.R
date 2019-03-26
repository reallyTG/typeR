library(Momocs)


### Name: PCA
### Title: Principal component analysis on Coe objects
### Aliases: PCA PCA.OutCoe PCA.OpnCoe PCA.LdkCoe PCA.TraCoe PCA.default
###   as_PCA

### ** Examples

bot.f <- efourier(bot, 12)
bot.p <- PCA(bot.f)
bot.p
plot(bot.p, morpho=FALSE)
plot(bot.p, 'type')

op <- npoly(olea, 5)
op.p <- PCA(op)
op.p
plot(op.p, 1, morpho=TRUE)

wp <- fgProcrustes(wings, tol=1e-4)
wpp <- PCA(wp)
wpp
plot(wpp, 1)

# "foreign prcomp"
head(iris)
iris.p <- prcomp(iris[, 1:4])
iris.p <- as_PCA(iris.p, iris[, 5])
class(iris.p)
plot(iris.p, 1)



