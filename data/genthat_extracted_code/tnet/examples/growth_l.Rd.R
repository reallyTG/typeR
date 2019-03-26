library(tnet)


### Name: growth_l
### Title: Identifies growth mechanisms responsible for tie generation in
###   longitudinal networks
### Aliases: growth_l

### ** Examples

## Load sample data
t <- c('2007-09-12 13:45:00', 
'2007-09-12 13:46:31',
'2007-09-12 13:47:54',
'2007-09-12 13:48:21',
'2007-09-12 13:49:27',
'2007-09-12 13:58:14',
'2007-09-12 13:52:17',
'2007-09-12 13:56:59');
i <- c(1,1,2,3,1,3,1,1);
j <- c(2,3,1,2,4,2,3,4);
w <- c(1,1,1,1,1,1,1,1);
sample <- data.frame(t, i, j, w);

## Run the function
growth_l(sample, effects="indegree", nstrata=2)




