library(ggfortify)


### Name: autoplot.MSM.lm
### Title: Autoplot 'MSwM::MSM.lm'
### Aliases: autoplot.MSM.lm

### ** Examples

## Not run: 
##D library(MSwM)
##D d <- data.frame(Data = c(rnorm(50, mean = -10), rnorm(50, mean = 10)),
##D                 exog = cos(seq(-pi/2, pi/2, length.out = 100)))
##D d.mswm <- MSwM::msmFit(lm(Data ~.-1, data = d), k=2, sw=rep(TRUE, 2),
##D                        control = list(parallelization = FALSE))
##D autoplot(d.mswm)
## End(Not run)



