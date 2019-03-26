library(sweidnumbr)


### Name: luhn_algo
### Title: The Luhn algorithm
### Aliases: luhn_algo

### ** Examples

luhn_algo("121212121212", c(0,0,2,1,2,1,2,1,2,1,2,0))
luhn_algo(  "121212121",  c(      2,1,2,1,2,1,2,1,2))

## If no multiplier, the default is 
## to find one that match the format of id
luhn_algo("121212121212")
luhn_algo("12121212121")
luhn_algo("1212121212")
luhn_algo("121212121")

## Also for multiple pin 
## (as long they are all of the same format)
luhn_algo(c("12121212121", "19850504333"))
## Not run: 
##D try(luhn_algo(c("12121212121", "850504333"))) ## Different formats should fail!
## End(Not run)




