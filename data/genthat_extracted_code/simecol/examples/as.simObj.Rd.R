library(simecol)


### Name: as.simObj
### Title: Coerce simObj Objects to Lists and Vice-Versa
### Aliases: as.simObj coerce,simObj,list-method coerce,list,simObj-method
###   as.list,simObj-method as.simObj,list-method
### Keywords: misc

### ** Examples

data(lv3)
llv3 <- as(lv3, "list")
olv3 <- as(llv3, "simObj")

llv3 <- as.list(lv3)
olv3 <- as.simObj(llv3)

dput(as.list(lv3), control="useSource")
## Not run: 
##D ## save human readable object representation
##D dput(as.list(lv3), file="lv3.R", control=c("all"))
##D ## read it back and test it
##D l_lv3 <- dget("lv3.R")
##D o_lv3 <- as.simObj(l_lv3)
##D plot(sim(o_lv3))
## End(Not run)



