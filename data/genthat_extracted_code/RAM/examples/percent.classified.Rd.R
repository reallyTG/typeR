library(RAM)


### Name: percent.classified
### Title: Calculate Percent of OTUs Classified at a Given Taxonomic Rank
### Aliases: percent.classified
### Keywords: manip

### ** Examples

data(ITS1, ITS2)
data <- list(ITS1=ITS1, ITS2=ITS2)
# find what percent of OTUs classified at family and genus 
# levels 
percent.classified(data=data, ranks=c("f","g"))



