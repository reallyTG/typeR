library(respirometry)


### Encoding: UTF-8

### Name: min_flow
### Title: Minimum flow rate to support MO2
### Aliases: min_flow

### ** Examples

min_flow(MO2 = 1000)

# What is the minimum flow rate required to maintain at least 75% air saturation in a
# respirometer with an organism(s) with an oxygen consumption rate of 1000 umol/h
# when the intake fresh water is 10 °C and 90% air saturated?
min_flow(MO2 = 1000, min_pO2 = 75, pO2_in = 90, temp = 10, sal = 0)




