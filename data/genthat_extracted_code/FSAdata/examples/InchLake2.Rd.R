library(FSAdata)


### Name: InchLake2
### Title: Lengths and weights for fish captured in Inch Lake
### Aliases: InchLake2
### Keywords: datasets

### ** Examples

data(InchLake2)
str(InchLake2)
head(InchLake2)

## Isolate just Bluegills
bg.il <- subset(InchLake2,species=="Bluegill")

## Isolate just largemouth bass from 2007
lmb7.il <- subset(InchLake2,species=="Largemouth Bass" & year==2007)




