library(hamlet)


### Name: vcaplong
### Title: Long-format data of the Castration-resistant Prostate Cancer
###   experiment using the VCaP cell line.
### Aliases: vcaplong
### Keywords: datasets

### ** Examples

data(vcaplong)

str(vcaplong)
head(vcaplong)

library(lattice)
xyplot(log2PSA ~ DrugWeek | Group, data = vcaplong, type="l", group=ID, layout=c(3,1))
xyplot(BW ~ DrugWeek | Group, data = vcaplong, type="l", group=ID, layout=c(3,1))



