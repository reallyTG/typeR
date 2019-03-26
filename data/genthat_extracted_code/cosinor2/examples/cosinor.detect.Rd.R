library(cosinor2)


### Name: cosinor.detect
### Title: Rhythm Detection Test
### Aliases: cosinor.detect

### ** Examples

fit.temperature<-cosinor.lm(Temperature~time(Time), period = 24, data = temperature_zg)
cosinor.detect(fit.temperature)

fit.november<-population.cosinor.lm(data = PANAS_november, time = PANAS_time,
period = 7)
cosinor.detect(fit.november)



