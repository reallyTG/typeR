library(lineup)


### Name: subset.lineupdist
### Title: Subsetting distance matrix
### Aliases: subset.lineupdist [.lineupdist [.lineupdist
### Keywords: manip

### ** Examples

data(expr1, expr2)
## Don't show: 
expr1 <- expr1[,1:100]; expr2 <- expr2[,1:100]
## End(Don't show)

# find samples in common
id <- findCommonID(expr1, expr2)

# calculate correlations between cols of x and cols of y
thecor <- corbetw2mat(expr1[id$first,], expr2[id$second,])

expr1s <- expr1[,thecor > 0.8]/1000
expr2s <- expr2[,thecor > 0.8]/1000

# calculate correlations among samples
d <- distee(expr1s, expr2s, d.method="cor")

# pull out distances for samples 24, 92, 44, 66
samp <- c("24", "92", "44", "66")
d[samp, samp]




