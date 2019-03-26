library(vcd)


### Name: VonBort
### Title: Von Bortkiewicz Horse Kicks Data
### Aliases: VonBort
### Keywords: datasets

### ** Examples

data("VonBort")
## HorseKicks data
xtabs(~ deaths, data = VonBort, subset = fisher == "yes")



