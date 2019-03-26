library(TreeBUGS)


### Name: genTraitMPT
### Title: Generate Data for Latent-Trait MPT Models
### Aliases: genTraitMPT

### ** Examples

# Example: Standard Two-High-Threshold Model (2HTM)
EQNfile <- system.file("MPTmodels/2htm.eqn", package="TreeBUGS")
rho <- matrix(c(1,.8,.2,
                .8,1,.1,
                .2,.1,1), nrow=3)
colnames(rho) <- rownames(rho) <- c("Do","Dn","g")
genDat <- genTraitMPT(N = 100,
                      numItems = c(Target=250, Lure=250),
                      eqnfile = EQNfile,
                      mean = c(Do=.7, Dn=.7, g=.5),
                      sigma =   c(Do=.3, Dn=.3, g=.15),
                      rho = rho)
head(genDat$data, 3)
plotFreq(genDat$data, eqn=EQNfile)



