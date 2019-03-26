library(circglmbayes)


### Name: plot_meancompare.circGLM
### Title: Plot mean comparisons for a circGLM object
### Aliases: plot_meancompare.circGLM

### ** Examples

dat <- generateCircGLMData(nconpred = 0)
m   <- circGLM(th ~ ., dat)
plot_meancompare.circGLM(m)



