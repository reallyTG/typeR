library(antaresProcessing)


### Name: compare
### Title: Compare two simulations or two antaresData
### Aliases: compare

### ** Examples

## Not run: 
##D # First simulation
##D studyPath <- "path/to/study/"
##D 
##D setSimulationPath(studyPath, 1)
##D mydata1 <- readAntares("all", "all", synthesis = FALSE)
##D surplus1 <- surplus(mydata1, groupByDistrict = TRUE)
##D 
##D # Second simulation
##D setSimulationPath(studyPath, 2)
##D mydata2 <- readAntares("all", "all", synthesis = FALSE)
##D surplus2 <- surplus(mydata2, groupByDistrict = TRUE)
##D 
##D compare(surplus1, surplus2)
##D 
##D opts1 <- setSimulationPath(studyPath,-1)
##D mydata1<-readAntares(areas = "all",
##D links = "all",
##D select = c("allAreas", "allLinks"),
##D mcYears = c(1),
##D linkCapacity = TRUE)
##D 
##D opts2 <- setSimulationPath(studyPath,-2)
##D mydata2 <- readAntares(areas = "all",
##D links = "all",
##D select = c("allAreas", "allLinks"),
##D mcYears = c(1),
##D linkCapacity = TRUE)
##D 
##D opts3 <- setSimulationPath(studyPath,-3)
##D mydata3 <- readAntares(areas = "all",
##D links = "all",
##D select = c("allAreas", "allLinks"),
##D mcYears = c(1),
##D linkCapacity = TRUE)
##D 
##D opts4 <- setSimulationPath(studyPath, -4)
##D mydata4 <- readAntares(areas = "all",
##D links = "all",
##D select=c("allAreas", "allLinks"),
##D mcYears = c(1),
##D linkCapacity = TRUE)
##D 
##D opts5 <- setSimulationPath(studyPath, -5)
##D mydata5 <- readAntares(areas = "all",
##D links = "all",
##D select=c("allAreas", "allLinks"),
##D mcYears = c(1),
##D linkCapacity = TRUE)
##D 
##D resCompare1 <- compare(mydata2, mydata1, method = "diff")
##D resCompare2 <- compare(mydata3, mydata1, method = "diff")
##D resCompare3 <- compare(mydata4, mydata1, method = "diff")
##D resCompare4 <- compare(mydata5, mydata1, method = "diff")
##D 
##D listCompare <- list(resCompare1, resCompare2, resCompare3, resCompare4)
##D 
##D for (i in 1:length(listCompare)){
##D listCompare[[i]] <- removeVirtualAreas(listCompare[[i]],
##D                                        storageFlexibility =
##D                                        getAreas(select = c("z_dsr", "y_mul", "pum", "tur")))
##D }
##D 
##D ml <- readRDS("path/to/mapLayout.rds")
##D plotMap(listCompare, ml)
## End(Not run)




