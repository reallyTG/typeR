library(shazam)


### Name: slideWindowTunePlot
### Title: Visualize parameter tuning for sliding window approach
### Aliases: slideWindowTunePlot

### ** Examples

# Use an entry in the example data for input and germline sequence
data(ExampleDb, package="alakazam")

# Try out thresholds of 2-4 mutations in window sizes of 3-5 nucleotides 
# on a subset of ExampleDb
tuneList <- slideWindowTune(db = ExampleDb[1:10, ], 
                           mutThreshRange = 2:4, windowSizeRange = 3:5,
                           verbose = FALSE)

# Visualize
# Plot numbers of sequences filtered without jittering y-axis values
slideWindowTunePlot(tuneList, pchs=1:3, ltys=1:3, cols=1:3, 
                    plotFiltered=TRUE, jitter.y=FALSE)
                    
# Notice that some of the lines overlap
# Jittering could help
slideWindowTunePlot(tuneList, pchs=1:3, ltys=1:3, cols=1:3,
                    plotFiltered=TRUE, jitter.y=TRUE)
                    
# Plot numbers of sequences remaining instead of filtered
slideWindowTunePlot(tuneList, pchs=1:3, ltys=1:3, cols=1:3, 
                    plotFiltered=FALSE, jitter.y=TRUE, 
                    legendPos="bottomright")
                    
# Plot percentages of sequences filtered with a tiny amount of jittering
slideWindowTunePlot(tuneList, pchs=1:3, ltys=1:3, cols=1:3,
                    plotFiltered=TRUE, percentage=TRUE, 
                    jitter.y=TRUE, jitter.y.amt=0.01)
                                                            



