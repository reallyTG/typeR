library(lsr)


### Name: goodnessOfFitTest
### Title: Chi-square test against specified probabilities
### Aliases: goodnessOfFitTest

### ** Examples

# raw data
gender <- factor( 
	c( "male","male","male","male","female","female",
       "female","male","male","male" ))

# goodness of fit test against the hypothesis that males and
# females occur with equal frequency
goodnessOfFitTest( gender )

# goodness of fit test against the hypothesis that males appear
# with probability .6 and females with probability .4. 
goodnessOfFitTest( gender, p=c(.4,.6) )
goodnessOfFitTest( gender, p=c(female=.4,male=.6) )
goodnessOfFitTest( gender, p=c(male=.6,female=.4) )



