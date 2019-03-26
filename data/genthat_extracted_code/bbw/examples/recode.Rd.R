library(bbw)


### Name: recode
### Title: Recode
### Aliases: recode

### ** Examples

# Recode values from 1 to 9 to varios specifications
var <- sample(x = 1:9, size = 100, replace = TRUE)

# Recode single values
recode(var = var, recodes = "9=NA")

# Recode set of values
recode(var = var, recodes = "c(1,2,5)=1")

# Recode range of values
recode(var = var, recodes = "1:3=1;4:6=2;7:9=3")

# Recode other values
recode(var = var, recodes = "c(1,2,5)=1;else=NA")




