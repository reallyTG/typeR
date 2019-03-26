library(marelac)


### Name: convert_RtoS
### Title: Conductivity-Salinity Conversion
### Aliases: convert_RtoS
### Keywords: utilities

### ** Examples

convert_RtoS(R = 1.888091, t = 40, p = 1000)

## Salinity = 40.0000, t = 40, p = 1000, cond = 1.888091
convert_RtoS(R = 1, t = 15, p = 0)

## Check values
convert_RtoS(R = 0.6990725, t = 10, p = 0)  # 26.8609
convert_RtoS(R = 0.6990725, t = 10, p = 100)  # 26.5072
convert_RtoS(R = 1.1651206, t = 20, p = 100)  # 36.3576




