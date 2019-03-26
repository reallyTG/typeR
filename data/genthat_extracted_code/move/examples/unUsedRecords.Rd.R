library(move)


### Name: unUsedRecords<-
### Title: Extracts or creates the unUsedRecords
### Aliases: unUsedRecords<- unUsedRecords
###   unUsedRecords<-,.MoveTrackSingle,logical-method
###   unUsedRecords<-,.MoveTrackStack,logical-method
###   unUsedRecords,.unUsedRecords-method
###   unUsedRecords,.unUsedRecordsStack-method

### ** Examples

data(leroy)
data(fishers)

## get unused records from a move or moveStack object
str(unUsedRecords(leroy)) # from a move object
str(unUsedRecords(fishers)) # from a moveStack object

## assign locations of a move object as unused record
par(mfrow=2:1)
plot(leroy, type='b')
# e.g. assign every second location as unused
unUsedRecords(leroy)<-as.logical((1:n.locs(leroy))%%2) 
plot(leroy, type='b')

# e.g. assign first 20 locations as unused
data(leroy)
unUsedRecords(leroy)<- as.logical(c(rep("FALSE",20), rep("TRUE",n.locs(leroy)-20)))



