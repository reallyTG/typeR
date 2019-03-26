library(kpeaks)


### Name: rmshoulders
### Title: Shoulders Removal in Frequency Polygons
### Aliases: rmshoulders

### ** Examples

# Build a data vector with three peaks
x1 <-rnorm(100, mean=20, sd=5)
x2 <-rnorm(50, mean=50, sd=5)
x3 <-rnorm(150, mean=90, sd=10)
x <- c(x1,x3,x2)

# generate the frequency polygon and histogram of x by using Doane rule
hvals <- genpolygon(x, binrule="doane")
plotpolygon(x, nbins=hvals$nbins, ptype="p")

# find the peaks in frequency polygon of x by using the default threshold frequency
resfpp <- findpolypeaks(xm=hvals$mids, xc=hvals$freqs)
print(resfpp)

# remove the shoulders with the threshold distance option 'avg'
resrs <- rmshoulders(resfpp$pm[,1], resfpp$pm[,2], trmethod = "avg")
print(resrs)

# remove the shoulders with the threshold distance option 'iqr'
resrs <- rmshoulders(resfpp$pm[,1], resfpp$pm[,2], trmethod = "iqr")
print(resrs)

data(x5p4c)
# plot the frequnecy polygon and histogram of p2 in x5p4c data set 
hvals <- genpolygon(x5p4c$p2, binrule="usr", nbins=30)
plotpolygon(x5p4c$p2, nbins=hvals$nbins, ptype="ph")

# find the peaks in frequency polygon of p2 
resfpp <- findpolypeaks(xm=hvals$mids, xc=hvals$freqs, tcmethod = "min")
print(resfpp)

# remove the shoulders with threshold distance option 'q1'
resrs <- rmshoulders(resfpp$pm[,1], resfpp$pm[,2], trmethod = "q1")
print(resrs)

## Not run: 
##D data(iris)
##D # plot the frequency polygon and histogram of Petal.Length in iris data set 
##D # by using a user-defined class number 
##D hvals <- genpolygon(iris$Petal.Length, binrule="usr", nbins=30)
##D plotpolygon(iris$Petal.Length, nbins=hvals$nbins, ptype="p")
##D 
##D # find the peaks in frequency polygon of Petal.Length with default 
##D # threshold frequency value
##D resfpp <- findpolypeaks(xm=hvals$mids, xc=hvals$freqs)
##D print(resfpp)
##D 
##D # remove the shoulders with threshold option 'med'
##D resrs <- rmshoulders(resfpp$pm[,1], resfpp$pm[,2], trmethod = "med")
##D print(resrs)
## End(Not run)



