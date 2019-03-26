library(bayesPop)


### Name: pop.pyramid
### Title: Probabilistic Population Pyramid
### Aliases: pop.pyramid pop.pyramidAll pop.pyramid.bayesPop.prediction
###   pop.pyramid.bayesPop.pyramid pop.trajectories.pyramid
###   pop.trajectories.pyramidAll
###   pop.trajectories.pyramid.bayesPop.prediction
###   pop.trajectories.pyramid.bayesPop.pyramid plot.bayesPop.pyramid
###   bayesPop.pyramid get.bPop.pyramid
###   get.bPop.pyramid.bayesPop.prediction get.bPop.pyramid.data.frame
###   get.bPop.pyramid.matrix get.bPop.pyramid.list
### Keywords: hplot

### ** Examples

# pyramids for bayesPop prediction objects
##########################################
sim.dir <- file.path(find.package("bayesPop"), "ex-data", "Pop")
pred <- get.pop.prediction(sim.dir)
pop.pyramid(pred, "Netherlands", c(2045, 2010))
dev.new()
pop.trajectories.pyramid(pred, "Netherlands", c(2045, 2010, 1960), age=1:25, proportion=TRUE)
# using manual manipulation of the data: e.g. show only the prob. intervals 
pred.pyr <- get.bPop.pyramid(pred, country="Ecuador", year=2090, age=1:27)
pred.pyr$pyramid <- NULL
plot(pred.pyr)

# pyramids for user-defined data
################################
# this example dataset contains population estimates for the Washington state and King county 
# (Seattle area) in 2011
data <- read.table(file.path(find.package("bayesPop"), "ex-data", "popestimates_WAKing.txt"), 
    header=TRUE, row.names=1)
# extract data for two pyramids and put it into the right format
head(data)
WA <- data[,c("WA.male", "WA.female")]; colnames(WA) <- c("male", "female")
King <- data[,c("King.male", "King.female")]; colnames(King) <- c("male", "female")
# create and plot a bayesPop.pyramid object
pyramid <- get.bPop.pyramid(list(WA, King), legend=c("Washington", "King"))
plot(pyramid, main="Population in 2011", pyr2.par=list(height=0.7, col="violet", border="violet"))
# show data as proportions
pyramid.prop <- get.bPop.pyramid(list(WA, King), is.proportion=NA, legend=c("Washington", "King"))
pop.pyramid(pyramid.prop, main="Population in 2011 (proportions)",
    pyr1.par=list(col="lightgreen", border="lightgreen", density=30), 
    pyr2.par=list(col="darkred", border="darkred", density=50))



