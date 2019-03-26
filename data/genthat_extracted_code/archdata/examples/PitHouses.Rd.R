library(archdata)


### Name: PitHouses
### Title: Late Stone Age and Early Sami Iron Age Pithouses in Arctic
###   Norway
### Aliases: PitHouses
### Keywords: datasets

### ** Examples

data(PitHouses)
# Crosstabulation of Hearths with Size
PitHouses.tbl <- xtabs(~Hearths+Size, PitHouses)
PitHouses.tbl
barplot(PitHouses.tbl, ylab="Frequency", main="Arctic Norway Pithouses", beside=TRUE,
    legend.text=TRUE, args.legend=list(title="Hearths"))
barplot(prop.table(PitHouses.tbl, 2)*100, ylim=c(0, 60), main="Arctic Norway Pithouses",
    ylab="Percent", beside=TRUE, legend.text=TRUE, args.legend=list(title="Hearths"))



