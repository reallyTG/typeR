library(marelac)


### Name: convert_StoR
### Title: Salinity-Conductivity Conversion
### Aliases: convert_StoR
### Keywords: utilities

### ** Examples

convert_StoR(S = 40, t = 40, p = 1000)

convert_StoR(S = 35, t = 15, p = 0)

# Check values:
convert_StoR(S = 25, t = 10, p = 0)    #  0.654990
convert_StoR(S = 25, t = 10, p = 100)  #  0.662975
convert_StoR(S = 25, t = 10, p = 1000) #  0.712912

convert_StoR(S = 35, t = 10, p = 100) #  0.897778
convert_StoR(S = 40, t = 10, p = 100) #  1.011334




