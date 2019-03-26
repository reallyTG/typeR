library(rld)


### Name: calcVEk
### Title: Calculate Per-Challenge Vaccine Efficacy
### Aliases: calcVEk print.calcVEk summary.calcVEk print.summary.calcVEk
### Keywords: per-challenge vaccine efficacy

### ** Examples

data(SampleData)
augdata <- transdata(data = SampleData, ndlevel = 3, nexposure = c(10, 10, 2))
fitout <- rld(formula = survival::Surv(time, delta)~factor(dose)+trt+I(I(dose==3)*trt),
              data = augdata, frailty = TRUE)

contrgroup <- 1
refgroup <- 0
predata <- list(contrgroup, refgroup)
names(predata) <- c("contrgroup", "refgroup")
names(predata$contrgroup) <- c("trt")
names(predata$refgroup) <- c("trt")

VEkout <- calcVEk(object = fitout, newdata = predata, CIlevel = 0.95)
summary(VEkout)



