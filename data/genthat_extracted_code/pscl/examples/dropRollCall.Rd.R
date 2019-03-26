library(pscl)


### Name: dropRollCall
### Title: drop user-specified elements from a rollcall object
### Aliases: dropRollCall
### Keywords: manip

### ** Examples

data(s109)
s109.working <- dropRollCall(s109,
                             dropList=list(lop=0))
summary(s109.working)

s109.working <- dropRollCall(s109,
                             dropList=list(lop=0,
                               code="notInLegis"))
summary(s109.working)

s109.working <- dropRollCall(s109,
                             dropList=list(lop=3,
                               code="notInLegis"))
summary(s109.working)

## note use of alist, since dropLegis is an expression
dropList <- alist(lop=3,
                 dropLegis=party!="D",
                 code="notInLegis")
s109.working <- dropRollCall(s109,dropList=dropList,debug=TRUE)
summary(s109.working)

s109.working <- dropRollCall(s109.working,dropList=list(legisMin=25))
summary(s109.working)


## Not run: 
##D ## read 102nd House from Poole web site
##D h102 <- readKH("ftp://voteview.ucsd.edu/dtaord/hou102kh.ord")
##D 
##D ## drop President from roll call matrix
##D h102 <- dropRollCall(h102,
##D                      dropList=alist(dropLegis=state=="USA"))
##D summary(h102)
## End(Not run)



