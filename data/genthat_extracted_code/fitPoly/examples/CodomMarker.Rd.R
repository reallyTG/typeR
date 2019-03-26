library(fitPoly)


### Name: CodomMarker
### Title: Function to fit a multiple mixture model to a vector of signal
###   ratios of a single bi-allelic marker
### Aliases: CodomMarker

### ** Examples

data(fitPoly_data)
mrkdat <- fitPoly_data$ploidy6$dat6x[fitPoly_data$ploidy6$dat6x$MarkerName == "mrk001",]

# hexaploid, without specified populations
cdm <- CodomMarker(mrkdat$ratio, ng=7)
names(cdm)

# hexaploid, with specified populations (4 F1 populations and a cultivar panel)
# first set the ptype for each population: p.F1 for F1 populations,
# p.HW for the panel, p.free for the F1 parents
ptype <- rep("p.HW", nrow(fitPoly_data$ploidy6$pop.parents))
ptype[!is.na(fitPoly_data$ploidy6$pop.parents[,1])] <- "p.F1"
ptype[unique(fitPoly_data$ploidy6$pop.parents)] <- "p.free" #all F1 parents
cdm <- CodomMarker(y=mrkdat$ratio, ng=7,
                   pop=fitPoly_data$ploidy6$pop,
                   pop.parents=fitPoly_data$ploidy6$pop.parents,
                   mutype=5, ptype=ptype)




