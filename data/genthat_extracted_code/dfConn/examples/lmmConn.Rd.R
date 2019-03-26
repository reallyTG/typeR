library(dfConn)


### Name: lmmConn
### Title: Semiparametric modelling - Static
### Aliases: lmmConn

### ** Examples


# Assuming user has run MLPB_boot() and has summarized the bootstrapping results 
# by calculating the median or mean.

## Example with 5 subjects bootstrap-based static functional connectivity estimates data included
## Each subject's data has 731 time points in total, which includes 6 scans and 105 effective 
## time point for each scan. 
## 3 regions of interest (ROIs) comparision pairs are selected

data(MLPB_output_median)
subjects <- c('subject1', 'subject2', 'subject3', 'subject4', 'subject5')

# In our demo data, each subject has a scan with a total of 750 time points
time.points <- c(1:105, 126:230, 251:355,
                 376:480, 501:605, 626:730) 
                 
num.scan <- 6 # Each subject has 6 scans
ntps.per.scan <- 105 # Each scan has 105 time points

resConn <- lmmConn(MLPB_output_median, subjects, time.points, num.scan, ntps.per.scan)
## Don't show: 
rm(list = c('subjects', 'MLPB_output_median', 'time.points', 'num.scan', 'ntps.per.scan','resConn'))
gc()
## End(Don't show)



