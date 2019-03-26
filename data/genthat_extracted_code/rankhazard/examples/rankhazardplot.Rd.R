library(rankhazard)


### Name: rankhazardplot
### Title: Create a Rank-hazard plot
### Aliases: rankhazardplot rankhazardplot.cph rankhazardplot.coxph
###   rankhazardplot.default
### Keywords: hplot survival

### ** Examples

library(survival)
library(rms)

data(pbc)
# new status variable
pbc$statusbin <- ifelse(pbc$status==0, 0, NA)
pbc$statusbin <- ifelse(pbc$status==2, 1, pbc$statusbin)
pbc$edema2 <- as.factor(pbc$edema)

### different ways to make a rank-hazard plot ###

coxmodel1 <- coxph(Surv(time, statusbin) ~ age + protime + 
                  as.factor(edema), data = pbc, x = TRUE)

par(mar = c(4, 5, 4, 2) + 0.1)
rankhazardplot(coxmodel1, data = pbc, 
               main = "Rank-hazardplot by coxphobj")

dd <- datadist(pbc)
options(datadist = 'dd')
cmodel1 <- cph(Surv(time, statusbin) ~ age + protime + edema2,
               data = pbc, x = TRUE)
rankhazardplot(cmodel1, data = pbc, 
               main = "Rank-hazardplot by cphobj")

output1 <- rankhazardplot(coxmodel1, data = pbc, draw = FALSE, 
                          return = TRUE)

rankhazardplot(x = output1$x, xp = output1$xp, 
               refvalues = output1$refvalues, 
               main = "Rank-hazardplot by x and xp")
rankhazardplot(x = output1$x[1:2], coefs = coxmodel1$coef[1:2], 
               main = "Rank-hazardplot by x and coefs \n with returned data")
rankhazardplot(x = pbc[c("age","protime")], coefs = coxmodel1$coef[1:2], 
               main = "Rank-hazardplot by x and coefs \n with original data")

rankhazardplot(x = output1$x, xp = output1$xp, refvalues = output1$refvalues,
               main = "Rank-hazardplot by x and xp")
rankhazardplot(x = output1$x[1:2], coefs = coxmodel1$coef[1:2], 
               main = "Rank-hazardplot by x and coefs \n with returned data")
rankhazardplot(x = pbc[c("age","protime")], coefs = coxmodel1$coef[1:2], 
               main = "Rank-hazardplot by x and coefs \n with original data")

### changing legend ###

rankhazardplot(coxmodel1, data = pbc, 
               main = "Rank-hazardplot by coxphobj",
               legendtext = c("age", "protime", "edema"), 
               legendlocation = "topleft")

rankhazardplot(coxmodel1, data = pbc, 
               main = "Rank-hazardplot by coxphobj",
               legendtext = c("age", "protime", "edema"), 
               legendlocation = "topleft", 
               args.legend = list(cex = 0.8, bty = "o"))
               
### selecting covariates ###

coxmodel2 <- coxph(Surv(time, statusbin) ~ age + protime + 
                     as.factor(edema) + bili + albumin + copper +
                     ast + as.factor(stage), data = pbc, x = TRUE)

par(mar = c(9, 5, 4, 2) + 0.1)
rankhazardplot(coxmodel2, data = pbc, args.legend= list(cex = 0.5),
               main = "Too much information?")

par(mar = c(4, 5, 4, 2) + 0.1)
rankhazardplot(coxmodel2, data = pbc, select = c(1, 5, 4), 
               main = "How to select covariates")

### highlighting the reference hazard ###

par(mfrow = c(1, 2))
rankhazardplot(coxmodel2, select = c(1, 5, 4), data = pbc,
               refline = TRUE, plottype = "hazard", 
               lty.refline = 3, main = "Reference line at 1")
rankhazardplot(coxmodel2, select = c(1, 5, 4), data = pbc, 
               refline = TRUE, plottype = "loghazard", 
               col.refline = "darkblue", 
               main = "Reference line at 0")
               
### using graphical parameters ###

# Compare the two following plots
rankhazardplot(coxmodel2, select = c(1, 3, 4, 5), data = pbc, 
               main = "By default")
par(mar = c(5, 5, 4, 2) + 0.1)
rankhazardplot(coxmodel2, select = c(1, 3, 4, 5), data = pbc,
               ylim = c(0.4, 10), ylab = "Relative hazard", 
               yvalues = c(0.4, 1, 2, 4, 6, 10),
               yticks = c(seq(0.4, 1, by = 0.1), 2:10),
               col = c("darkgreen","navyblue","maroon3",1), 
               pch = 18:21, lwd = 2, lty = c(1, 1, 2, 2), 
               cex = 0.9, bg = "yellow", pt.lwd = 2,
               main = "Graphical arguments in use",
               axistext = c("age", "stage", "bilirubin", "albumin"), 
               args.legend = list(cex = 0.8,
                 legend = c("age", "factor(stage)", "bilirubin", "albumin")))
                 
### comparing covariates from different models ###

# transforms #
# same model as coxmodel2, only bilirubin is transformed by logarithm
logmodel <- coxph(Surv(time, statusbin) ~ age + protime + 
                    as.factor(edema) + log(bili) + albumin + 
                    copper + ast + as.factor(stage), data = pbc, x = TRUE)
# same model as coxmodel2, only a pspline is fitted to bilirubin
coxspline <- coxph(Surv(time, statusbin) ~ age + protime + 
                     as.factor(edema) + pspline(bili) + albumin + 
                     copper + ast + as.factor(stage), data = pbc, x = TRUE)

par(mar = c(3, 5, 4, 2) + 0.1, mfrow = c(1, 1))

rankhazardplot(coxmodel2, data = pbc, select = 4, 
               legendtext = c( "bili","log(bili)", "pspline(bili)"), 
               args.legend = list(col = 1:3, pch = 0:2), 
               ylim = c(0.336, 10.7), cex.main = 0.8, 
               main = "Transforming has a great impact on
               interpreting the effect of the bilirubin")
# For next graph we want the same data that has been used 
# in fitting the model. We also want log-transformed values on the x-axis.
outputlog <- rankhazardplot(logmodel, data = pbc, 
                            return = TRUE, draw = FALSE) 
rankhazardplot(xp = outputlog$xp["log(bili)"], select = 4, 
               x = log(outputlog$x["bili"]), add = TRUE,
               refvalues = outputlog$ref["log(bili)"],  
               graphsbefore = 1, axistext = "log(bili)")
rankhazardplot(coxspline, data = pbc, select = 4, add = TRUE,
               graphsbefore = 2)

# comparing models that differ by one covariate #
# same model as coxmodel2, only age is left out
# how does it affect relative hazards for stage?
coxmodel3 <- coxph(Surv(time, statusbin) ~ protime + 
                     as.factor(edema) + log(bili) + albumin + 
                     copper + ast + as.factor(stage), data = pbc, 
                   x = TRUE)

par(mar = c(2, 5, 4, 2) + 0.1)
rankhazardplot(coxmodel2, data = pbc, select = 8, 
               args.legend = list(x = "bottomright", col = 1:2,
                legend = c("age in the model","age not in the model"), 
                pch = 0:2, cex = 0.7),
               axistext = "stage", cex.main = 0.8, 
               main = "Comparing the relative risk of 'stage' between
               similar models that differ by covariate 'age'")
rankhazardplot(coxmodel3, data = pbc, select = 7, add = TRUE, 
               graphsbefore = 1)

### changing reference points ###

# factors with non-numerical levels #
coxmodel4 <- coxph(Surv(time, statusbin) ~ age + sex, 
                   data = pbc, x = TRUE)
par(mfrow = c(1, 2))
rankhazardplot(coxmodel4, data = pbc, 
               main = "Reference points by default", 
               refline = TRUE, ylim = c(0.4, 3.8))
rankhazardplot(coxmodel4, refpoints = c(40, "f"), data = pbc,
               main = "Different reference points", 
               refline = TRUE, ylim = c(0.4, 3.8))

# with select argument and changing only part of reference points #
par(mfrow = c(1, 1))
rankhazardplot(coxmodel2, data = pbc, select = c(7, 1), 
               refpoints = c(100, NA), ylim = c(0.5, 4.3), 
               refline = TRUE, 
               main = "Reference point for age by default")

# using coefs argument #
coefs <- c(coxmodel2$coef["bili"],logmodel$coef["log(bili)"])
xlog <- data.frame(outputlog$x["bili"], log(outputlog$x["bili"]))
par(mar = c(3, 5, 4, 2) + 0.1)
rankhazardplot(x = xlog, coefs = coefs, refpoints = c(1.2, log(1.2)),
               legendtext = c("bili", "log(bili)"),  
               main = c("Reference point is 1.2, the maximum",
                        "\n value for 'normal' total bilirubin"))

# using add argument #
# this way the values on x-axis are always bili, not log(bili)
par(mar = c(2, 5, 4, 2) + 0.1)
rankhazardplot(coxmodel2, data = pbc, select = 4, refpoints = 1.2,
               ylim = c(0.375, 9.64),  
               args.legend = list(col = 1:2, pch = 0:1), 
               legendtext = c("bili", "log(bili)"))
rankhazardplot(logmodel, data = pbc, select = 4, refpoints = 1.2,
               add = TRUE, graphsbefore = 1)

# using xp argument #
output1_new_ref <- rankhazardplot(coxmodel1, data = pbc, 
                                  refpoints = c(40, 10,0), 
                                  draw = FALSE, return = TRUE)
rankhazardplot(x = output1_new_ref$x, xp = output1_new_ref$xp, 
               refvalues = output1_new_ref$refvalues, 
               main = "How to change the reference \n points when using xp")

### confidence intervals ###

par(mar = c(2, 5, 4, 2) + 0.1)
rankhazardplot(confinterval = output1$conf, 
               main = c("By argument confinterval,", 
                        "\n 95 per cent confidence intervals"))

rankhazardplot(coxmodel1, data = pbc, draw.confint = TRUE, 
               select = 1, col.CI = "red", lwd = 2, lwd.CI = 1,
               main = "By argument confint and \n using graphical arguments")

rankhazardplot(coxmodel1, data = pbc, draw.confint = TRUE, 
               select = 1, refpoints = 40, 
               main = "By argument confint and \n changing reference point")

rankhazardplot(coxmodel2, data = pbc, draw.confint = TRUE, 
               select = 5, col.CI = 2, lty.CI = 3, cex = 0.7,
               main = "99 per cent confidence intervals",
               CI_level = 0.99)

rankhazardplot(coxmodel2, data = pbc, draw.confint = TRUE, 
               select = 5, col.CI = 2, lty.CI = 3, cex = 0.7,
               main = "95 per cent confidence intervals", 
               ylim = c(0.208, 10.1))               

### data in start-stop format ###

data(cgd)
timemodel <- coxph(Surv(tstart, tstop, status) ~ treat + height + 
                     steroids, data = cgd, x = TRUE)
# steroids and height are in the model only to make 
# the example plot more interesting
rankhazardplot(timemodel, data = cgd[cgd$enum == 1,], 
               main = "Covariate values at study entry")




