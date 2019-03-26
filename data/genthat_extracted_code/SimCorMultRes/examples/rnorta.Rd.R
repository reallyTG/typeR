library(SimCorMultRes)


### Name: rnorta
### Title: Simulating Random Vectors using the NORTA Method
### Aliases: rnorta

### ** Examples

## An example with standard logistic as marginal distribution.
set.seed(1)
R <- 1000
LatentCorrelation <- toeplitz(c(1, rep(0.8, 2)))
LatentCorrelation
CommonMarginals <- rep('qlogis', 3)
SimLogistic <- rnorta(R = R, cor.matrix = LatentCorrelation, distr = CommonMarginals)

## The following lines exemplify the NORTA method.
set.seed(1)
SimNormal <- rsmvnorm(R = R, cor.matrix = LatentCorrelation)
all(SimLogistic == qlogis(pnorm(SimNormal)))

## Change the marginal distributions to standard normal, standard
## logistic and standard extreme value distribution.
set.seed(1)
DiffMarginals <- c('qnorm', 'qlogis', 'qgumbel')
SimDiffMars <- rnorta(R = R, cor.matrix = LatentCorrelation, distr = DiffMarginals)
cor(SimDiffMars)
colMeans(SimDiffMars)
apply(SimDiffMars, 2, sd)

## Same as above but using parameter values other than the default ones.
set.seed(1)
qpars <- list(c(mean = 1, sd = 9), c(location = 2, scale = 1), c(loc = 3,
    scale = 1))
SimDiffMars2 <- rnorta(R = R, cor.matrix = LatentCorrelation, distr = DiffMarginals,
    qparameters = qpars)
cor(SimDiffMars2)
colMeans(SimDiffMars2)
apply(SimDiffMars2, 2, sd)



