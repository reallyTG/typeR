library(incidence)


### Name: as.data.frame.incidence
### Title: Conversion of incidence objects
### Aliases: as.data.frame.incidence as.incidence as.incidence.matrix
###   as.incidence.data.frame as.incidence.numeric

### ** Examples

## create fake data
data <- c(0,1,1,2,1,3,4,5,5,5,5,4,4,26,6,7,9)
sex <- sample(c("m","f"), length(data), replace=TRUE)

## get incidence per group (sex)
i <- incidence(data, groups = sex)
i
plot(i)

## convert to data.frame
as.data.frame(i)

## same, 'long format'
as.data.frame(i, long = TRUE)



## conversion from a matrix of counts to an incidence object
i$counts
new_i <- as.incidence(i$counts, i$dates)
new_i
all.equal(i, new_i)




