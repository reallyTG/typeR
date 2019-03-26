library(circglmbayes)


### Name: plot_meanboxplot.circGLM
### Title: Plot mean comparison boxplot from circGLM objects
### Aliases: plot_meanboxplot.circGLM

### ** Examples

dat <- generateCircGLMData(nconpred = 0)
m   <- circGLM(th ~ ., dat)
plot_meancompare.circGLM(m)



