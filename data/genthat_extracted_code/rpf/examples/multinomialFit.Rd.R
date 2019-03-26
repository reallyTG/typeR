library(rpf)


### Name: multinomialFit
### Title: Multinomial fit test
### Aliases: multinomialFit

### ** Examples

# Create an example IFA group
grp <- list(spec=list())
grp$spec[1:10] <- rpf.grm()
grp$param <- sapply(grp$spec, rpf.rparam)
colnames(grp$param) <- paste("i", 1:10, sep="")
grp$mean <- 0
grp$cov <- diag(1)
grp$uniqueFree <- sum(grp$param != 0)
grp$data <- rpf.sample(1000, grp=grp)

# Monte-Carlo simulation study
mcReps <- 3    # increase this to 10,000 or so
stat <- rep(NA, mcReps)
for (rx in 1:mcReps) {
   t1 <- grp
   t1$data <- rpf.sample(grp=grp)
   stat[rx] <- multinomialFit(t1)$statistic
}
sum(multinomialFit(grp)$statistic > stat)/mcReps   # better p-value



