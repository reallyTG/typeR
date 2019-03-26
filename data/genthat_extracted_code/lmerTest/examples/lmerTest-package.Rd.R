library(lmerTest)


### Name: lmerTest-package
### Title: lmerTest: Tests in Linear Mixed Effects Models
### Aliases: lmerTest-package lmerTest

### ** Examples


## load lmerTest package
library(lmerTest)

## Fit linear mixed model to the ham data:
fm <- lmer(Informed.liking ~ Gender + Information * Product + (1 | Consumer) +
             (1 | Consumer:Product), data=ham)

## Summary including coefficient table with p-values for t-statistics using
## Satterthwaite's method for denominator degrees of freedom:
summary(fm)

## Type III anova table with p-values for F-tests based on Satterthwaite's
## method:
(aov <- anova(fm))

## Inspect the contrast matrix for the Type III test of Product:
show_tests(aov, fractions = TRUE)$Product

## Choose type II anova table with Kenward-Roger method for the F-test:
## Not run: 
##D if(requireNamespace("pbkrtest", quietly = TRUE))
##D   anova(fm, type=2, ddf="Kenward-Roger")
## End(Not run)

## Anova-like table of random-effect terms using likelihood ratio tests:
ranova(fm)

## F-tests of 'single term deletions' for all marginal terms:
drop1(fm)

## Least-Square means and pairwise differences:
(lsm <- ls_means(fm))
ls_means(fm, which = "Product", pairwise = TRUE)

## ls_means also have plot and as.data.frame methods:
## Not run: 
##D plot(lsm, which=c("Product", "Information"))
##D as.data.frame(lsm)
##D ## Inspect the LS-means contrasts:
##D show_tests(lsm, fractions=TRUE)$Product
## End(Not run)

## Contrast test (contest) using a custom contrast:
## Here we make the 2-df joint test of the main effects of Gender and Information
(L <- diag(length(fixef(fm)))[2:3, ])
contest(fm, L = L)

## backward elimination of non-significant effects:
step_result <- step(fm)

## Elimination tables for random- and fixed-effect terms:
step_result

# Extract the model that step found:
final_model <- get_model(step_result)




