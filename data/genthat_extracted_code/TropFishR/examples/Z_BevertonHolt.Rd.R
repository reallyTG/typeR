library(TropFishR)


### Name: Z_BevertonHolt
### Title: Beverton & Holt's Z-Equations
### Aliases: Z_BevertonHolt
### Keywords: Z function mortality

### ** Examples

# based on length-frequency data
data(synLFQ2)
Z_BevertonHolt(synLFQ2, catch_columns = 2, Lprime_tprime = 47.5)

# based on age composition data
data(synCAA1)
Z_BevertonHolt(synCAA1, catch_columns = 3, Lprime_tprime = 2.5)




