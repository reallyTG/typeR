library(Rraven)


### Name: extract_ts
### Title: Extract time series parameters from data imported from 'Raven'
### Aliases: extract_ts

### ** Examples


# Load data
data(selection_files)

#save 'Raven' selection tables in the temporary directory 
writeLines(selection_files[[5]], con = names(selection_files)[5])

## No test: 
# import data to R
rvn.dat <- imp_raven(all.data = TRUE) 

# Peak freq dif length
extract_ts(X = rvn.dat, ts.column = "Peak.Freq.Contour..Hz.")

# Peak freq equal length
extract_ts(X = rvn.dat, ts.column = "Peak.Freq.Contour..Hz.", equal.length = T)
 
# Peak freq equal length 10 measurements
extract_ts(X = rvn.dat, ts.column = "Peak.Freq.Contour..Hz.", 
equal.length = TRUE, length.out = 10) 
## End(No test) 




