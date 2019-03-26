library(nCopula)


### Name: InvLap
### Title: Inverse LST of a Node
### Aliases: InvLap

### ** Examples


structure <- GEO(0.1, NULL, list(GAMMA(0.1, 1:2, NULL),
                           GAMMA(0.2, 3:4, NULL)))

InvLap(c(0,2), structure, outVar = 'z', par = 'value')




