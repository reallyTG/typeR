library(cosinor2)


### Name: cosinor.PR
### Title: Percent Rhythm
### Aliases: cosinor.PR

### ** Examples

fit.temperature<-cosinor.lm(Temperature~time(Time), period = 24, data = temperature_zg)
cosinor.PR(fit.temperature)

fit.november<-population.cosinor.lm(data = PANAS_november, time = PANAS_time,
period = 7)
cosinor.PR(fit.november)



