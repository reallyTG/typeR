library(editrules)


### Name: getVars
### Title: get names of variables in a set of edits
### Aliases: getVars getVars.editset getVars.NULL

### ** Examples


E <- editmatrix(c( "x+3*y == 2*z"
                 , "x > 2")
                 )
getVars(E)

E <- editarray(expression(
    gender %in% c('male','female'),
    pregnant %in% c(TRUE, FALSE),
    if( gender == 'male' ) pregnant == FALSE
    )
)

getVars(E)




