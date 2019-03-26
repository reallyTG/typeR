library(mirt)


### Name: testinfo
### Title: Function to calculate test information
### Aliases: testinfo
### Keywords: information

### ** Examples


dat <- expand.table(deAyala)
(mirt(dat, 1, '2PL', pars = 'values'))
mod <- mirt(dat, 1, '2PL', constrain = list(c(1,5,9,13,17)))

Theta <- matrix(seq(-4,4,.01))
tinfo <- testinfo(mod, Theta)
plot(Theta, tinfo, type = 'l')

## Not run: 
##D 
##D #compare information loss between two tests
##D tinfo_smaller <- testinfo(mod, Theta, which.items = 3:5)
##D 
##D #removed item informations
##D plot(Theta, iteminfo(extract.item(mod, 1), Theta), type = 'l')
##D plot(Theta, iteminfo(extract.item(mod, 2), Theta), type = 'l')
##D 
##D #most loss of info around -1 when removing items 1 and 2; expected given item info functions
##D plot(Theta, tinfo_smaller - tinfo, type = 'l')
##D 
##D 
## End(Not run)



