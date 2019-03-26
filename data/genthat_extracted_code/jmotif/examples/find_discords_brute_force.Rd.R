library(jmotif)


### Name: find_discords_brute_force
### Title: Finds a discord using brute force algorithm.
### Aliases: find_discords_brute_force

### ** Examples

discords = find_discords_brute_force(ecg0606[1:600], 100, 1)
plot(ecg0606[1:600], type = "l", col = "cornflowerblue", main = "ECG 0606")
lines(x=c(discords[1,2]:(discords[1,2]+100)),
   y=ecg0606[discords[1,2]:(discords[1,2]+100)], col="red")



