library(mcgibbsit)


### Name: read.mcmc
### Title: Read in data from a set of MCMC runs
### Aliases: read.mcmc
### Keywords: file

### ** Examples


# this is a totally useless example, but it does exercise the code
for(i in 1:20){
  x <- matrix(rnorm(1000),ncol=4)
  x[,4] <- x[,4] + 1/3 * (x[,1] + x[,2] + x[,3])
  colnames(x) <- c("alpha","beta","gamma", "nu")
  write.table(x, file=paste("mcmc",i,"csv",sep="."), sep=",",
                 row.names=FALSE)
}

data <- read.mcmc(20, "mcmc.#.csv", sep=",")

# a pedantic example
write.table(cbind(rnorm(700,10,2),rnorm(700,3,1),rnorm(700,8,1),
      rnorm(700,11,2)),file="dnzcY3e.1",row.names=FALSE)
write.table(cbind(rnorm(700,10,2),rnorm(700,3,1),rnorm(700,8,1),
      rnorm(700,11,2)),file="dnzcY3e.2",row.names=FALSE)
write.table(cbind(rnorm(700,10,2),rnorm(700,3,1),rnorm(700,8,1),
      rnorm(700,11,2)),file="dnzcY3e.3",row.names=FALSE)

output<-read.mcmc(3,"dnzcY3e.#") 
mcgibbsit(output)




