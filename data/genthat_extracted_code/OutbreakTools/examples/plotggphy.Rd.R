library(OutbreakTools)


### Name: plotggphy
### Title: Function to plot phylogenies using 'ggplot2'
### Aliases: plotggphy

### ** Examples

## load the dataset
data(FluH1N1pdm2009)
attach(FluH1N1pdm2009)

x <- new("obkData", individuals = individuals, dna = FluH1N1pdm2009$dna,
      dna.individualID = samples$individualID, dna.date = samples$date,
      trees = FluH1N1pdm2009$trees)

detach(FluH1N1pdm2009)


## have a look at the summary
summary(x)

## first simple tree
p <- plotggphy(x, ladderize = FALSE)

## build tip attribute and use sample dates to scale the x-axis as date time
p <- plotggphy(x, branch.unit = "year")

## change x breaks and labels
p <- plotggphy(x, branch.unit = "year", major.breaks = "month",
       axis.date.format = "%b%Y")

## color-code tip location
p <- plotggphy(x, branch.unit = "year", show.tip=FALSE, tip.color = "location")

## change tip size and transparency
p <- plotggphy(x, branch.unit = "year", tip.color = "location",
               tip.size = 3, tip.alpha = 0.75)





