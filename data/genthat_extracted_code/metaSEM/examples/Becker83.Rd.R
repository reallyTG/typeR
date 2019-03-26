library(metaSEM)


### Name: Becker83
### Title: Studies on Sex Differences in Conformity Reported by Becker
###   (1983)
### Aliases: Becker83
### Keywords: datasets

### ** Examples

data(Becker83)

## Random-effects meta-analysis
summary( meta(y=di, v=vi, data=Becker83) )

## Mixed-effects meta-analysis with log(items) as the predictor
summary( meta(y=di, v=vi, x=log(items), data=Becker83) )



