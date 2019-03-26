library(multiPIM)


### Name: summary.multiPIM
### Title: Summary methods for class multiPIM
### Aliases: summary.multiPIM print.summary.multiPIM

### ** Examples


## load example from multiPIM help file

example(multiPIM)

## The results can also be displayed by outcome instead of by exposure:

summary(result, by.exposure = FALSE)
## now each table corresponds to all the pairs involving a single outcome

## may be best to store the summary object

sum.obj <- summary(result, by.exposure = FALSE)
sum.obj

## now the print method can be used to overide the values for
## by.exposure and digits (but not the other arguments):

print(sum.obj, by.exposure = TRUE, digits =  3)

## also can hand pick the info that we want from the summary.array slot
## e.g. let's say we are interested in all of the standard errors:

sum.obj$summary.array[,,2]

## or we are only interested in the exposure1-outcome2 pair:

sum.obj$summary.array[1,2,]

## or by name

sum.obj$summary.array["A1","Y2",]



