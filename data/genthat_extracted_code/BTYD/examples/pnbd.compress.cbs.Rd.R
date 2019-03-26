library(BTYD)


### Name: pnbd.compress.cbs
### Title: Compress Customer-by-Sufficient-Statistic Matrix
### Aliases: pnbd.compress.cbs

### ** Examples

# Create a sample customer-by-sufficient-statistic matrix:
set.seed(7)
x <- sample(1:4, 10, replace = TRUE)
t.x <- sample(1:4, 10, replace = TRUE)
T.cal <- rep(4, 10)
ave.spend <- sample(10:20, 10, replace = TRUE)
cbs <- cbind(x, t.x, T.cal, ave.spend)
cbs

# If cbs is printed, you would note that the following
# sets of rows have the same x, t.x and T.cal:
# (1, 6, 8); (3, 9)

pnbd.compress.cbs(cbs, 0)   # No rounding necessary

# Note that all additional columns (in this case, ave.spend)
# are aggregated by sum.



