library(PopGenReport)


### Name: read.genetable
### Title: Function to convert textfiles into a genind object (the format
###   required for popgenreport)
### Aliases: read.genetable

### ** Examples


#example file with one column per loci, seperated by forwardslash
read.csv(paste(.libPaths()[1],"/PopGenReport/extdata/platypus1c.csv", sep="" ))
platy1c <- read.genetable( paste(.libPaths()[1],"/PopGenReport/extdata/platypus1c.csv"
, sep="" ), ind=1, pop=2, lat=3, long=4, other.min=5, other.max=6, oneColPerAll=FALSE, 
sep="/", )


#example file with two columns per loci
read.csv(paste(.libPaths()[1],"/PopGenReport/extdata/platypus2c.csv", sep="" ))
platy2c <- read.genetable( paste(.libPaths()[1],"/PopGenReport/extdata/platypus2c.csv",
 sep="" ), ind=1, pop=2, lat=3, long=4, other.min=5, other.max=6, oneColPerAll=TRUE)

#to get a pdf output you need to have a running Latex version installed on your system.
#run a report (with a map)
#res<- popgenreport(platy2c, mk.counts=TRUE, mk.map=TRUE, mk.allele.dist=TRUE, mk.pdf=TRUE)



