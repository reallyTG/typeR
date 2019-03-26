library(mratios)


### Name: gsci.ratio
### Title: Simultaneous confidence intervals for ratios of linear
###   combinations of parameters.
### Aliases: gsci.ratio
### Keywords: htest

### ** Examples


library(mratios)

##############################################################

# A 90-days chronic toxicity assay:
# Which of the doses (groups 2,3,4) do not show a decrease in
# bodyweight more pronounced than 90 percent of the bodyweight
# in the control group?

#############################################################

data(BW)
boxplot(Weight~Dose,data=BW)

lmfit <- lm(Weight~Dose-1, data=BW)
est <- coefficients(lmfit)
vc <- vcov(lmfit)
CMAT <- contrMatRatio(table(BW$Dose), type="Dunnett")

BWnoninf <- gsci.ratio(est, vc, CMAT$numC, CMAT$denC,
 alternative="greater", degfree=lmfit$df.residual)

BWnoninf

# Plot
plot(BWnoninf, rho0=0.9)

##############################################################

#### Mixed Model Example

##############################################################

library("nlme")
data(Milk)

# Fit a linear mixed model (maybe there are nicer models available!)

lmefit <- lme(protein ~ Diet-1, data=Milk,
 random=~Time|Cow, correlation=corAR1(form=~Time|Cow))

# Extract the parameter estimates and the corresponding
# variance-covariance matrix

estm <- fixef(lmefit)
vcm <- vcov(lmefit)


# Define the matrices defining the ratios of interest for
# all-pair comparisons: CM is the numerator matrix and 
# DM is the denominator matrix.

CM <- rbind(c(1,0,0),
            c(1,0,0),
            c(0,1,0))
DM <- rbind(c(0,1,0),
            c(0,0,1),
            c(0,0,1))

# Add some row names (This is optional!)

rownames(CM) <- c("b/b+l", "b/l", "b+l/l")

# Calculate and plot simultaneous confidence intervals:

gscimix <- gsci.ratio(estm, vcm, CM, DM, degfree=anova(lmefit)[,2])
plot(gscimix)




