library(mcgibbsit)


### Name: mcgibbsit
### Title: Warnes and Raftery's MCGibbsit MCMC diagnostic
### Aliases: mcgibbsit print.mcgibbsit
### Keywords: models

### ** Examples


# this is a totally useless example, but it does exercise the code
for(i in 1:20){
  x <- matrix(rnorm(1000),ncol=4)
  x[,4] <- x[,4] + 1/3 * (x[,1] + x[,2] + x[,3])
  colnames(x) <- c("alpha","beta","gamma", "nu")
  write.csv(x, file=paste("mcmc",i,"csv",sep="."), row.names=FALSE)
}

data <- read.mcmc(20, "mcmc.#.csv", sep=",")

mcgibbsit(data)




