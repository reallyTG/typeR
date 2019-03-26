library(pawacc)


### Name: dateSummary
### Title: Date summary for accelerometer files
### Aliases: dateSummary
### Keywords: Actigraph GT1M summary

### ** Examples

data(gt1m_sample)

mw <- markwear.accfile(gt1m_sample, 20)
tsf <- tsFormat(gt1m_sample)
dateSummary(gt1m_sample, mw, tsf)
## Not run: 
##D   fileid       days freq hour_day start_day end_day valid_mins IsStartDate
##D 1   test 2011-12-08 3840   16.000        08      23     571.25           1
##D 2   test 2011-12-09 5760   24.000        00      23     557.00           0
##D 3   test 2011-12-10 5760   24.000        00      23     676.50           0
##D 4   test 2011-12-11 5760   24.000        00      23     493.50           0
##D 5   test 2011-12-12 5760   24.000        00      23     638.25           0
##D 6   test 2011-12-13 5760   24.000        00      23     680.50           0
##D 7   test 2011-12-14 5760   24.000        00      23     717.00           0
##D 8   test 2011-12-15 5760   24.000        00      23       0.50           0
##D 9   test 2011-12-16  750    3.125        00      03       0.00           0
##D   IsEndDate IsTruncated
##D 1         0           0
##D 2         0           0
##D 3         0           0
##D 4         0           0
##D 5         0           0
##D 6         0           0
##D 7         0           0
##D 8         0           0
##D 9         1           0
## End(Not run)

# at least 600 minutes per day to determine first and last day
dateSummary(gt1m_sample, mw, tsf, minval = 600)
## Not run: 
##D   fileid       days freq hour_day start_day end_day valid_mins IsStartDate
##D 1   test 2011-12-08 3840   16.000        08      23     571.25           0
##D 2   test 2011-12-09 5760   24.000        00      23     557.00           0
##D 3   test 2011-12-10 5760   24.000        00      23     676.50           1
##D 4   test 2011-12-11 5760   24.000        00      23     493.50           0
##D 5   test 2011-12-12 5760   24.000        00      23     638.25           0
##D 6   test 2011-12-13 5760   24.000        00      23     680.50           0
##D 7   test 2011-12-14 5760   24.000        00      23     717.00           0
##D 8   test 2011-12-15 5760   24.000        00      23       0.50           0
##D 9   test 2011-12-16  750    3.125        00      03       0.00           0
##D   IsEndDate IsTruncated
##D 1         0           1
##D 2         0           1
##D 3         0           0
##D 4         0           0
##D 5         0           0
##D 6         0           0
##D 7         1           0
##D 8         0           1
##D 9         0           1
## End(Not run)




