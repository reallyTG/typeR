library(simsem)


### Name: generate
### Title: Generate data using SimSem template
### Aliases: generate

### ** Examples

loading <- matrix(0, 6, 2)
loading[1:3, 1] <- NA
loading[4:6, 2] <- NA
LY <- bind(loading, 0.7)

latent.cor <- matrix(NA, 2, 2)
diag(latent.cor) <- 1
RPS <- binds(latent.cor, 0.5)

RTE <- binds(diag(6))

VY <- bind(rep(NA,6),2)

CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType = "CFA")

dat <- generate(CFA.Model, 200)

# Get the latent variable scores

dat2 <- generate(CFA.Model, 20, sequential = TRUE, saveLatentVar = TRUE)
dat2
attr(dat2, "latentVar")



