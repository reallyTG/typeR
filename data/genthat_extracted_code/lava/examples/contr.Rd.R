library(lava)


### Name: contr
### Title: Create contrast matrix
### Aliases: contr parsedesign

### ** Examples

contr(2,n=5)
contr(as.list(2:4),n=5)
contr(list(1,2,4),n=5)
contr(c(2,3,4),n=5)
contr(list(c(1,3),c(2,4)),n=5)
contr(list(c(1,3),c(2,4),5))

parsedesign(c("aa","b","c"),"?","?",diff=c(FALSE,TRUE))



