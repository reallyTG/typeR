library(itsadug)


### Name: wald_gam
### Title: Function for post-hoc comparison of the contrasts in a single
###   GAMM model.
### Aliases: wald_gam

### ** Examples

data(simdat)
# Convert Condition to factorial predictor for illustration purposes:
simdat$Condition <- as.factor(simdat$Condition)

infoMessages("on")

## Not run: 
##D # some arbitrary model:
##D m1 <- bam(Y ~ Condition*Group  
##D 	+ s(Time, by=Condition) 
##D 	+ s(Time, by=Group)
##D 	+ s(Subject, bs='re'), 
##D 	data=simdat)
##D 
##D # print summary to inspect parametric terms:
##D summary(m1)
##D 
##D # return all contrasts:
##D wald_gam(m1)
##D 
##D # USE OF COMP
##D # return only contrasts for Adults:
##D wald_gam(m1, comp=list(Condition=levels(simdat$Condition)))
##D # return specific contrasts:
##D wald_gam(m1, comp=list(Condition=c("-1", "0", "1"), 
##D     Group=c("Adults", "Children")))
##D 
##D # USE OF SELECT
##D # Specify contrast matrix. 
##D # Note that intercept should be 0.
##D # Example: Compare Condition 0 with Conditions 2 and 3 for children.
##D # Method 1: matrix or vector:
##D R = matrix( c(0,-2,0,1,1,0,0,0,0,0,0,0), nrow=1)
##D wald_gam(m1, select=R) 
##D wald_gam(m1, select=c(0,-2,0,1,1,0,0,0,0,0,0,0)) 
##D # Method 2: list
##D # first list element are reference coefficients, 
##D # second list element are coefficients to compare
##D wald_gam(m1, select=list(2, c(4,5))) 
##D # Replication of contrasts given in summary:
##D wald_gam(m1, select=c(0,1,0,0,0,0,0,0,0,0,0,0))
##D 
##D # USE OF T.TEST
##D # This option is not implemented for use with select
##D # Compare with second line of parametric summary:
##D wald_gam(m1, comp=list(Condition=c("-1", "0"), 
##D     Group="Children"), t.test=TRUE)
##D # Compare with Wald test:
##D wald_gam(m1, comp=list(Condition=c("-1", "0"), 
##D     Group="Children"))
##D 
##D # exclude significance stars:
##D wald_gam(m1, comp=list(Condition=c("-1", "0"), 
##D     Group="Children"), signif.stars=FALSE)
##D 
##D # do not print output, but save table for later use:
##D test <- wald_gam(m1, comp=list(Condition=c("-1", "0"), 
##D     Group="Children"), print.output=FALSE)
##D test
##D # alternative way:
##D infoMessages('off')
##D test2 <- wald_gam(m1, comp=list(Condition=c("-1", "0"), 
##D     Group="Children"))
##D infoMessages('on')
##D 
## End(Not run)



