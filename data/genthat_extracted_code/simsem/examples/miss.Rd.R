library(simsem)


### Name: miss
### Title: Specifying the missing template to impose on a dataset
### Aliases: miss

### ** Examples

#Example of imposing 10% MCAR missing in all variables with no imputations (FIML method)
Missing <- miss(pmMCAR=0.1, ignoreCols="group")
summary(Missing)

loading <- matrix(0, 6, 1)
loading[1:6, 1] <- NA
LY <- bind(loading, 0.7)
RPS <- binds(diag(1))
RTE <- binds(diag(6))
CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType="CFA")

#Create data
dat <- generate(CFA.Model, n = 20)

#Impose missing
datmiss <- impose(Missing, dat)

#Analyze data
out <- analyze(CFA.Model, datmiss)
summary(out)

#Missing using logistic regression
script <- 'y1 ~ 0.05 + 0.1*y2 + 0.3*y3
	y4 ~ -2 + 0.1*y4
	y5 ~ -0.5'
Missing2 <- miss(logit=script, pmMCAR=0.1, ignoreCols="group")
summary(Missing2)
datmiss2 <- impose(Missing2, dat)

#Missing using logistic regression (2)
script <- 'y1 ~ 0.05 + 0.5*y3
	y2 ~ p(0.2)
	y3 ~ p(0.1) + -1*y1
	y4 ~ p(0.3) + 0.2*y1 + -0.3*y2
	y5 ~ -0.5'
Missing2 <- miss(logit=script)
summary(Missing2)
datmiss2 <- impose(Missing2, dat)

#Example to create simMissing object for 3 forms design at 3 timepoints with 10 imputations
Missing <- miss(nforms=3, timePoints=3, numImps=10)

#Missing template for data analysis with multiple imputation
Missing <- miss(package="mice", m=10, convergentCutoff=0.6)



