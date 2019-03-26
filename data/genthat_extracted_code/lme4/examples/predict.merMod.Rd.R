library(lme4)


### Name: predict.merMod
### Title: Predictions from a model at new data values
### Aliases: predict.merMod

### ** Examples

(gm1 <- glmer(cbind(incidence, size - incidence) ~ period + (1 |herd), cbpp, binomial))
str(p0 <- predict(gm1))            # fitted values
str(p1 <- predict(gm1,re.form=NA))  # fitted values, unconditional (level-0)
newdata <- with(cbpp, expand.grid(period=unique(period), herd=unique(herd)))
str(p2 <- predict(gm1,newdata))    # new data, all RE
str(p3 <- predict(gm1,newdata,re.form=NA)) # new data, level-0
str(p4 <- predict(gm1,newdata,re.form= ~(1|herd))) # explicitly specify RE
stopifnot(identical(p2, p4))
## Don't show: 
suppressWarnings(stopifnot(identical(p1, predict(gm1,ReForm=NA))))
suppressWarnings(stopifnot(identical(p3, predict(gm1,newdata,REForm=NA))))
suppressWarnings(stopifnot(identical(p4, predict(gm1,newdata,REform=~(1|herd)))))

## predict() should work with variable names with spaces [as lm() does]:
dd <- expand.grid(y=1:3, "Animal ID" = 1:9)
fm <- lmer(y ~ 1 + (1 | `Animal ID`),  dd)
summary(fm)
isel <- c(7, 9, 11, 13:17, 20:22)
stopifnot(all.equal(vcov(fm)[1,1], 0.02564102564),
	  all.equal(unname(predict(fm, newdata = dd[isel,])),
		    unname( fitted(fm) [isel])))
## End(Don't show)



