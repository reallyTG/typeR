library(IQCC)


### Name: cchart.R
### Title: R control chart
### Aliases: cchart.R

### ** Examples


data(pistonrings)
attach(pistonrings)
cchart.R(pistonrings[1:25,], 5)
cchart.R(pistonrings[26:40, ], 5, type = "tukey", pistonrings[1:25, ])




