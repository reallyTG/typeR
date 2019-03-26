library(data.table)


### Name: special-symbols
### Title: Special symbols
### Aliases: special-symbols datatable-symbols .SD .I .GRP .BY .N
### Keywords: data

### ** Examples

## Not run: 
##D DT = data.table(x=rep(c("b","a","c"),each=3), v=c(1,1,1,2,2,1,1,2,2), y=c(1,3,6), a=1:9, b=9:1)
##D DT
##D X = data.table(x=c("c","b"), v=8:7, foo=c(4,2))
##D X
##D 
##D DT[.N]                                 # last row, only special symbol allowed in 'i'
##D DT[, .N]                               # total number of rows in DT
##D DT[, .N, by=x]                         # number of rows in each group
##D DT[, .SD, .SDcols=x:y]                 # select columns 'x' and 'y'
##D DT[, .SD[1]]                           # first row of all columns
##D DT[, .SD[1], by=x]                     # first row of 'y' and 'v' for each group in 'x'
##D DT[, c(.N, lapply(.SD, sum)), by=x]    # get rows *and* sum columns 'v' and 'y' by group
##D DT[, .I[1], by=x]                      # row number in DT corresponding to each group
##D DT[, .N, by=rleid(v)]                  # get count of consecutive runs of 'v'
##D DT[, c(.(y=max(y)), lapply(.SD, min)),
##D         by=rleid(v), .SDcols=v:b]      # compute 'j' for each consecutive runs of 'v'
##D DT[, grp := .GRP, by=x]                # add a group counter
##D X[, DT[.BY, y, on="x"], by=x]          # join within each group
## End(Not run)


