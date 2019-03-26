library(dfConn)


### Name: lmmDyn
### Title: Semiparametric modelling - dynamic functional connectivity model
### Aliases: lmmDyn

### ** Examples

## Don't show: 
# Example for testing
# Assuming user has run \code{MLPB_boot} and has summarize the bootstrapping result

data(MLPB_output_median)
dataList <- list(median_1_2 = MLPB_output_median[[1]])
subjects <- c('subject1', 'subject2', 'subject3', 'subject4', 'subject5')

# In our demo data, each subject has a scan with a total of 90 time points
time.points <- c(1:40,51:90) 
                 
num.scan <- 2 # Each subject has 2 scans
ntps.per.scan <- 40 # Each scan has 105 time points

resDyn <- lmmDyn(dataList, subjects, time.points, num.scan, ntps.per.scan)
rm(list = c('subjects', 'MLPB_output_median', 'time.points', 'num.scan', 'ntps.per.scan', 'resDyn'))
gc()
## End(Don't show)
## No test: 
# Assuming user has run MLPB_boot() and has summarize the bootstrapping result

data("MLPB_output_median")

subjects <- c('subject1', 'subject2', 'subject3', 'subject4', 'subject5')

# In our demo data, each subject has a scan with a total of 750 time points
time.points <- c(1:105, 126:230, 251:355,
                 376:480, 501:605, 626:730) 
                 
num.scan <- 6 # Each subject has 6 scans
ntps.per.scan <- 105 # Each scan has 105 time points

resDyn <- lmmDyn(MLPB_output_median, subjects, time.points, num.scan, ntps.per.scan, cores = 5)
## End(No test)



