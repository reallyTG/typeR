library(data.table)


### Name: groupingsets
### Title: Grouping Set aggregation for data tables
### Aliases: rollup cube groupingsets rollup.data.table cube.data.table
###   groupingsets.data.table
### Keywords: data

### ** Examples

n = 24L
set.seed(25)
DT <- data.table(
    color = sample(c("green","yellow","red"), n, TRUE),
    year = as.Date(sample(paste0(2011:2015,"-01-01"), n, TRUE)),
    status = as.factor(sample(c("removed","active","inactive","archived"), n, TRUE)),
    amount = sample(1:5, n, TRUE),
    value = sample(c(3, 3.5, 2.5, 2), n, TRUE)
)

# rollup
rollup(DT, j = sum(value), by = c("color","year","status")) # default id=FALSE
rollup(DT, j = sum(value), by = c("color","year","status"), id=TRUE)
rollup(DT, j = lapply(.SD, sum), by = c("color","year","status"), id=TRUE, .SDcols="value")
rollup(DT, j = c(list(count=.N), lapply(.SD, sum)), by = c("color","year","status"), id=TRUE)

# cube
cube(DT, j = sum(value), by = c("color","year","status"), id=TRUE)
cube(DT, j = lapply(.SD, sum), by = c("color","year","status"), id=TRUE, .SDcols="value")
cube(DT, j = c(list(count=.N), lapply(.SD, sum)), by = c("color","year","status"), id=TRUE)

# groupingsets
groupingsets(DT, j = c(list(count=.N), lapply(.SD, sum)), by = c("color","year","status"),
             sets = list("color", c("year","status"), character()), id=TRUE)



