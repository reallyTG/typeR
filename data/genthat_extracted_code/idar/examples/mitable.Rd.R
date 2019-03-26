library(idar)


### Name: mitable
### Title: Tabulate Marks in Neighbourhood of Every Point in a Point
###   Pattern
### Aliases: mitable
### Keywords: spatial

### ** Examples


# Compute number of trees of different species  within circles of several  radii r 
# around each individual maple tree in lansing woods

data(lansing)

maple<- unmark(lansing[lansing$marks=="maple"])
maple
r= c(0.05, 0.08, 0.1)

counts <- mitable(ppp1=maple, ppp2=lansing, r=r) 
dim(counts[[1]])
head(counts[[1]])





