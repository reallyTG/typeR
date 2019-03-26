library(scan)


### Name: fillmissingSC
### Title: Replacing missing measurement times in single-case data
### Aliases: fillmissingSC
### Keywords: manip

### ** Examples

## In his study, Grosche (2011) could not realize measurements each single week for 
## all participants. During the course of 100 weeks, about 20 measurements per person 
## at different times were administered.

## Fill missing values in a single-case dataset with discontinuous measurement times
Grosche2011filled <- fillmissingSC(Grosche2011)
plotSC(c(Original = Grosche2011[2], Filled = Grosche2011filled[2]))

## Fill missing values in a single-case dataset that are NA
Maggie <- rSC(d.level = 1.0)
Maggie_n <- Maggie
replace.positions <- c(10,16,18)
Maggie_n[[1]][replace.positions,"values"] <- NA
Maggie_f <- fillmissingSC(Maggie_n)
plotSC(c("original" = Maggie, "missing" = Maggie_n, "interpolated" = Maggie_f),
       marks = list(positions = replace.positions))



