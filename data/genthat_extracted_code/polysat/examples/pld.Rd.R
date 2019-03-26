library(polysat)


### Name: pld
### Title: Accessor, Replacement, and Manipulation Functions for
###   '"ploidysuper"' Objects
### Aliases: pld pld<- plCollapse
### Keywords: methods manip

### ** Examples

test <- new("ploidymatrix", samples=c("a","b","c"),
            loci=c("l1","l2","l3"))
pld(test)       # view the ploidies
pld(test) <- 2  # make it diploid at all samples and loci
pld(test)["a",] <- c(2,4,4) # change the ploidies for sample a
pld(test, samples=c("a","b")) # view ploidies at a subset of samples

# test to see if the ploidies can be simplified
p <- plCollapse(test, na.rm=FALSE, returnvalue=TRUE)
p
# now change a ploidy and repeat the test
pld(test)["a","l1"] <- 4
p <- plCollapse(test, na.rm=FALSE, returnvalue=TRUE)
p
# change something else and collapse it further
pld(p)["a"] <- 2
p2 <- plCollapse(p, na.rm=FALSE, returnvalue=TRUE)
p2

# if na.rm=FALSE, NA values are not ignored:
pld(test)["a","l1"] <- NA
pld(test)
plCollapse(test, na.rm=FALSE, returnvalue=TRUE)
# NA values are ignored with na.rm=TRUE
plCollapse(test, na.rm=TRUE, returnvalue=TRUE)



