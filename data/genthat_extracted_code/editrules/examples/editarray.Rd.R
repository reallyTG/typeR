library(editrules)


### Name: editarray
### Title: Parse textual, categorical edit rules to an editarray
### Aliases: editarray as.character.editarray as.data.frame.editarray
###   as.expression.editarray as.matrix.editarray c.editarray
###   summary.editarray

### ** Examples


# Here is the prototypical categorical edit: men cannot be pregnant.
E <- editarray(expression(
    gender %in% c('male','female'),
    pregnant %in% c('yes','no'),
    if( gender == 'male' ) pregnant == 'no'
    )
)
E

# an editarray has a summary method:
summary(E)

# A yes/no variable may also be modeled as a logical:
editarray(expression(
    gender %in% c('male','female'),
    pregnant %in% c(TRUE, FALSE),
    if( gender == 'male' ) pregnant == FALSE
    )
)

# or, shorter (and using a character vector as input): 
editarray(expression(
    gender %in% c('male','female'),
    pregnant %in% c(TRUE, FALSE),
    if( gender == 'male' ) !pregnant
    )
)

# the %in% statement may be used at will
editarray(expression(
    gender %in% c('male','female'),
    pregnant %in% c(TRUE, FALSE),
    positionInHousehold %in% c('marriage partner', 'child', 'other'),
    maritalStatus %in% c('unmarried','married','widowed','divorced'),
    if( gender == 'male' ) !pregnant,
    if( maritalStatus %in% c(
          'unmarried',
          'widowed',
          'divorced')
      ) !positionInHousehold %in% c('marriage partner','child')
    )
)





# Here is the prototypical categorical edit: men cannot be pregnant.
E <- editarray(expression(
    gender %in% c('male','female'),
    pregnant %in% c('yes','no'),
    if( gender == 'male' ) pregnant == 'no'
    )
)
E

# an editarray has a summary method:
summary(E)

# A yes/no variable may also be modeled as a logical:
editarray(expression(
    gender %in% c('male','female'),
    pregnant %in% c(TRUE, FALSE),
    if( gender == 'male' ) pregnant == FALSE
    )
)

# or, shorter (and using a character vector as input): 
editarray(expression(
    gender %in% c('male','female'),
    pregnant %in% c(TRUE, FALSE),
    if( gender == 'male' ) !pregnant
    )
)

# the %in% statement may be used at will
editarray(expression(
    gender %in% c('male','female'),
    pregnant %in% c(TRUE, FALSE),
    positionInHousehold %in% c('marriage partner', 'child', 'other'),
    maritalStatus %in% c('unmarried','married','widowed','divorced'),
    if( gender == 'male' ) !pregnant,
    if( maritalStatus %in% c(
          'unmarried',
          'widowed',
          'divorced')
      ) !positionInHousehold %in% c('marriage partner','child')
    )
)







