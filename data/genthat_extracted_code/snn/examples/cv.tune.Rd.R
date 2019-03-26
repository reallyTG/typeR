library(snn)


### Name: cv.tune
### Title: Tuning via 5 fold Cross-Validation.
### Aliases: cv.tune

### ** Examples

	set.seed(1)
	n = 100
	d = 10
	DATA = mydata(n, d)

	## Tuning procedure
	out.tune = cv.tune(DATA, classifier = "knn") 
	out.tune




