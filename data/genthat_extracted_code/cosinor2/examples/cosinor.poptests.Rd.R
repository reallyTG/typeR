library(cosinor2)


### Name: cosinor.poptests
### Title: Comparison of Cosinor Parameters of Two Populations
### Aliases: cosinor.poptests

### ** Examples

fit.extraverts<-population.cosinor.lm(data = PA_extraverts, time = PA_time,
period = 24)
fit.introverts<-population.cosinor.lm(data = PA_introverts, time = PA_time,
period = 24)
cosinor.poptests(pop1 = fit.extraverts, pop2 = fit.introverts)



