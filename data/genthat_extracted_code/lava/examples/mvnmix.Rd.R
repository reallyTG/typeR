library(lava)


### Name: mvnmix
### Title: Estimate mixture latent variable model
### Aliases: mvnmix
### Keywords: models, regression

### ** Examples


data(faithful)
set.seed(1)
M1 <- mvnmix(faithful[,"waiting",drop=FALSE],k=2)
M2 <- mvnmix(faithful,k=2)
if (interactive()) {
    par(mfrow=c(2,1))
    plot(M1,col=c("orange","blue"),ylim=c(0,0.05))
    plot(M2,col=c("orange","blue"))
}




