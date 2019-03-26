library(IDPSurvival)


### Name: isurvdiff.smax
### Title: Maximum values of s for which the IDP test returns a determinate
###   decision
### Aliases: isurvdiff.smax
### Keywords: survival IDP

### ** Examples

data(lung,package='survival')
lung <- lung[1:40,]	# reduced data set just to ensure that the
 					# example is very fast to run for building the package
test <-isurvdiff.smax(Surv(time,status)~sex,lung,groups=c(1,2), 
	 	alternative = 'two.sided', nsamples=1000) 
                    # better to use larger value of nsamples
					# this small value is to run it quickly
print(test$test0)
cat("Maximum s giving the same decision: ",test$s)




