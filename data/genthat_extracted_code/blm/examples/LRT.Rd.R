library(blm)


### Name: LRT
### Title: Performs likelihood-ratio test for lexpit and BLM models of
###   cohort data
### Aliases: LRT

### ** Examples



cohort <- data.frame(
	x1 = runif(500),
	x2 = runif(500)
)

cohort$event <- rbinom(n=nrow(cohort),size=1,
			prob=0.25+0.1*cohort$x1+.1*cohort$x2)

fit <- blm(event~x1+x2, data=cohort)

summary(fit)

LRT(fit, "x1")
LRT(fit, "x2")




