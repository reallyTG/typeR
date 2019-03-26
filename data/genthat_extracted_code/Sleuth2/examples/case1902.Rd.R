library(Sleuth2)


### Name: case1902
### Title: Death Penalty and Race
### Aliases: case1902
### Keywords: datasets

### ** Examples

str(case1902)

# Add smidgeon to denominator because of zeros
empiricalodds <- with(case1902, Death/(Nodeath + .5))
plot(empiricalodds ~ as.numeric(Aggravation), case1902, log="y",
  pch=ifelse(Victim=="White", 21, 19),
  xlab="Aggravation Level of the Murder", ylab="Odds of Death Penalty")
legend(3.8,.02,legend=c("White Victim Murderers","Black Victim Murderers"),pch=c(21,19))

fitbig <- glm(cbind(Death,Nodeath) ~ Aggravation*Victim, case1902, family=binomial)
# No evidence of overdispersion; no statistically significant evidence
# of interactive effect 
anova(fitbig, test="Chisq") 
fitlinear <- glm(cbind(Death,Nodeath) ~ Aggravation + Victim, case1902, family=binomial)
summary(fitlinear)

# Mantel Haenszel Test, as an alternative
table1902   <- with(case1902, rbind(Death,Nodeath))
dim(table1902) <- c(2,2,6)
mantelhaen.test(table1902)



