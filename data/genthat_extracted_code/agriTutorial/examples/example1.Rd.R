library(agriTutorial)


### Name: example1
### Title: Example 1: Split-plot design with one qualitative and one
###   quantitative level factor
### Aliases: example1

### ** Examples


## *************************************************************************************
##                       How to run the code
## *************************************************************************************

## Either type example("example1") to run ALL the examples succesively
## or copy and paste examples sucessively, as required

## *************************************************************************************
##                       Options and required packages
## *************************************************************************************

## Packages lmerTest, emmeans and pbkrtest MUST be installed
require(lmerTest)
require(emmeans)
require(pbkrtest)
options(contrasts = c('contr.treatment', 'contr.poly'))

## *************************************************************************************
##            Section 1: Qualitative analysis of factorial treatment effects
## *************************************************************************************

## Table 1 Full analysis of rice data assuming qualitative nitrogen effects
rice.aov1 = aov(yield ~ Replicate + management * variety * nitrogen +
Error(Replicate/Main/Sub), rice)
summary(rice.aov1, ddf = "Kenward-Roger", type = 1)
## No test: 
## Table 2 REML means and se's for additive management and qualitative nitrogen effects
rice.means = lmer(yield ~ Replicate + management + nitrogen * variety +
 (1|Replicate:Main) + (1|Replicate:Main:Sub), data = rice)
anova(rice.means, ddf = "Kenward-Roger", type = 1)
plot(rice.means, sub.caption = NA, ylab = "Residuals", xlab = "Fitted",
 main = "Full analysis with full nitrogen effects")
emmeans::emmeans(rice.means, ~ nitrogen)
emmeans::emmeans(rice.means, ~ variety)
emmeans::emmeans(rice.means, ~ nitrogen * variety)

## REML contrasts and sed's for additive management and qualitative nitrogen effects
n.v = emmeans::emmeans(rice.means, ~ nitrogen|variety)
emmeans::contrast(n.v, alpha = 0.05, method = "pairwise")
v.n = emmeans::emmeans(rice.means, ~ variety|nitrogen)
emmeans::contrast(v.n, alpha = 0.05, method = "pairwise")

## Table 3 Mixed model effects for rice data with significance tests
rice.lmer = lmer(yield ~ Replicate + nitrogen * management * variety + (1|Replicate:Main) +
 (1|Replicate:Main:Sub), data = rice)
anova(rice.lmer, ddf = "Kenward-Roger", type = 1)
## End(No test)

## *************************************************************************************
##            Section 2: Quantitative analysis of factorial treatment effects
## *************************************************************************************

## adds raw N polynomials to data frame: note that the nrate is re-scaled
N = poly((rice$nrate/100), 4, raw = TRUE)
colnames(N) = c("Linear_N", "Quadratic_N", "Cubic_N", "Quartic_N")
rice = cbind(rice, N)
## No test: 
## Table 7: Mixed model fitting raw polynomials for nitrogen effects
rice.fullN = lmer(yield ~ Replicate + management + variety * (Linear_N + Quadratic_N +
 Cubic_N + Quartic_N) + (1|Replicate:Main) + (1|Replicate:Main:Sub), data = rice)
anova(rice.fullN, ddf = "Kenward-Roger", type = 1)

## Table 8 Coefficients for separate linear and common quadratic N with additive management
rice.quadN = lmer(yield ~ Replicate + management + variety * Linear_N + Quadratic_N +
 (1|Replicate:Main) + (1|Replicate:Main:Sub), data = rice)
summary(rice.quadN, ddf = "Kenward-Roger")
## End(No test)

## *************************************************************************************
##                       Section 3: Model assumptions
## *************************************************************************************

## Full analysis of variance of block and treatment effects showing large mean square error
## due to variety-by-replicates interaction effects
rice.fullaov = aov(yield ~ Replicate*management * variety * nitrogen, rice)
summary(rice.fullaov, ddf = "Kenward-Roger", type = 1)

## Fig S1 Nitrogen response per variety per plot showing anomalous behaviour of Variety 1
## in Blocks 1 and 2 compared with Block 3
Rice = aggregate(rice$yield, by = list(rice$Replicate, rice$nitrogen, rice$variety),
 FUN = mean, na.rm = TRUE)
colnames(Rice) = c("Reps", "Nlev", "Vars", "Yield")
wideRice = reshape(Rice, timevar = "Nlev", idvar = c("Vars", "Reps"), direction = "wide")
wideRice = wideRice[,-c(1, 2)]
N = c(0, 50, 80, 110, 140)
par(mfrow = c(3, 3), oma = c(0, 0, 2, 0))
for (i in 1:3) {
for (j in 1:3) {
	plot(N, wideRice[(i - 1) * 3 + j, ], type = "l", ylab = "yield",
	main = paste("Variety",i,"Block",j), ylim = c(0, max(wideRice)))
	}
}
title(main = "Fig S1. Variety response to nitrogen for individual replicate blocks", outer = TRUE)

## Subset of data excluding variety 1
riceV2V3=droplevels(rice[rice$variety != "V1",])

## Restricted analysis of variance of block and treatment effects excluding variety 1
## compare variety-by-replicates interaction effects of full and restricted analysis
rice.fullaov = aov(yield ~ Replicate*management * variety * nitrogen, riceV2V3)
summary(rice.fullaov, ddf = "Kenward-Roger", type = 1)

## Restricted analysis assuming qualitative nitrogen effects excluding variety 1
rice.aov1 = aov(yield ~ Replicate + management * variety * nitrogen +
Error(Replicate/Main/Sub), riceV2V3)
summary(rice.aov1, ddf = "Kenward-Roger", type = 1)




