library(freqweights)


### Name: tablefreq
### Title: Create a table of frequencies
### Aliases: tablefreq update.tablefreq
### Keywords: manip

### ** Examples

tablefreq(iris)
tablefreq(iris, c("Sepal.Length","Species"))
a <- tablefreq(iris,freq="Sepal.Length")
tablefreq(a, freq="Sepal.Width")

library(dplyr)
iris %>% tablefreq("Species")

tfq <- tablefreq(iris[,c(1:2)])

chunk1 <- iris[1:10,c(1:2)]
chunk2 <- iris[c(11:20),]
chunk3 <- iris[-c(1:20),]
a <- tablefreq(chunk1)
a <- update(a,chunk2)
a <- update(a,chunk3)
a

## Not run: 
##D 
##D ## External databases
##D library(dplyr)
##D if(require(RSQLite)){
##D   hflights_sqlite <- tbl(hflights_sqlite(), "hflights")
##D   hflights_sqlite
##D   tbl_vars(hflights_sqlite)
##D   tablefreq(hflights_sqlite,vars=c("Year","Month"),freq="DayofMonth")
##D }
##D 
##D ##
##D ## Graphs
##D ##
##D if(require(ggplot2) && require(hflights)){
##D   library(dplyr)
##D 
##D   ## One variable
##D   ## Bar plot
##D   tt <- as.data.frame(tablefreq(hflights[,"ArrDelay"]))
##D   p <- ggplot() + geom_bar(aes(x=x, y=freq), data=tt, stat="identity")
##D   print(p)
##D 
##D   ## Histogram
##D   p <- ggplot() + geom_histogram(aes(x=x, weight= freq), data = tt)
##D   print(p)
##D 
##D   ## Density
##D   tt <- tt[complete.cases(tt),] ## remove missing values
##D   tt$w <- tt$freq / sum(tt$freq) ## weights must sum 1
##D   p <- ggplot() + geom_density(aes(x=x, weight= w), data = tt)
##D   print(p)
##D 
##D   ##
##D   ## Two distributions
##D   ##
##D   ## A numeric and a factor variable
##D   td <- tablefreq(hflights[,c("TaxiIn","Origin")])
##D   td <- td[complete.cases(td),]
##D 
##D   ## Bar plot
##D   p <- ggplot() + geom_bar(aes(x=TaxiIn, weight= freq, colour = Origin),
##D                            data = td, position ="dodge")
##D   print(p)
##D 
##D   ## Density
##D   ## compute the relative frequencies for each group
##D   td <- td %>% group_by(Origin) %>%
##D                mutate( ngroup= sum(freq), wgroup= freq/ngroup)
##D   p <- ggplot() + geom_density(aes(x=TaxiIn, weight=wgroup, colour = Origin),
##D                                data = td)
##D   print(p)
##D 
##D   ## For each group, plot its values
##D   p <- ggplot() + geom_point(aes(x=Origin, y=TaxiIn, size=freq),
##D                              data = td, alpha= 0.6)
##D   print(p)
##D 
##D   ## Two numeric variables
##D   tc <- tablefreq(hflights[,c("TaxiIn","TaxiOut")])
##D   tc <- tc[complete.cases(tc),]
##D   p <- ggplot() + geom_point(aes(x=TaxiIn, y=TaxiOut, size=freq),
##D                              data = tc, color = "red", alpha=0.5)
##D   print(p)
##D 
##D   ## Two factors
##D   tf <- tablefreq(hflights[,c("UniqueCarrier","Origin")])
##D   tf <- tf[complete.cases(tf),]
##D 
##D   ## Bar plot
##D   p <- ggplot() + geom_bar(aes(x=Origin, fill=UniqueCarrier, weight= freq),
##D                            data = tf)
##D   print(p)
##D }
## End(Not run)



