library(highriskzone)


### Name: eval_hrz
### Title: Evaluation of the high-risk zone.
### Aliases: eval_hrz

### ** Examples

 data(craterB)
 # thin data
 set.seed(100)
 thdata <- thin(craterB, nxprob=0.1)
 
 # determine hrz for the "observed events"
 hrz <- det_hrz(thdata$observed, type = "dist", criterion = "area", cutoff = 1500000, nxprob = 0.1)
 
 # evaluate the hrz
 evaluation <- eval_hrz(hrz = hrz$zone, unobspp = thdata$unobserved, obspp = thdata$observed)
 evaluation$missingfrac
 
 op <- par(mar=c(1, 4, 1, 6) , xpd=TRUE)
 plot(evaluation, hrz = hrz, obspp = thdata$observed, plothrz = TRUE, plotobs = TRUE, 
 insidecol = "magenta", outsidecol = "magenta", obscol = "blue", insidepch = 1, 
 outsidepch = 19, main = "Evaluation visualized")
 legend(2400, 2456.4061, c("observed", "unobs inside", "unobs outside"), 
 col = c("blue", "magenta", "magenta"), yjust=1, pch=c(1, 1, 19), cex=0.8)
 par(op)



