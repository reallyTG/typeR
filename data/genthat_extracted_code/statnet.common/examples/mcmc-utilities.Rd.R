library(statnet.common)


### Name: mcmc-utilities
### Title: Utility operations for 'mcmc.list' objects
### Aliases: mcmc-utilities colMeans.mcmc.list sweep.mcmc.list
###   lapply.mcmc.list

### ** Examples

data(line, package="coda")
summary(line) # coda
colMeans.mcmc.list(line) # "Method"
## Don't show: 
stopifnot(isTRUE(all.equal(summary(line)$statistics[,"Mean"],colMeans.mcmc.list(line))))
## End(Don't show)
data(line, package="coda")
colMeans.mcmc.list(line)-1:3
colMeans.mcmc.list(sweep.mcmc.list(line, 1:3))
## Don't show: 
stopifnot(isTRUE(all.equal(colMeans.mcmc.list(sweep.mcmc.list(line, 1:3)), colMeans.mcmc.list(line)-1:3)))
## End(Don't show)
if(getRversion()<'3.5' && .Platform$OS.type=="windows"){
message("Windows versions of R prior to 3.5.0 appear ",
        "to have a bug that causes this example to fail.")
}else{
data(line, package="coda")
print(colMeans.mcmc.list(line)[c(2,3,1)])
print(colMeans.mcmc.list(lapply.mcmc.list(line, `[`,,c(2,3,1))))
## Don't show: 
stopifnot(isTRUE(all.equal(colMeans.mcmc.list(line)[c(2,3,1)],colMeans.mcmc.list(lapply.mcmc.list(line, `[`,,c(2,3,1))))))
## End(Don't show)
}



