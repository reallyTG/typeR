## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- eval = TRUE--------------------------------------------------------
library(npROCRegression)
data(endosim)
summary(endosim)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Analysis for males
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fit.men <- INPROCreg(marker = "bmi", covariate = "age", group = "idf_status", 
						tag.healthy = 0, 
						data = subset(endosim, gender == "Men"), 
						ci.fit = TRUE, test = TRUE, 
						accuracy = c("EQ","TH"),
						accuracy.cal="AROC", 
						control=controlINPROCreg(p=1,kbin=30,step.p=0.01), 
						newdata = data.frame(age = seq(18,85,l=50)))

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Analysis for females
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fit.women <- INPROCreg(marker = "bmi", covariate = "age", group = "idf_status", 
						tag.healthy = 0, 
						data = subset(endosim, gender == "Women"), 
						ci.fit = TRUE, test = TRUE, 
						accuracy = c("EQ","TH"),
						accuracy.cal="ROC", 
						control=controlINPROCreg(p=1,kbin=30,step.p=0.01), 
						newdata = data.frame(age = seq(18,85,l=50)))


## ---- eval = TRUE--------------------------------------------------------
names(fit.men)

## ---- eval = TRUE--------------------------------------------------------
summary(fit.men)

summary(fit.women)

## ---- eval = TRUE, fig.height=14, fig.width=7, fig.cap = "Male population. Top row: Nonparametric estimates of BMI by age (years), along with 95% pointwise bootstrap confidence bands. Solid line: diseased population. Dashed line: healthy population. Left: Regression function. Right: Variance function. Second row: Estimated covariate-specific ROC curves and AUC along with 95% pointwise bootstrap confidence bands. Third and bottom rows: Estimated covariate-adjusted ROC curve (AROC) and estimated threshold curves for BMI (bottom panel), with the sensitivity and specificity linked to these values (right panel in third row), along with 95% pointwise bootstrap confidence bands"----
layout(matrix(c(1,1,2,2,3,3,4,4,5,5,6,6,0,7,7,0),4,4, byrow = TRUE), widths = c(1.75,1.75,1.75,1.75), heights = c(3.5,3.5,3.5,3.5))
plot(fit.men, ask = FALSE)

## ---- eval = TRUE, fig.height=14, fig.width=7, fig.cap = "Female population. Top row: Nonparametric estimates of BMI by age (years), along with 95% pointwise bootstrap confidence bands. Solid line: diseased population. Dashed line: healthy population. Left: Regression function. Right: Variance function. Second row: Estimated covariate-specific ROC curves and AUC along with 95% pointwise bootstrap confidence bands. Third and bottom rows: Estimated covariate-adjusted ROC curve (AROC) and estimated threshold curves for BMI (bottom panel), with the sensitivity and specificity linked to these values (right panel in third row), along with 95% pointwise bootstrap confidence bands"----
layout(matrix(c(1,1,2,2,3,3,4,4,5,5,6,6,0,7,7,0),4,4, byrow = TRUE), widths = c(1.75,1.75,1.75,1.75), heights = c(3.5,3.5,3.5,3.5))
plot(fit.women, ask = FALSE)

## ---- eval = TRUE--------------------------------------------------------
library(npROCRegression)
data(endosim)

fit.endo <- DNPROCreg(marker = "bmi", formula.h = "~ gender + s(age) + s(age, by = gender)", 
				formula.ROC = "~ gender + s(age) + s(age, by = gender)", 
				group = "idf_status", 
				tag.healthy = 0, 
				data = endosim, 
				control = list(card.P=50, kbin=30, step.p=0.02),
				ci.fit = TRUE, test.partial = 3)

## ---- eval = TRUE--------------------------------------------------------
names(fit.endo)

## ---- eval = TRUE--------------------------------------------------------
summary(fit.endo)

## ---- eval = TRUE, warning=FALSE, fig.cap = "Estimated covariate-specific ROC curves and AUCs, along with 95% pointwise bootstrap confidence interval, in male and female populations.", fig.height=7, fig.width=7----
layout(matrix(c(1,3,2,4),2,2, byrow = FALSE), widths = c(3.5,3.5), heights = c(3.5,3.5))
plot(fit.endo, ask = FALSE)

## ---- eval = TRUE, warning = FALSE, fig.cap = "Nonparametric estimates of partial functions (solid lines), along with 95% pointwise bootstrap confidence interval (dashed lines).", fig.height=7, fig.width=7----
names(fit.endo$pfunctions)
names(fit.endo$pfunctions$covariates)
names(fit.endo$pfunctions$fpf)

layout(matrix(c(1,3,2,4),2,2, byrow = FALSE), widths = c(3.5,3.5), heights = c(3.5,3.5))
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Main effect of age
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sel.row <- fit.endo$newdata$gender == "Women" # Same effect for both genders
plot(fit.endo$newdata$age[sel.row],fit.endo$pfunctions$covariates[sel.row, "s(age)"], xlab="age", ylab="s(age)", type="l", main = "Main effect of age", ylim=c(-1,1))
lines(fit.endo$newdata$age[sel.row], fit.endo$pfunctions$covariates[sel.row, "s(age)ul"], lty=2)
lines(fit.endo$newdata$age[sel.row], fit.endo$pfunctions$covariates[sel.row, "s(age)ll"], lty=2)
abline(h = 0, col="grey")

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Effect of age: deviation for males
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sel.row <- fit.endo$newdata$gender == "Women"
plot(fit.endo$newdata$age[sel.row], fit.endo$pfunctions$covariates[sel.row, "s(age, by = gender)"], xlab="age", ylab = "s(age, by=gender)", type = "l", main = " Age effect: Deviation for males", ylim = c(-1.2, 0.8))
lines(fit.endo$newdata$age[sel.row], fit.endo$pfunctions$covariates[sel.row, "s(age, by = gender)ul"], lty=2)
lines(fit.endo$newdata$age[sel.row], fit.endo$pfunctions$covariates[sel.row, "s(age, by = gender)ll"], lty=2)
abline(h = 0, col="grey")

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Effect of age: deviation for females
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
sel.row <- fit.endo$newdata$gender == "Men"
plot(fit.endo$newdata$age[sel.row], fit.endo$pfunctions$covariates[sel.row, "s(age, by = gender)"], xlab="age", ylab = "s(age, by=gender)", type = "l", main = " Age effect: Deviation for females", ylim = c(-0.8, 1.2))
lines(fit.endo$newdata$age[sel.row], fit.endo$pfunctions$covariates[sel.row, "s(age, by = gender)ul"], lty=2)
lines(fit.endo$newdata$age[sel.row], fit.endo$pfunctions$covariates[sel.row, "s(age, by = gender)ll"], lty=2)
abline(h = 0, col="grey")

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Effect of FPF
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
plot(fit.endo$fpf, fit.endo$pfunctions$fpf[,1], xlab = "fpf", ylab = "s(fpf)", main = "False positive fraction", type="l")
lines(fit.endo$fpf, fit.endo$pfunctions$fpf[,2], lty=2)
lines(fit.endo$fpf, fit.endo$pfunctions$fpf[,3], lty=2)
abline(h = 0, col="grey")

