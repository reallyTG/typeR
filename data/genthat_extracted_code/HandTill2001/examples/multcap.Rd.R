library(HandTill2001)


### Name: multcap
### Title: a ui-constructor for Class '"multcap"' in Package 'HandTill2001'
### Aliases: multcap
### Keywords: ui-constructor

### ** Examples

library(HandTill2001)
data(ht01.multipleclass)
str(ht01.multipleclass$observed)
message("note that ht01.multipleclass$observed is a factor; we do not have to convert it.")
multcap(
     response = ht01.multipleclass$observed
    , predicted = as.matrix(ht01.multipleclass[, levels(ht01.multipleclass$observed)])
    )




