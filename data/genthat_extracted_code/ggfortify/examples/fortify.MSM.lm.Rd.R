library(ggfortify)


### Name: fortify.MSM.lm
### Title: Convert 'MSwM::MSM.lm' to 'data.frame'
### Aliases: fortify.MSM.lm

### ** Examples

library(MSwM)
d <- data.frame(Data = c(rnorm(50, mean = -10), rnorm(50, mean = 10)),
                exog = cos(seq(-pi/2, pi/2, length.out = 100)))
d.mswm <- MSwM::msmFit(lm(Data ~.-1, data = d), k=2, sw=rep(TRUE, 2),
                       control = list(parallelization = FALSE))
fortify(d.mswm)



