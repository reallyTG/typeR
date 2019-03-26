library(Ecfun)


### Name: dateCols
### Title: Identify YMD names in a character vector
### Aliases: dateCols
### Keywords: manip

### ** Examples

##
## 1.  character vector 
##
colNames <- c('war', 'StartMonth1', 'StartDay1', 'StartYear1', 
  'EndMonth1', 'EndMonth2', 'EndDay2', 'EndYear2', 'Initiator')

colNums <- dateCols(colNames)
# Should issue a warning:  
# Warning message:
# In dateCols(colNames) :
#   number of matches for Year = 2 != number of matches for Month = 3

# check 
colN <- list(Start1=c(Year=4, Month=2, Day=3), 
             End2=c(Year=8, Month=6, Day=7) )
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(colNums, colN)
## Don't show: 
)
## End(Don't show)
##
## 2.  array 
##
A <- matrix(ncol=length(colNames), 
      dimnames=list(NULL, colNames))

Anums <- dateCols(A)

# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(Anums, colN)
## Don't show: 
)
## End(Don't show)



