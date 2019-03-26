library(HandTill2001)


### Name: bincap
### Title: a ui-constructor for Class '"bincap"' in Package 'HandTill2001'
### Aliases: bincap
### Keywords: ui-constructor

### ** Examples

library(HandTill2001)
data(ht01.twoclass)
str(ht01.twoclass$observed)
message("note that ht01.twoclass$observed is not a factor; we have to convert it.")
bincap(
    response = as.factor(ht01.twoclass$observed)
    , predicted = ht01.twoclass$predicted
    , true = c("1")
    )




