library(nbpMatching)


### Name: subsetMatches
### Title: Subset Matches
### Aliases: subsetMatches subsetMatches,nonbimatch-method

### ** Examples


df <- data.frame(id=LETTERS[1:25], val1=rnorm(25), val2=rnorm(25))
df.dist <- gendistance(df, idcol=1, ndiscard=4)
df.mdm <- distancematrix(df.dist)
df.match <- nonbimatch(df.mdm)
subsetMatches(df.match)
subsetMatches(df.match, halvesOnly=FALSE)
subsetMatches(df.match, phantom=FALSE)




