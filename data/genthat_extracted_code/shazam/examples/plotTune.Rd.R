library(shazam)


### Name: plotTune
### Title: Visualize parameter tuning for minNumMutations and
###   minNumSeqMutations
### Aliases: plotTune

### ** Examples

## No test: 
# Subset example data to one isotype and sample as demos
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgA")

tuneMtx = list()
for (i in 1:length(unique(db$SAMPLE))) {
    # Get data corresponding to current sample
    curDb = db[db$SAMPLE==unique(db$SAMPLE)[i], ]
    
    # Count the number of mutations per 5-mer
    subCount = createSubstitutionMatrix(db=curDb, model="S", multipleMutation="independent",
                                        returnModel="5mer", numMutationsOnly=TRUE)
    
    # Tune over minNumMutations = 5..50
    subTune = minNumMutationsTune(subCount, seq(from=5, to=50, by=5))
    
    tuneMtx = c(tuneMtx, list(subTune))
}

# Name tuneMtx after sample names 
names(tuneMtx) = unique(db$SAMPLE)

# plot with legend for both samples for a subset of minNumMutations values
plotTune(tuneMtx, thresh=c(5, 15, 25, 40), criterion="3mer",
         pchs=16:17, ltys=1:2, cols=2:3, 
         plotLegend=TRUE, legendPos=c(5, 100))

# plot for only 1 sample for all the minNumMutations values (no legend)
plotTune(tuneMtx[[1]], thresh=seq(from=5, to=50, by=5), criterion="3mer")
## End(No test)




