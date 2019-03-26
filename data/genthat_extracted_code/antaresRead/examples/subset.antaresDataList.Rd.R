library(antaresRead)


### Name: subset.antaresDataList
### Title: Subset an antaresDataList
### Aliases: subset.antaresDataList

### ** Examples

## Not run: 
##D #keep only the first year
##D mydata <- readAntares(areas = "all", links = "all", mcYears = "all")
##D mySubset<-subset(mydata, mcYears = 1)
##D   
##D #keep only the first year for areas a and b 
##D mydata <- readAntares(areas = "all", links = "all", mcYears = "all")
##D mySubset<-subset(mydata, mcYears = 1, areas=c("a", "b")) 
##D 
##D #' #keep only the first year for areas a and b and timeIds include in 5:16 
##D mydata <- readAntares(areas = "all", links = "all", mcYears = "all")
##D mySubset<-subset(mydata, mcYears = 1, areas=c("a", "b"), timeIds=5:16) 
##D   
## End(Not run)




