library(lsr)


### Name: expandFactors
### Title: Expand factors to a set of contrasts
### Aliases: expandFactors

### ** Examples

grading <- data.frame( teacher = factor( c("Amy","Amy","Ben","Ben","Cat") ), 
                       gender = factor( c("male","female","female","male","male") ),
                       grade = c(75,80,45,50,65) )

# expand factors using the default contrasts (usually treatment contrasts)
expandFactors( grading )

# specify the contrasts using the contrasts.arg argument to model.matrix
my.contrasts <- list( teacher = "contr.helmert", gender = "contr.treatment" ) 
expandFactors( grading, contrasts.arg = my.contrasts )




