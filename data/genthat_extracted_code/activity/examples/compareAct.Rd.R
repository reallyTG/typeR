library(activity)


### Name: compareAct
### Title: Compare activity level estimates
### Aliases: compareAct

### ** Examples

#Test whether paca have a sigificantly different activity level from rat.
#Bootstrap reps limited to speed up example.
data(BCItime)
tPaca <- 2*pi*BCItime$time[BCItime$species=="ocelot"]
tRat <- 2*pi*BCItime$time[BCItime$species=="rat"]
fPaca <- fitact(tPaca, sample="data", reps=10)
fRat <- fitact(tRat, sample="data", reps=10)
fPaca@act
fRat@act
compareAct(list(fPaca,fRat))



