library(mapStats)


### Name: jiggleClass
### Title: Adjust class boundaries to protect from rounding errors
### Aliases: jiggleClass

### ** Examples



y <- 100*rnorm(50)

#compute class intervals using either right or left interval closure

class_list_right <- classInt::classIntervals(var=y, n=12, intervalClosure="left")
class_list_right$brks
class_list_left <- classInt::classIntervals(var=y, n=12, intervalClosure="left")
class_list_left$brks

#there should be a slight difference now between class breaks from before, but should 
#have same number of observations per interval as before, and for both left and right closure

jiggleClass(x=class_list_right)
jiggleClass(x=class_list_left)



#example with discrete data, 7 groups but 9 unique values.
#classIntervals generates some empty intervals, so jiggleClass eliminates them and adjusts breaks
#in this example, with integer values, right/left closure matters more, and so the results
#will differ slightly depending on which is chosen

y <- c(1, 1, 1, 1, 2, 3, 6, 7, 8, 9, 10, 10, 10, 10, 11)
class_list_right <- classInt::classIntervals(y, 7, intervalClosure="right")
class_list_right
class_list_left <- classInt::classIntervals(y, 7, intervalClosure="left")
class_list_left


#number of groups falls now for left closure

jiggleClass(x=class_list_right)
jiggleClass(x=class_list_left)





