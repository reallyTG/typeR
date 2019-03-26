library(mvmeta)


### Name: hyp
### Title: Ten Studies Assessing an Hypertension Treatment
### Aliases: hyp
### Keywords: datasets

### ** Examples

### REPRODUCE THE RESULTS IN JACKSON ET AL. (2013)

# INSPECT THE DATA
hyp

# INPUT THE CORRELATION (CAN ALSO BE INPUTTED DIRECTLY, SEE BELOW)
(S <- inputcov(hyp[c("sbp_se","dbp_se")],cor=hyp$rho))
# CHECK WITH THE FIRST STUDY
cov2cor(xpndMat(S[1,]))

# META-ANALYSIS, REML MODEL
model <- mvmeta(cbind(sbp,dbp),S=S,data=hyp)
print(summary(model),digits=2)
round(model$Psi,2)

# META-ANALYSIS, REML MODEL (INPUTTING THE CORRELATION DIRECTLY)
model <- mvmeta(cbind(sbp,dbp),S=cbind(sbp_se,dbp_se)^2,data=hyp,
  control=list(Scor=hyp$rho))
print(summary(model),digits=2)

# META-ANALYSIS, MM MODEL
model <- mvmeta(cbind(sbp,dbp),S=S,data=hyp,method="mm")
print(summary(model),digits=2)
round(model$Psi,2)

# META-REGRESSION, REML MODEL
model <- mvmeta(cbind(sbp,dbp)~ish,S=S,data=hyp)
print(summary(model),digits=2)

# META-REGRESSION, MM MODEL
model <- mvmeta(cbind(sbp,dbp)~ish,S=S,data=hyp,method="mm")
print(summary(model),digits=2)



