library(paleoMAS)


### Name: filter.p
### Title: Filter for Presence and Persistence
### Aliases: filter.p
### Keywords: manip

### ** Examples

#For a minimum presence of 2 percent in 20 percent of the samples
data(quexilper)
filter.p(quexilper)
quexilfil<-filter.p(quexilper,presen=2,persist=0.2)
#Filtered database
quexilfil$filtered



