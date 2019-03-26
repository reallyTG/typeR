library(ChoiceModelR)


### Name: choicemodelr
### Title: Choice Modeling in R
### Aliases: choicemodelr
### Keywords: package models multivariate

### ** Examples


# EXAMPLE 1: MULTINOMIAL LOGIT

# LOAD ARTIFICIAL (SIMULATED) DATA THAT WAS CREATED 
# BY R CODE FOUND IN datar SECTION OF THE HELP FILES.

data(datar)
data(truebetas)

# USE choicemodelr TO ESTIMATE THE PARAMETERS OF THE CHOICE MODEL.
# FOR CONVERGENCE OF MCMC CHAIN, SET R = 4000 AND use = 2000.

xcoding = c(0, 0)
mcmc = list(R = 10, use = 10)

options = list(none=FALSE, save=TRUE, keep=1)

attlevels = c(5, 3)
constype =  c(0, 1)
constraints = vector("list", 2)

for (i in 1:length(attlevels)) {
	constraints[[i]] = diag(0, attlevels[i])
	if (constype[i] == 1) {
		constraints[[i]][upper.tri(constraints[[i]])] = -1
	}
	else if (constype[i] == 2) {
		constraints[[i]][upper.tri(constraints[[i]])] = 1
	}
}

out = choicemodelr(datar, xcoding, mcmc = mcmc, options = options, constraints = constraints)

# CALCULATE MEAN ABSOLUTE ERROR BETWEEN ESTIMATED AND TRUE BETAS.
estbetas = apply(out$betadraw.c,c(1,2),mean)
estbetas = cbind(estbetas[,1:4],0-apply(estbetas[,1:4],1,sum),estbetas[,5:6],0-apply(estbetas[,5:6],1,sum))
colnames(estbetas) = c("A1B1", "A1B2", "A1B3", "A1B4", "A1B5", "A2B1", "A2B2", "A2B3")

MAE = mean(abs(estbetas - truebetas))
print(MAE)

# CALCULATE MEAN ABSOLUTE ERROR BETWEEN PROBABILITY
# DIFFERENCES USING ESTIMATED AND TRUE BETAS. 

TrueProb = cbind(exp(truebetas[,1:5]) / apply(exp(truebetas[,1:5]),1,sum),
                 exp(truebetas[,6:8]) / apply(exp(truebetas[,6:8]),1,sum))
EstProb = cbind(exp(estbetas[,1:5]) / apply(exp(estbetas[,1:5]),1,sum),
                exp(estbetas[,6:8]) / apply(exp(estbetas[,6:8]),1,sum))
MAEProb = mean(abs(TrueProb - EstProb))

print(MAEProb)


# EXAMPLE 2: FRACTIONAL MULTINOMIAL LOGIT

# LOAD ARTIFICIAL (SIMULATED) FRACTIONAL MULTINOMIAL LOGIT DATA CREATED 
# BY R CODE FOUND IN sharedatar SECTION OF THE HELP FILES.

data(sharedatar)
data(truebetas)

# USE choicemodelr TO ESTIMATE THE PARAMETERS OF THE CHOICE MODEL.
# FOR CONVERGENCE OF MCMC CHAIN, SET R = 2000 AND use = 1000.

xcoding = c(0, 0)
mcmc = list(R = 10, use = 10)

options = list(none=FALSE, save=TRUE, keep=1)

attlevels = c(5, 3)
constype =  c(0, 1)
constraints = vector("list", 2)

for (i in 1:length(attlevels)) {
	constraints[[i]] = diag(0, attlevels[i])
	if (constype[i] == 1) {
		constraints[[i]][upper.tri(constraints[[i]])] = -1
	}
	else if (constype[i] == 2) {
		constraints[[i]][upper.tri(constraints[[i]])] = 1
	}
}

out = choicemodelr(sharedatar, xcoding, mcmc = mcmc, options = options, constraints = constraints)

# CALCULATE MEAN ABSOLUTE ERROR BETWEEN ESTIMATED AND TRUE BETAS.
estbetas = apply(out$betadraw.c,c(1,2),mean)
estbetas = cbind(estbetas[,1:4],0-apply(estbetas[,1:4],1,sum),estbetas[,5:6],0-apply(estbetas[,5:6],1,sum))
colnames(estbetas) = c("A1B1", "A1B2", "A1B3", "A1B4", "A1B5", "A2B1", "A2B2", "A2B3")

MAE = mean(abs(estbetas - truebetas))
print(MAE)

# CALCULATE MEAN ABSOLUTE ERROR BETWEEN PROBABILITY
# DIFFERENCES USING ESTIMATED AND TRUE BETAS. 

TrueProb = cbind(exp(truebetas[,1:5]) / apply(exp(truebetas[,1:5]),1,sum),
                 exp(truebetas[,6:8]) / apply(exp(truebetas[,6:8]),1,sum))
EstProb = cbind(exp(estbetas[,1:5]) / apply(exp(estbetas[,1:5]),1,sum),
                exp(estbetas[,6:8]) / apply(exp(estbetas[,6:8]),1,sum))
MAEProb = mean(abs(TrueProb - EstProb))

print(MAEProb)




