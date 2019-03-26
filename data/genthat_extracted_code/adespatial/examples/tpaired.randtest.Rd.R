library(adespatial)


### Name: tpaired.randtest
### Title: Permutational paired t-test
### Aliases: tpaired.randtest

### ** Examples


## Deer leg length, data from Zar (1999, p. 162).

deer <- matrix(c(142,140,144,144,142,146,149,150,142,148,138,136,147,139,143,141,143,
145,136,146),10,2)

rownames(deer) <- paste("Deer",1:10,sep=".")

colnames(deer) <- c('Hind.leg', 'Fore.leg')

res <- tpaired.randtest(deer[,1], deer[,2])   # Two-tailed test by default

## Compare the results to:  res2 = t.test(deer[,1], deer[,2], paired=TRUE)




