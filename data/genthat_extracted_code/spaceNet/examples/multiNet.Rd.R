library(spaceNet)


### Name: multiNet
### Title: Latent Space Models for Multivariate Networks
### Aliases: multiNet print.multiNet

### ** Examples

data(vickers)
alphaR <- alphaRef(vickers, D = 2)  # compute alpha reference value

it <- 10     # small number of iterations just for example

# 2-dimensional latent space model, no covariates
mod <- multiNet(vickers, niter = it, D = 2,
                alphaRef = alphaR)

# 2-dimensional latent space model, sex as covariate
mod <- multiNet(vickers, niter = it, D = 2,
                alphaRef = alphaR,
                covariates = sex)



