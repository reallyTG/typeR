library(dbplyr)


### Name: win_over
### Title: Generate SQL expression for window functions
### Aliases: win_over win_rank win_aggregate win_aggregate_2 win_recycled
###   win_cumulative win_absent win_current_group win_current_order
###   win_current_frame
### Keywords: internal

### ** Examples

win_over(sql("avg(x)"))
win_over(sql("avg(x)"), "y")
win_over(sql("avg(x)"), order = "y")
win_over(sql("avg(x)"), order = c("x", "y"))
win_over(sql("avg(x)"), frame = c(-Inf, 0), order = "y")



