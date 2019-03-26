library(Rlabkey)


### Name: saveResults
### Title: Returns an object representing a LabKey schema
### Aliases: saveResults
### Keywords: file

### ** Examples

## No test: 

## Very simple example of an analysis flow:  query some data,
## calculate some stats, then save the calculations as an assay
## result set in LabKey Server
# library(Rlabkey)

s<- getSession(baseUrl="http://localhost:8080/labkey",
    folderPath="/apisamples")
scobj <- getSchema(s, "lists")
simpledf <- getRows(s, scobj$AllTypes)

## some dummy calculations to produce and example analysis result
testtable <- simpledf[,3:4]
colnames(testtable) <- c("IntFld", "DoubleFld")
row <- c(list("Measure"="colMeans"), colMeans(testtable, na.rm=TRUE))
results <- data.frame(row, row.names=NULL, stringsAsFactors=FALSE)
row <- c(list("Measure"="colSums"), colSums(testtable, na.rm=TRUE))
results <- rbind(results, as.vector(row))

bprops <- list(LabNotes="this is a simple demo")
bpl<- list(name=paste("Batch ", as.character(date())),properties=bprops) 
rpl<- list(name=paste("Assay Run ", as.character(date())))

assayInfo<- saveResults(s, "SimpleMeans", results,
    batchPropertyList=bpl, runPropertyList=rpl)

## End(No test)



