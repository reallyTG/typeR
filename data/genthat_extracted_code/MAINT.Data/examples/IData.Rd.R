library(MAINT.Data)


### Name: IData
### Title: Interval Data objects
### Aliases: IData is.IData
### Keywords: interval data

### ** Examples

ChinaT <- IData(ChinaTemp[1:8],VarNames=c("T1","T2","T3","T4"))
cat("Summary of the ChinaT IData object:\n")  ; print(summary(ChinaT))
cat("ChinaT first ant last observations:\n")  
print(head(ChinaT,n=3))
cat("\n...\n")
print(tail(ChinaT,n=3))



