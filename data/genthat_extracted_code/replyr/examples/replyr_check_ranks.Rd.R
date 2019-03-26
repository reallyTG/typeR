library(replyr)


### Name: replyr_check_ranks
### Title: confirm data has good ranked groups
### Aliases: replyr_check_ranks

### ** Examples


d <- data.frame(Sepal_Length=c(5.8,5.7),Sepal_Width=c(4.0,4.4),
                Species='setosa',rank=c(1,2))
replyr_check_ranks(d,'Species','Sepal_Length','rank',  decreasing=TRUE)




