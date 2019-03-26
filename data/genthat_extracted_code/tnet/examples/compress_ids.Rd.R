library(tnet)


### Name: compress_ids
### Title: Remove non-active nodes from one-mode/two-mode/longitudinal
###   networks
### Aliases: compress_ids

### ** Examples

## Load sample data
t <- c("2007-09-12 13:45:00",
  "2007-09-12 13:45:00",
  "2007-09-12 13:45:01",
  "2007-09-12 13:46:31",
  "2007-09-12 13:46:31",
  "2007-09-12 13:47:54",
  "2007-09-12 13:48:21",
  "2007-09-12 13:49:27",
  "2007-09-12 13:49:27",
  "2007-09-12 13:52:17",
  "2007-09-12 13:56:59",
  "2007-09-12 13:58:14")
i <- c(1,2,1,3,1,2,3,5,1,3,1,1);
j <- c(1,2,2,3,3,1,2,5,5,2,3,5);
w <- c(1,1,1,1,1,1,1,1,1,1,1,1);
samplenet <- data.frame(t, i, j, w);

## Run the function
compress_ids(samplenet)





