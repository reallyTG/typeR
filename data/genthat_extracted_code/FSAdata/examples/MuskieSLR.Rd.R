library(FSAdata)


### Name: MuskieSLR
### Title: Ages of Muskellunge assigned from scales and cleithra.
### Aliases: MuskieSLR
### Keywords: datasets

### ** Examples

data(MuskieSLR)
str(MuskieSLR)
head(MuskieSLR)
plot(ageS~ageC,data=MuskieSLR)
xtabs(~ageC+ageS,data=MuskieSLR)




