library(baytrends)


### Name: baseDay2decimal
### Title: Base Day
### Aliases: baseDay2decimal
### Keywords: internal manip

### ** Examples

# The baseDay ordered by calendar year
bd.tmp <- baseDay(c("2000-02-29", "2000-03-01", "2001-03-01"), 
  numeric=FALSE)
baseDay2decimal(bd.tmp)
# ordered by water year, result should agree
bd.tmp <- baseDay(c("2000-02-29", "2000-03-01", "2001-03-01"), 
  numeric=FALSE, year="water")
baseDay2decimal(bd.tmp)



