library(apollo)


### Name: apollo_mnl
### Title: Calculates multinomial logit probabilities
### Aliases: apollo_mnl

### ** Examples

data(apollo_modeChoiceData)
x            = database
b            = list(asc_1=0, asc_2=0, asc_3=0, asc_4=0, tt=0, tc=0, acc=0)
alternatives = c(car=1, bus=2, air=3, rail=4)
avail        = list(car=x$av_car, bus=x$av_bus, air=x$av_air, rail=x$av_rail)
choiceVar    = x$choice

### List of utilities
V = list()
V[['car' ]] = b$asc_1 + b$tt*x$time_car  + b$tc*x$cost_car
V[['bus' ]] = b$asc_2 + b$tt*x$time_bus  + b$tc*x$cost_bus  + b$acc*x$access_bus
V[['air' ]] = b$asc_3 + b$tt*x$time_air  + b$tc*x$cost_air  + b$acc*x$access_air
V[['rail']] = b$asc_4 + b$tt*x$time_rail + b$tc*x$cost_rail + b$acc*x$access_rail

### Compute choice probabilities using MNL model
apollo_mnl(alternatives, avail, choiceVar, V)




