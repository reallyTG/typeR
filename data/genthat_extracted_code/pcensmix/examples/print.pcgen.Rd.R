library(pcensmix)


### Name: print.pcgen
### Title: Print Method for pcgen Objects
### Aliases: print.pcgen

### ** Examples

## Generate a two component normal mixture data,
Pdat <- pcgen(r = 80, p = 0.3, data = mixgen(N = 100, dist1 = 'norm',
              dist2 = 'norm', control = list(12, 2, 14, 4, 0.3)))
# and print it.
print(Pdat)




