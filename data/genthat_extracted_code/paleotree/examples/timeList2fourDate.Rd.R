library(paleotree)


### Name: timeList2fourDate
### Title: Converting Datasets of Taxon Ranges in Intervals Between
###   timeList format and fourDate format
### Aliases: timeList2fourDate fourDateFunctions fourDate2timeList

### ** Examples

#timeList object from the retiolinae dataset
data(retiolitinae)

str(retioRanges)

taxicDivDisc(retioRanges)

fourDateRet <- timeList2fourDate(retioRanges)

# total uncertainty in retio first and last appearances?
sum((fourDateRet[,1]-fourDateRet[,2])+(fourDateRet[,3]-fourDateRet[,4]))

#convert back
newTimeList <- fourDate2timeList(fourDateRet)
taxicDivDisc(retioRanges)




