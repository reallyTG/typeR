library(MLEcens)


### Name: cosmesis
### Title: Breast cosmesis data
### Aliases: cosmesis
### Keywords: datasets

### ** Examples

data(cosmesis)

# Split data according to treatment group
cosmesis0 <- cosmesis[cosmesis[,3]==0, 1:2]
cosmesis1 <- cosmesis[cosmesis[,3]==1, 1:2]
n0 <- nrow(cosmesis0)
n1 <- nrow(cosmesis1)

# Add dummy y-intervals (0,1)
cosmesis0 <- cbind(cosmesis0, rep(0,times=n0), rep(1,times=n0))
cosmesis1 <- cbind(cosmesis1, rep(0,times=n1), rep(1,times=n1))

# Compute MLEs in both treatment groups
mle0 <- computeMLE(cosmesis0)
mle1 <- computeMLE(cosmesis1)

# Plot MLEs
par(mfrow=c(2,2))

# Density for women who were treated with radio theorapy alone
plotDens1(mle0, margin=1, col="black", main="Density for time to breast   
 retraction (RT alone)", xlab="time (months)", ylab="density")

# Density for women who were treated with radio therapy + chemo therapy
plotDens1(mle1, margin=1, col="red", main="Density for time to breast
 retraction (RT+CT)", xlab="time (months)", ylab="density")

# Survival functions for both groups, plus legend
plotCDF1(mle0, margin=1, surv=TRUE, col="black", 
 main="Survival functions", xlab="time (months)", ylab="probability")
plotCDF1(mle1, margin=1, surv=TRUE, col="red", add=TRUE)
legend(3,.3,c("RT alone","RT+CT"), lty=1, col=c("black","red"))



