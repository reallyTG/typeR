library(emulator)


### Name: makeinputfiles
### Title: Makes input files for condor runs of goldstein
### Aliases: makeinputfiles sample.from.exp.est
### Keywords: models

### ** Examples

## Not run: 
##D   data(expert.estimates) system("mkdir /users/sat/rksh/tmp",ignore=TRUE)
##D   makeinputfiles(number.of.runs = 100, gaussian = TRUE,
##D   directoryname="~/tmp/", expert.estimate=expert.estimates)
## End(Not run)
data(results.table)
data(expert.estimates)


output.col <- 25
wanted.row <- 1:27
wanted.cols <- c(2:9,12:19)

val <- results.table[wanted.row , wanted.cols]

mins  <- expert.estimates$low 
maxes <- expert.estimates$high

normalize <- function(x){(x-mins)/(maxes-mins)}
unnormalize <- function(x){mins + (maxes-mins)*x}

jj <- t(apply(val,1,normalize))

jj <- as.data.frame(jj)
names(jj) <- names(val)
val <- as.matrix(jj)

scales.optim <- exp(c( -2.63, -3.03, -2.24, 2.61,
-1.65, -3.13, -3.52, 3.16, -3.32, -2.53, -0.25,  -2.55, -4.98, -1.59,
-4.40, -0.81))

d  <- results.table[wanted.row ,  output.col]
A <- corr.matrix(val, scales=scales.optim)
Ainv <- solve(A)

x <- sample.from.exp.est(1000,exp=expert.estimates)
x <- t(apply(x,1,normalize))
ensemble <- interpolant.quick(x , d , val , Ainv, scales=scales.optim) 
hist(ensemble)



