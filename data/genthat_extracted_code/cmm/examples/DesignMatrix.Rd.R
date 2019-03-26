library(cmm)


### Name: DesignMatrix
### Title: DesignMatrix
### Aliases: DesignMatrix
### Keywords: univar

### ** Examples


# Design matrix for independence model
var <- c("A","B")
suffconfigs <- list(c("A"),c("B"))
dim <- c(3, 3)
DesignMatrix(var,suffconfigs,dim)
# notation in one line
DesignMatrix(c("A","B"),list(c("A"),c("B")),c(3,3))


# Design matrix for saturated model, two short specifications giving same result
DesignMatrix(c("A","B"),c("A","B"),c(3,3))
DesignMatrix(c("A","B"),list(c("A","B")),c(3,3))


# Design matrix for univariate quadratic regression model
var <- c("A")
suffconfigs <- c("A")
dim <- c(5)
DesignMatrix(var,suffconfigs,dim,SubsetCoding=list(c("A"),"Quadratic"))
# notation in one line
DesignMatrix(c("A"),c("A"),c(5),SubsetCoding=list(c("A"),"Quadratic"))


# Design matrix for linear by nominal model, various methods:
# simplest method which assumes equidistant centered scores:
DesignMatrix(
 var = c("A","B"),
 suffconfigs = c("A", "B"),
 dim = c(3,3),
 SubsetCoding = list(c("A","B"),list("Linear","Nominal")))
# alternative specification with same result as above:
DesignMatrix(
 var = c("A", "B"),
 suffconfigs = c("A", "B"),
 dim = c(3, 3),
 SubsetCoding = list(c("A","B"),list(rbind(c(-1,0,1)),rbind(c(1,0,0),c(0,1,0)))))
# specifying your own category scores
scores <- c(1,2,5);
DesignMatrix(
 var = c("A","B"),
 suffconfigs = c("A","B"),
 dim = c(3, 3),
 SubsetCoding = list(c("A","B"), list(rbind(scores), "Nominal")))

# Design matrix for nominal by nominal model, equating parameters 
# of last two categories of second variable:
DesignMatrix(
 var = c("A", "B"),
 suffconfigs = c("A","B"),
 dim = c(3,3),
 SubsetCoding = list(c("A", "B"), list("Nominal", rbind(c(1, 0, 0), c(0, 1, 1)))))



