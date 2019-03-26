library(stepp)


### Name: aspirin
### Title: The aspirin data set.
### Aliases: aspirin
### Keywords: datasets

### ** Examples

data(aspirin)

# remove cases with missing data
aspirinc <- aspirin[complete.cases(aspirin),]

# make a subset of patients with placebo and 81 mg
attach(aspirinc)
subset1  <- DOSE == 0 | DOSE == 81
aspirin1 <- aspirinc[subset1,]
detach(aspirinc)

# set up treatment assignment
trtA     <- rep(0, dim(aspirin1)[1])
trtA[aspirin1[,"DOSE"] == 81] <- 1

# STEPP analysis A: placebo vs 81 mg aspirin
attach(aspirin1)
inc_win     <- stepp.win(type="sliding", r1=30, r2=100)
inc_sp      <- stepp.subpop(swin=inc_win, cov=AGE)

ADorLE      <- as.numeric(AD==1 | AL==1)
modelA      <- stepp.GLM(coltrt=trtA, trts=c(0,1), colY=ADorLE, glm="binomial", debug=0)
# Warning: In this example, the permutations have been set to 50 to allow the function
# to finish in a short amount of time.  IT IS RECOMMEND TO USE AT LEAST 2500 PERMUTATIONS TO 
# PROVIDE STABLE RESULTS.
steppGLMA   <- stepp.test(inc_sp, modelA, nperm=50)
summary(steppGLMA)
print(steppGLMA)
plot(steppGLMA, ncex=0.70, legendy=30,
	pline=-4.5, color=c("red","black"),
	xlabel="Subpopulations by Median Age", ylabel="Risk",
	tlegend=c("Placebo", "81 mg aspirin"), nlas=3, pointwise=FALSE, noyscale=TRUE, rug=FALSE)

detach(aspirin1)



