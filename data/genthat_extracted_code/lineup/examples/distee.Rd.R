library(lineup)


### Name: distee
### Title: Calculate distance between two gene expression data sets
### Aliases: distee
### Keywords: utilities

### ** Examples


# load the example data
data(expr1, expr2)
## Don't show: 
expr1 <- expr1[,1:100]; expr2 <- expr2[,1:100]
## End(Don't show)

# find samples in common
id <- findCommonID(expr1, expr2)

# calculate correlations between cols of x and cols of y
thecor <- corbetw2mat(expr1[id$first,], expr2[id$second,])

# subset at genes with corr > 0.8 and scale values
expr1s <- expr1[,thecor > 0.8]/1000
expr2s <- expr2[,thecor > 0.8]/1000

# calculate distance (using "RMS difference" as a measure)
d1 <- distee(expr1s, expr2s, d.method="rmsd", labels=c("1","2"))

# calculate distance (using "correlation" as a measure...really similarity)
d2 <- distee(expr1s, expr2s, d.method="cor", labels=c("1", "2"))

# pull out the smallest 8 self-self correlations
sort(pulldiag(d2))[1:8]

# summary of results
summary(d1)
summary(d2)

# plot histograms of RMS distances
plot(d1)

# plot histograms of correlations
plot(d2)

# plot distances against one another
plot2dist(d1, d2)




