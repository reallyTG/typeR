library(survMisc)


### Name: autoplotTen
### Title: Generate a 'ggplot' for a 'survfit' or 'ten' object
### Aliases: autoplotTen autoplot autoplot.ten autoplot.stratTen
###   autoplot.survfit
### Keywords: hplot survival

### ** Examples

## examples are slow to run; see vignette for output from these
## Not run: 
##D ### autoplot.ten
##D data("kidney", package="KMsurv")
##D t1 <- ten(survfit(Surv(time, delta) ~ type, data=kidney))
##D autoplot(t1)
##D autoplot(t1, type="fill", survLineSize=2, jitter="all")
##D autoplot(t1, timeTicks="months", 
##D  type="CI", jitter="all",
##D  legLabs=c("surgical", "percutaneous"),
##D  title="Time to infection following catheter placement \n
##D    by type of catheter, for dialysis patients",
##D  titleSize=10, censSize=2)$plot
##D t2 <- ten(survfit(Surv(time=time, event=delta) ~ 1, data=kidney))
##D autoplot(t2, legLabs="")$plot
##D autoplot(t2, legend=FALSE)
##D data("rectum.dat", package="km.ci")
##D t3 <- ten(survfit(Surv(time, status) ~ 1, data=rectum.dat))
##D ## change confidence intervals to log Equal-Precision confidence bands
##D ci(t3, how="nair", tL=1, tU=40)
##D autoplot(t3, type="fill", legend=FALSE)$plot
##D ## manually changing the output
##D t4 <- ten(survfit(Surv(time, delta) ~ type, data=kidney))
##D (a4 <- autoplot(t4, type="CI", alpha=0.8, survLineSize=2)$plot)
##D ## change default colors
##D a4 + list(ggplot2::scale_color_manual(values=c("red", "blue")),
##D           ggplot2::scale_fill_manual(values=c("red", "blue")))
##D ## change limits of y-axis
##D suppressMessages(a4 + ggplot2::scale_y_continuous(limits=c(0, 1)))
## End(Not run)
## Not run: 
##D data("pbc", package="survival")
##D t1 <- ten(Surv(time, status==2) ~ trt + strata(edema), data=pbc, abbNames=FALSE)
##D autoplot(t1)
## End(Not run)
### autoplot.survfit
## Not run: 
##D data(kidney, package="KMsurv")
##D s1 <- survfit(Surv(time, delta) ~ type, data=kidney)
##D autoplot(s1, type="fill", survLineSize=2)
##D autoplot(s1, type="CI", pVal=TRUE, pX=0.3,
##D  legLabs=c("surgical", "percutaneous"),
##D  title="Time to infection following catheter placement \n
##D    by type of catheter, for dialysis patients")$plot
##D s1 <- survfit(Surv(time=time, event=delta) ~ 1, data=kidney)
##D autoplot(s1, legLabs="")$plot
##D autoplot(s1, legend=FALSE)$plot
##D data(rectum.dat, package="km.ci")
##D s1 <- survfit(Surv(time, status) ~ 1, data=rectum.dat)
##D ## change confidence intervals to log Equal-Precision confidence bands
##D if (require("km.ci")) {
##D  km.ci::km.ci(s1, method="logep")
##D  autoplot(s1, type="fill", legend=FALSE)$plot
##D }
##D ## manually changing the output
##D s1 <- survfit(Surv(time, delta) ~ type, data=kidney)
##D g1 <- autoplot(s1, type="CI", alpha=0.8, survLineSize=2)$plot
##D ## change default colors
##D g1 + ggplot2::scale_colour_manual(values=c("red", "blue")) +
##D     ggplot2::scale_fill_manual(values=c("red", "blue"))
##D ## change limits of y-axis
##D g1 + ggplot2::scale_y_continuous(limits=c(0, 1))
## End(Not run)



