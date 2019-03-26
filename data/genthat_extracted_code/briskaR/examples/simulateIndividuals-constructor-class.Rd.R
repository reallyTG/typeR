library(briskaR)


### Name: simulateIndividuals
### Title: Wrapper function SimulateIndividuals
### Aliases: simulateIndividuals

### ** Examples

data(maize_65)
nb_ind=100 ; time_min=1 ; time_max=61
birth_dates=sample(time_min:time_max, size=nb_ind, replace=TRUE)
life_expectancies=rep(20, nb_ind)
toxic_gap=rep(15, nb_ind)
## generate exposed individuals
ind=simulateIndividuals(maize.landscape, n=nb_ind, mintime=time_min,
                        maxtime=time_max, dob=birth_dates,
                        life_duration=life_expectancies, toxic_threshold=toxic_gap)
plot(maize.landscape,ind)



