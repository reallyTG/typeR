library(jmotif)


### Name: find_discords_hotsax
### Title: Finds a discord (i.e. time series anomaly) with HOT-SAX. Usually
###   works the best with lower sizes of discretization parameters: PAA and
###   Alphabet.
### Aliases: find_discords_hotsax

### ** Examples

discords = find_discords_hotsax(ecg0606, 100, 3, 3, 0.01, 1)
plot(ecg0606, type = "l", col = "cornflowerblue", main = "ECG 0606")
lines(x=c(discords[1,2]:(discords[1,2]+100)),
   y=ecg0606[discords[1,2]:(discords[1,2]+100)], col="red")



