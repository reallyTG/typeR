library(validate)


### Name: sort,validation-method
### Title: Aggregate and sort the results of a validation.
### Aliases: sort,validation-method

### ** Examples


data(retailers)
retailers$id <- paste0("ret",1:nrow(retailers))
v <- validator(
    staff.costs/staff < 25
  , turnover + other.rev==total.rev)

cf <- confront(retailers,v,key="id")
a <- aggregate(cf,by='record')
head(a)

# or, get a sorted result:
s <- sort(cf, by='record')
head(s)





