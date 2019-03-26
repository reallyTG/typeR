library(validate)


### Name: voptions
### Title: Set or get options globally or per object.
### Aliases: voptions voptions,ANY-method validate_options reset
###   reset,ANY-method voptions,expressionset-method
###   reset,expressionset-method

### ** Examples

# the default allowed validation symbols.
voptions('validator_symbols')

# set an option, local to a validator object:
v <- validator(x + y > z)
voptions(v,raise='all')
# check that local option was set:
voptions(v,'raise')
# check that global options have not changed:
voptions('raise')



