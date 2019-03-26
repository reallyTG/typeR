library(tstools)


### Name: resolve_ts_overlap
### Title: Concatenate Time Series and Resolve Overlap Automatically
### Aliases: resolve_ts_overlap

### ** Examples

ts1 <- ts(rnorm(100),start = c(1990,1),frequency = 4)
ts2 <- ts(1:18,start = c(2000,1),frequency = 4)  
resolve_ts_overlap(ts1,ts2)   

# automatical detection of correction sequence!
ts1 <- ts(rnorm(90),start = c(1990,1),frequency = 4)            
ts2 <- ts(1:60,start = c(2000,1),frequency = 4)
resolve_ts_overlap(ts1,ts2)   

# both series are of the same length use sequence of arguments.
ts1 <- ts(rnorm(100),start = c(1990,1),frequency = 4)
ts2 <- ts(1:48,start = c(2003,1),frequency = 4)  
resolve_ts_overlap(ts1,ts2)
ts1 <- ts(rnorm(101),start = c(1990,1),frequency = 4)            
ts2 <- ts(1:61,start = c(2000,1),frequency = 4)
resolve_ts_overlap(ts1,ts2)
#' clearly dominatn ts2 series
ts1 <- ts(rnorm(50),start = c(1990,1),frequency = 4)            
ts2 <- ts(1:100,start = c(1990,1),frequency = 4)
resolve_ts_overlap(ts1,ts2)



