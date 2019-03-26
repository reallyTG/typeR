library(lavaan)


### Name: lav_constraints
### Title: Utility Functions: Constraints
### Aliases: lav_constraints_parse lav_partable_constraints_ceq
###   lav_partable_constraints_ciq lav_partable_constraints_def

### ** Examples

myModel <- 'x1 ~ a*x2 + b*x3 + c*x4'
myParTable <- lavaanify(myModel, as.data.frame. = FALSE)
con <- ' a == 2*b
         b - c == 5 '
conInfo <- lav_constraints_parse(myParTable, constraints = con)

myModel2 <- 'x1 ~ a*x2 + b*x3 + c*x4
             a == 2*b
             b - c == 5 '
ceq <- lav_partable_constraints_ceq(partable = lavaanify(myModel2))
ceq( c(2,3,4) )



