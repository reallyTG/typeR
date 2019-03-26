library(poppr)


### Name: greycurve
### Title: Display a greyscale gradient adjusted to specific parameters
### Aliases: greycurve

### ** Examples

# Normal grey curve with an adjustment of 3, an upper limit of 0.8, and
# weighted towards smaller values.
greycurve()
## Not run: 
##D # 1:1 relationship grey curve.
##D greycurve(gadj=1, glim=1:0)
##D 
##D # Grey curve weighted towards larger values.
##D greycurve(gweight=2)
##D 
##D # Same as the first, but the limit is 1.
##D greycurve(glim=1:0)
##D 
##D # Setting the lower limit to 0.1 and weighting towards larger values.
##D greycurve(glim=c(0.1,0.8), gweight=2)
## End(Not run)



