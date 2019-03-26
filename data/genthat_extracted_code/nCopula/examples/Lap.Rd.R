library(nCopula)


### Name: Lap
### Title: LST of a Node
### Aliases: Lap

### ** Examples


structure <- GEO(0.1, NULL, list(GAMMA(0.1, 1:2, NULL),
                           GAMMA(0.2, 3:4, NULL)))

Lap(c(0,2), structure, outVar = 'z', par = 'value')




