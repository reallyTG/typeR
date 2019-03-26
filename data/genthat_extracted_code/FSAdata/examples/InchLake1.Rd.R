library(FSAdata)


### Name: InchLake1
### Title: Lengths for all fish captured in Inch Lake, WI, in two years
### Aliases: InchLake1
### Keywords: datasets

### ** Examples

data(InchLake1)
str(InchLake1)
head(InchLake1)

## Isolate just Bluegills
bg.il <- subset(InchLake1,species=="Bluegill")

## Isolate just largemouth bass from 2007
lmb7.il <- subset(InchLake1,species=="Largemouth Bass" & year==2007)

## Isolate all fish captured in seines
seine.il <- subset(InchLake1,netType=="seine")




