library(epiDisplay)


### Name: tab1
### Title: One-way tabulation
### Aliases: tab1 print.tab1
### Keywords: aplot

### ** Examples

tab1(state.division)
tab1(state.division, bar.values ="percent")
tab1(state.division, sort.group ="decreasing")
tab1(state.division, sort.group ="increasing")
tab1(state.division, col=c("chocolate","brown1","brown4"),
  main="Number of states in each zone")
# For presentation, several 'cex' parameters should increase
tab1(state.division, col=c("chocolate","brown1","brown4"),
  main="Number of states in each zone",
  cex.main=1.7, cex.name=1.2, cex.axis=1.3, cex.lab=1.3)


data(Oswego)
.data <- Oswego
attach(.data)
tab1(ill) # Note the column of cumulative percentages in the table.
tab1(ill, cum.percent=FALSE)
tab1(chocolate) 
# Due to missing values, cumulative percentages are now automatically turned off.
tab1(chocolate, cum.percent=TRUE)
# Slightly too many columns in text!
tab1(chocolate, missing=FALSE, bar.values="percent")
agegr <- cut(age, breaks=c(0,10,20,30,40,50,60,70,80))
tab1(agegr) # No need to start with 'calc' as it is outside .data
tab1(agegr, col="grey") # graphic output from older versions of 'tab1'
tab1(agegr, col=c("red","yellow","blue")) # Colours recycled
tab1(agegr, horiz=TRUE)

# Keeping output table
dev.off()
tab1(agegr, graph = FALSE) -> a
print(a)
a # same results
attributes(a)
a$output.table
class(a$output.table) # "matrix" 
# 'a$output.table' is ready for exporting to a .csv file by 
# write.csv(a$output.table, file="table1.csv") 
# "table1.csv" is now readable by a spreadsheet program
detach(.data)
rm(list=ls())



