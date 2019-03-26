library(ape)


### Name: all.equal.DNAbin
### Title: Compare DNA Sets
### Aliases: all.equal.DNAbin
### Keywords: manip

### ** Examples

data(woodmouse)
woodm2 <- woodmouse
woodm2[1, c(1:5, 10:12, 30:40)] <- as.DNAbin("g")
res <- all.equal(woodmouse, woodm2, plot = TRUE)
str(res)

## if used for testing in R programs:
isTRUE(all.equal(woodmouse, woodmouse)) # TRUE
isTRUE(all.equal(woodmouse, woodm2)) # FALSE

all.equal(woodmouse, woodmouse[15:1, ])
all.equal(woodmouse, woodmouse[-1, ])
all.equal(woodmouse, woodmouse[, -1])

## Not run: 
##D ## To run the followings you need internet and Clustal and MUSCLE
##D ## correctly installed.
##D ## Data from Johnson et al. (2006, Science)
##D refs <- paste("DQ082", 505:545, sep = "")
##D DNA <- read.GenBank(refs)
##D DNA.clustal <- clustal(DNA)
##D DNA.muscle <- muscle(DNA)
##D isTRUE(all.equal(DNA.clustal, DNA.muscle)) # FALSE
##D all.equal(DNA.clustal, DNA.muscle, TRUE)
## End(Not run)



