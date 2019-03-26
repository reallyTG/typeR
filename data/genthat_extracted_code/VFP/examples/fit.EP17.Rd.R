library(VFP)


### Name: fit.EP17
### Title: Fit CLSI EP17 Model Using log-transformaed X and Y.
### Aliases: fit.EP17

### ** Examples

## No test: 
# data from appendix D of CLSI EP17-A2 (pg. 54)
EP17.dat <- data.frame(
 Lot=c(rep("Lot1", 9), rep("Lot2", 9)),
	Mean=c(	0.04, 0.053, 0.08, 0.111, 0.137, 0.164, 0.19, 0.214, 0.245,
			0.041, 0.047, 0.077, 0.106, 0.136, 0.159, 0.182, 0.205, 0.234),
	CV=c(40.2, 29.6, 19.5, 15.1, 10.0, 7.4, 6.0, 7.5, 5.4,
		 44.1, 28.8, 15.1, 17.8, 11.4, 9.2, 8.4, 7.8, 6.2),
 SD=c(0.016, 0.016, 0.016, 0.017, 0.014, 0.012, 0.011, 0.016, 0.013,
		 0.018, 0.014, 0.012, 0.019, 0.016, 0.015, 0.015, 0.016, 0.014),
 DF=rep(1, 18)
)

EP17.dat$VC <- EP17.dat$SD^2

lot1 <- subset(EP17.dat, Lot=="Lot1")
lot2 <- subset(EP17.dat, Lot=="Lot2")

# function fit.EP17 is not exported, use package namesspace in call
fit.lot1 <- VFP:::fit.EP17(x=lot1$Mean, y=lot1$CV, typeY="cv", DF=lot1$DF)
## End(No test)



