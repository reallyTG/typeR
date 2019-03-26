library(fastR2)


### Name: tdf
### Title: Compute degrees of freedom for a 2-sample t-test
### Aliases: tdf

### ** Examples

data(KidsFeet, package="mosaicData")
fs <- favstats( length ~ sex, data=KidsFeet ); fs
t.test( length ~ sex, data=KidsFeet )
tdf( fs[1,'sd'], fs[2,'sd'], fs[1,'n'], fs[2,'n'])




