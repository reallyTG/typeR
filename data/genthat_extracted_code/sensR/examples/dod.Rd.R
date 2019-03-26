library(sensR)


### Name: dod
### Title: Thurstonian Degree-of-Difference (DOD) model
### Aliases: dod print.dod
### Keywords: models

### ** Examples


## DOD example data:
same.pairs <- c(25, 22, 33, 20)
diff.pairs <- c(18, 22, 30, 30)

## Fit Thurstonian dod-model and perform difference test:
dod(same=same.pairs, diff=diff.pairs)

## Can choose another test statistic (e.g. Wilcoxon):
dod(same=same.pairs, diff=diff.pairs, statistic="Wilcox")

## A similarity test (with simulated data):
set.seed(121)
(Data2 <- dodSim(d.prime=0, ncat=4, sample.size=200, method.tau="equi.prob"))
dod(same=Data2[1, ], diff=Data2[2, ], d.prime0=1.2,
    alternative="similarity")

## Extract parameters from a dod fit:
fm <- dod(same=same.pairs, diff=diff.pairs)
coef(fm)

## Don't show: 

## End(Don't show)



