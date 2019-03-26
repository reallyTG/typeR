library(shazam)


### Name: distToNearest
### Title: Distance to nearest neighbor
### Aliases: distToNearest

### ** Examples

# Subset example data to one sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, SAMPLE == "-1h")

# Use genotyped V assignments, Hamming distance, and normalize by junction length
dist <- distToNearest(db, vCallColumn="V_CALL_GENOTYPED", model="ham", 
                      first=FALSE, normalize="len")
                           
# Plot histogram of non-NA distances
p1 <- ggplot(data=subset(dist, !is.na(DIST_NEAREST))) + 
      theme_bw() + 
      ggtitle("Distance to nearest: Hamming") + 
      xlab("distance") +
      geom_histogram(aes(x=DIST_NEAREST), binwidth=0.025, 
                     fill="steelblue", color="white")
plot(p1)




