library(VIM)


### Name: parcoordMiss
### Title: Parallel coordinate plot with information about missing/imputed
###   values
### Aliases: parcoordMiss
### Keywords: hplot

### ** Examples


data(chorizonDL, package = "VIM")
## for missing values
parcoordMiss(chorizonDL[,c(15,101:110)], 
    plotvars=2:11, interactive = FALSE)
legend("top", col = c("skyblue", "red"), lwd = c(1,1), 
    legend = c("observed in Bi", "missing in Bi"))

## for imputed values
parcoordMiss(kNN(chorizonDL[,c(15,101:110)]), delimiter = "_imp" ,
    plotvars=2:11, interactive = FALSE)
legend("top", col = c("skyblue", "orange"), lwd = c(1,1), 
    legend = c("observed in Bi", "imputed in Bi"))




