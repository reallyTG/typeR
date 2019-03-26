library(sensR)


### Name: dod_fit
### Title: Direct fitter of the Thurstonian Degree-of-Difference (DOD)
###   model
### Aliases: dod_fit
### Keywords: models

### ** Examples


## DOD example data:
same.pairs <- c(25, 22, 33, 20)
diff.pairs <- c(18, 22, 30, 30)

## Fit Thurstonian dod-model and perform difference test:
fm <- dod_fit(same=same.pairs, diff=diff.pairs)
names(fm)

## Estimate d-prime for given tau:
fm <- dod_fit(same=same.pairs, diff=diff.pairs, tau=1:3)

## Estimate tau for given d-prime:
fm <- dod_fit(same=same.pairs, diff=diff.pairs, d.prime=1)

## Don't show: 

## End(Don't show)



