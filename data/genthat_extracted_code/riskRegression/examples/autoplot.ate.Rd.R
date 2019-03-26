library(riskRegression)


### Name: autoplot.ate
### Title: Plot Average Risks
### Aliases: autoplot.ate

### ** Examples

library(survival)
library(rms)

#### simulate data ####
n <- 1e2
set.seed(10)
dtS <- sampleData(n,outcome="survival")


#### Cox model ####
fit <- cph(formula = Surv(time,event)~ X1+X2,data=dtS,y=TRUE,x=TRUE)

#### Average treatment effect ####
seqTimes <- sort(unique(fit$y[,1]))
seqTimes5 <- seqTimes[seqTimes>5 & seqTimes<10]
ateFit <- ate(fit, data = dtS, treatment = "X1", contrasts = NULL,
              times = seqTimes, B = 0, band = TRUE, nsim.band = 500, y = TRUE,
              mc.cores=1)

#### display #### 
autoplot(ateFit)

outGG <- autoplot(ateFit, band = TRUE, ci = TRUE, alpha = 0.1)
dd <- as.data.frame(outGG$data[Treatment == 0])
outGG$plot + facet_wrap(~Treatment, labeller = label_both)




