library(crunch)


### Name: makeCaseVariable
### Title: Make a case variable
### Aliases: makeCaseVariable

### ** Examples

## Not run: 
##D makeCaseVariable(case1=ds$v1 == 1, case2=ds$v2 == 2, name="new case")
##D makeCaseVariable(cases=list(list(expression=ds$v1 == 1, name="case1"),
##D                             list(expression=ds$v2 == 2, name="case2")),
##D                  name="new case")
##D 
##D # different ways to specify else cases
##D makeCaseVariable(cases=list(list(expression=ds$v1 == 1, name="case1"),
##D                             list(expression=ds$v2 == 2, name="case2"),
##D                             list(expression="else", name="other")),
##D                  name="new case")
##D makeCaseVariable(case1=ds$v1 == 1, case2=ds$v2 == 2, other="else", name="new case")
##D 
##D # the dataset can be specified with data=
##D makeCaseVariable(case1=v1 == 1, case2=v2 == 2, data=ds, name="new case")
## End(Not run)



