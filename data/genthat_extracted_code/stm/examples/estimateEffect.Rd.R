library(stm)


### Name: estimateEffect
### Title: Estimates regressions using an STM object
### Aliases: estimateEffect

### ** Examples


#Just one topic (note we need c() to indicate it is a vector)
prep <- estimateEffect(c(1) ~ treatment, gadarianFit, gadarian)
summary(prep)
plot(prep, "treatment", model=gadarianFit, method="pointestimate")

#three topics at once
prep <- estimateEffect(1:3 ~ treatment, gadarianFit, gadarian)
summary(prep)
plot(prep, "treatment", model=gadarianFit, method="pointestimate")

#with interactions
prep <- estimateEffect(1 ~ treatment*s(pid_rep), gadarianFit, gadarian)
summary(prep)



