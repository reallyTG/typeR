library(MASS)


### Name: nlschools
### Title: Eighth-Grade Pupils in the Netherlands
### Aliases: nlschools
### Keywords: datasets

### ** Examples

## Don't show: 
op <- options(digits=5)
## End(Don't show)
nl1 <- within(nlschools, {
IQave <- tapply(IQ, class, mean)[as.character(class)]
IQ <- IQ - IQave
})
cen <- c("IQ", "IQave", "SES")
nl1[cen] <- scale(nl1[cen], center = TRUE, scale = FALSE)

nl.lme <- nlme::lme(lang ~ IQ*COMB + IQave + SES,
                    random = ~ IQ | class, data = nl1)
summary(nl.lme)
## Don't show: 
options(op)
## End(Don't show)



