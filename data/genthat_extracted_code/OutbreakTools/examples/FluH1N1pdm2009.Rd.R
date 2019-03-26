library(OutbreakTools)


### Name: FluH1N1pdm2009
### Title: Dataset from the 2009 influenza A/H1N1 pandemic
### Aliases: FluH1N1pdm2009
### Keywords: datasets

### ** Examples

## load the dataset
data(FluH1N1pdm2009)
attach(FluH1N1pdm2009)

head(individuals)
head(samples)


## create obkData object
x <- new("obkData", individuals = individuals, dna = FluH1N1pdm2009$dna,
      dna.individualID = samples$individualID, dna.date = samples$date,
      trees = FluH1N1pdm2009$trees)

## have a look at the summary
summary(x)

## plot the phylogeny
plotggphy(x, tip.color="location")

p <- plotggphy(x, ladderize = TRUE, branch.unit = "year")
p

detach(FluH1N1pdm2009)





