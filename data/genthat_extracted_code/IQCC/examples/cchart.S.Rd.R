library(IQCC)


### Name: cchart.S
### Title: S Control Chart.
### Aliases: cchart.S

### ** Examples


data(softdrink)
#S chart with normalized probability limits
cchart.S(softdrink, type = "n")
#S chart with exact probability limits
cchart.S(softdrink, type = "e", 10)




