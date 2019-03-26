library(demography)


### Name: smooth.demogdata
### Title: Create smooth demogdata functions
### Aliases: smooth.demogdata
### Keywords: smooth

### ** Examples

france.sm <- smooth.demogdata(extract.years(fr.mort,1980:1997))
plot(france.sm)
plot(fr.mort,years=1980,type="p",pch=1)
lines(france.sm,years=1980,col=2)



