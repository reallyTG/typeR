library(Umpire)
# set seed to ensure reproducibility
set.seed(295997)
# set up the parameters for the test
nGenes <- 20
logmu <- rnorm(nGenes, 6, 1)
logsigma <- 1/rgamma(nGenes, rate=14, shape=6)
# create an object that generates independent log normal data
ln <- IndependentLogNormal(logmu, logsigma)
nrow(ln)
summary(ln)
# verify the means
if(any(logmu - ln@logmu)) {
  print("means do not match")
} else {
  print("means verified")
}
# verify the standard deviations
if(any(logsigma - ln@logsigma)) {
  print("standard deviations do not match")
} else {
  print("sd verified")
}
# generate some random variables
x <- rand(ln, 1000)
print(dim(x))
print(summary(x))
print(paste("'ln' should be valid:", validObject(ln)))
# break the validity of the object
ln@logsigma <- 1:3
try(
    print(paste("'ln' should not be valid:", validObject(ln, test=TRUE)))
    )
# see how the actual SD compares to the estimated one
tmp.sd <- sqrt(apply(log(x), 1, var))
plot(tmp.sd,logsigma)
# same for the means
tmp.mu<-apply(log(x), 1, mean)
plot(tmp.mu,logmu)
#cleanup
rm(nGenes, logmu, logsigma, ln, x, tmp.mu, tmp.sd)



