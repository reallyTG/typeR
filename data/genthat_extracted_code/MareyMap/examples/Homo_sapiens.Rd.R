library(MareyMap)


### Name: Homo_sapiens
### Title: The marey map for the species Homo sapiens (female, male and
###   mean of the two)
### Aliases: Homo_sapiens_female Homo_sapiens_male Homo_sapiens_mean
### Keywords: datasets

### ** Examples

data(Homo_sapiens_female)
map <- Homo_sapiens_female[["Chromosome 01"]]
plot(map)
names(Homo_sapiens_female@maps)



