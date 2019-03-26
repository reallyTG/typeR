library(errorlocate)


### Name: MipRules-class
### Title: Create a mip object from a validator object
### Aliases: MipRules-class miprules

### ** Examples

rules <- validator(x > 1)
mr <- miprules(rules)
mr$to_lp()
mr$set_values(list(x=0, weight=list(x=1)))
mr$execute()



