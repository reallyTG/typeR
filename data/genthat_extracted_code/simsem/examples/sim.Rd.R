library(simsem)


### Name: sim
### Title: Run a monte carlo simulation with a structural equation model.
### Aliases: sim

### ** Examples

# Please go to www.simsem.org for more examples.

# Example of using simsem model template
library(lavaan)

loading <- matrix(0, 6, 2)
loading[1:3, 1] <- NA
loading[4:6, 2] <- NA
LY <- bind(loading, 0.7)

latent.cor <- matrix(NA, 2, 2)
diag(latent.cor) <- 1
RPS <- binds(latent.cor, 0.5)

RTE <- binds(diag(6))

VY <- bind(rep(NA,6),2)

CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType = "CFA")

# In reality, more than 5 replications are needed.
Output <- sim(5, CFA.Model, n=200)
summary(Output)

# Example of using simsem model template

popModel <- "
f1 =~ 0.7*y1 + 0.7*y2 + 0.7*y3
f2 =~ 0.7*y4 + 0.7*y5 + 0.7*y6
f1 ~~ 1*f1
f2 ~~ 1*f2
f1 ~~ 0.5*f2
y1 ~~ 0.49*y1
y2 ~~ 0.49*y2
y3 ~~ 0.49*y3
y4 ~~ 0.49*y4
y5 ~~ 0.49*y5
y6 ~~ 0.49*y6
"

analysisModel <- "
f1 =~ y1 + y2 + y3
f2 =~ y4 + y5 + y6
"

Output <- sim(5, model=analysisModel, n=200, generate=popModel, std.lv=TRUE, lavaanfun = "cfa")
summary(Output)

# Example of using population data

pop <- data.frame(y1 = rnorm(100000, 0, 1), y2 = rnorm(100000, 0, 1))

covModel <- "
y1 ~~ y2
"

Output <- sim(5, model=covModel, n=200, rawData=pop, lavaanfun = "cfa")
summary(Output)

# Example of data transformation: Transforming to standard score
fun1 <- function(data) {
	temp <- scale(data)
	as.data.frame(temp)
}

# Example of additional output: Extract modification indices from lavaan
fun2 <- function(out) {
	inspect(out, "mi")
}

# In reality, more than 5 replications are needed.
Output <- sim(5, CFA.Model,n=200,datafun=fun1, outfun=fun2)
summary(Output)

# Get modification indices
getExtraOutput(Output)

# Example of additional output: Comparing latent variable correlation

outfundata <- function(out, data) {
	predictcor <- inspect(out, "coef")$psi[2, 1]
	latentvar <- attr(data, "latentVar")[,c("f1", "f2")]
	latentcor <- cor(latentvar)[2,1]
	latentcor - predictcor
}

Output <- sim(5, CFA.Model,n=200, sequential = TRUE, saveLatentVar = TRUE, 
	outfundata = outfundata)
	
getExtraOutput(Output)

# Example of analyze using a function

analyzeFUN <- function(data) {
	out <- lm(y2 ~ y1, data=data)
	coef <- coef(out)
	se <- sqrt(diag(vcov(out)))
	fit <- c(loglik = as.numeric(logLik(out)))
	converged <- TRUE # Assume to be convergent all the time
	return(list(coef = coef, se = se, fit = fit, converged = converged))
}

Output <- sim(5, model=analyzeFUN, n=200, rawData=pop, lavaanfun = "cfa")
summary(Output)



