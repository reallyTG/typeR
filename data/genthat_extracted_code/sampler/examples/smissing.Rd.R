library(sampler)


### Name: smissing
### Title: Identifies number of missing points by strata between sample and
###   collected data
### Aliases: smissing

### ** Examples

alsample <- rsamp(df=albania, 544)
alreceived <- rsamp(df=alsample, 390)
smissing(sampdf=alsample, colldf=alreceived, strata=qarku, col_name=qvKod)



