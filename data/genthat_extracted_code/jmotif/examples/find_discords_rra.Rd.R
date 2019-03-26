library(jmotif)


### Name: find_discords_rra
### Title: Finds a discord with RRA (Rare Rule Anomaly) algorithm. Usually
###   works the best with higher than that for HOT-SAX sizes of
###   discretization parameters (i.e., PAA and Alphabet sizes).
### Aliases: find_discords_rra

### ** Examples

discords = find_discords_rra(ecg0606, 100, 4, 4, "none", 0.01, 1)
plot(ecg0606, type = "l", col = "cornflowerblue", main = "ECG 0606")
lines(x=c(discords[1,2]:(discords[1,2]+100)),
   y=ecg0606[discords[1,2]:(discords[1,2]+100)], col="red")



