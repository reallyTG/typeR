library(cem)


### Name: att
### Title: Example of ATT estimation from CEM output
### Aliases: att plot.cem.att summary.cem.att
### Keywords: multivariate

### ** Examples
 
data(LL)

# cem match: automatic bin choice
mat <- cem(treatment="treated",data=LL, drop="re78", keep.all=TRUE)
mat
mat$k2k

# ATT estimate
homo1 <- att(mat, re78~treated,  data=LL)
rand1 <- att(mat, re78~treated,  data=LL, model="linear-RE")
rf1 <- att(mat, re78~treated,  data=LL, model="rf")

homo2 <- att(mat, re78~treated,  data=LL, extra=TRUE)
rand2 <- att(mat, re78~treated,  data=LL, model="linear-RE", extra=TRUE)
rf2 <- att(mat, re78~treated,  data=LL, model="rf", extra=TRUE)

homo1
summary(homo1)

rand1
rf1

homo2
rand2
rf2

plot( homo1, mat, LL, vars=c("age","education","re74","re75"))
plot( rand1, mat, LL, vars=c("age","education","re74","re75"))
plot( rf1, mat, LL, vars=c("age","education","re74","re75"))

plot( homo2, mat, LL, vars=c("age","education","re74","re75"))
plot( rand2, mat, LL, vars=c("age","education","re74","re75"))
plot( rf2, mat, LL, vars=c("age","education","re74","re75"))


# reduce the match into k2k using euclidean distance within cem strata
mat2 <- k2k(mat, LL, "euclidean", 1)
mat2
mat2$k2k

# ATT estimate after k2k
att(mat2, re78~treated, data=LL)

# example with missing data
# using multiply imputated data
# we use Amelia for multiple imputation
## Not run: 
##D 
##D  if(require(Amelia)){
##D   data(LL)
##D   n <- dim(LL)[1]
##D   k <- dim(LL)[2]
##D 
##D # we generate missing values in 30##D 
##D # randomly in one colum per row
##D   LL1 <- LL
##D   idx <- sample(1:n, .3*n)
##D   invisible(sapply(idx, function(x) LL1[x,sample(2:k,1)] <<- NA))
##D 
##D 
##D   imputed <- amelia(LL1)
##D   imputed <- imputed$imputations[1:5]
##D 
##D   mat <- cem("treated", datalist=imputed, data=LL1, drop="re78")
##D 
##D   print(mat)
##D   
##D   att(mat, re78 ~ treated, data=imputed)
##D  }
## End(Not run)



