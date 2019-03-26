library(TSS.RESTREND)


### Name: TSSRESTREND
### Title: Time Series Segmentation of Residual Trends (MAIN FUNCTION)
### Aliases: TSSRESTREND

### ** Examples

## Not run: 
##D #To get the latest version of the package (Still in development)
##D install.packages("devtools")
##D library("devtools")
##D install_github("ArdenB/TSSRESTREND", subdir="TSS.RESTREND")
##D library(TSS.RESTREND)
##D #Find the path of the rabbitRF.csv dataset, read it in and turn it into a time series
##D rf.path<- system.file("extdata", "rabbitRF.csv", package = "TSS.RESTREND", mustWork = TRUE)
##D in.RF <- read.csv(rf.path)
##D rf.data <- ts(in.RF, end=c(2013,12), frequency = 12)
##D 
##D #Find the path of the rabbitVI.csv dataset and read it in
##D vi.path <- system.file("extdata", "rabbitVI.csv", package = "TSS.RESTREND", mustWork = TRUE)
##D in.VI <- read.csv(vi.path)
##D CTSR.VI <- ts(in.VI, start=c(1982, 1), end=c(2013,12), frequency = 12)
##D 
##D #Define the max accumuulation period
##D max.acp <- 12
##D #Define the max offset period
##D max.osp <- 4
##D #Create a table of every possible precipitation value given the max.acp and max.osp
##D ACP.table <- climate.accumulator(CTSR.VI, rf.data, max.acp, max.osp)
##D results <- TSSRESTREND(CTSR.VI, ACP.table)
##D print(results)
##D plot(results, verbose=TRUE)
## End(Not run)




