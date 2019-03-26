library(ACSWR)


### Name: Mucociliary
### Title: Mucociliary Clearance
### Aliases: Mucociliary
### Keywords: Kruskal-Walis test

### ** Examples

data(Mucociliary)
Mucociliary$Rank <- rank(Mucociliary$Time)
aggregate(Mucociliary$Rank,by=list(Mucociliary$Treatment),sum)
kruskal.test(Time~Treatment,data=Mucociliary)



