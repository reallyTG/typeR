library(attribrisk)


### Name: attribrisk
### Title: Calculate attributable risk estimates for one or more exposure
###   characteristics.
### Aliases: attribrisk

### ** Examples


data(benichou)

# Use the Benichou (1991) data to estimate attributable risk of oesophageal
# cancer due to alcohol greater than or equal to 80g/day 
attribrisk(cases ~ expos(alcohol80), data=benichou)



