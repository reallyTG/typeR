library(taRifx)


### Name: as.data.frame.by
### Title: Convert the results of by() to a data.frame.
### Aliases: as.data.frame.by

### ** Examples

test.by <- by( ChickWeight$weight, ChickWeight$Diet, mean)
	test.by
	class(test.by)
	str(test.by)
	test.df <-as.data.frame(test.by)
	str(test.df)



