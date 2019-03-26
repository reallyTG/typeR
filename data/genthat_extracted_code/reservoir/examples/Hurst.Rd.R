library(reservoir)


### Name: Hurst
### Title: Hurst coefficient estimation
### Aliases: Hurst

### ** Examples

Q_annual <- aggregate(resX$Q_Mm3) #convert monthly to annual data
Hurst(Q_annual)



