library(filenamer)


### Name: set_ftime
### Title: Set time stamp in a file name
### Aliases: set_ftime

### ** Examples

x <- "data_norm_20110103T093015.txt"
# change the time to 30 seconds past 2:45 p.m.
print(set_ftime(x, "144530"))
# to change the date, time must be specified as well
print(set_ftime(x, "20110505T101500"))



