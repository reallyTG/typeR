library(imptree)


### Name: probInterval
### Title: Various method around IPIntervals
### Aliases: probInterval

### ** Examples

## Artificial vector of absolute frequencies
obs <- c(a = 1,b = 2, c = 10, d = 30, e = 5)

## probability interval by NPI, including only information on the
## mininum entropy distribution, using no entropy correction
probInterval(obs, iptype = "NPI", entropymax = FALSE)

## probability interval by IDM, including information on the
## minimum and maximum entropy distribution with s = 2 and correction
## according to 'strobl'
probInterval(obs, iptype = "IDM", correction = "strobl", s = 2)




