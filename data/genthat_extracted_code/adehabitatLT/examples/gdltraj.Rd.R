library(adehabitatLT)


### Name: gdltraj
### Title: Working with Trajectories: Specify a Time Period
### Aliases: gdltraj
### Keywords: spatial

### ** Examples

data(puechcirc)
plot(puechcirc, perani = FALSE)

## Gets all the relocations collected
## between midnight and 3H AM 
toto <- gdltraj(puechcirc, min = 0, max = 3, type="hour")
plot(toto, perani = FALSE)

## Gets all relocations collected between the 15th
## and the 25th august 1993
lim <- as.POSIXct(strptime(c("15/08/1993", "25/08/1993"),
                  "%d/%m/%Y", tz="Europe/Paris"))
tutu <- gdltraj(puechcirc, min = lim[1],
                max = lim[2], type="POSIXct")
plot(tutu, perani = FALSE)




