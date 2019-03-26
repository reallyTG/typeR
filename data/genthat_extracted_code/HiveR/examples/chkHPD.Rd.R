library(HiveR)


### Name: chkHPD
### Title: Verify the Integrity of a Hive Plot Data Object
### Aliases: chkHPD
### Keywords: utilities

### ** Examples


test4 <- ranHiveData(nx = 4)
good <- chkHPD(test4, confirm = TRUE)
# mess it up and do again
# next test is not run as it halts execution
## Not run: 
##D test4$nodes$color <- as.factor(test4$nodes$color)
##D bad <- chkHPD(test4)
## End(Not run)




