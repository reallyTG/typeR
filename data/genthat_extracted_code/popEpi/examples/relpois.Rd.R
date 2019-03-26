library(popEpi)


### Name: relpois
### Title: Excess hazard Poisson model
### Aliases: relpois

### ** Examples

## use the simulated rectal cancer cohort
data("sire", package = "popEpi")
sire$agegr <- cut(sire$dg_age, c(0,45,60,Inf), right=FALSE)

## usable straight away after splitting
fb <- c(0,3/12,6/12,1,2,3,4,5)
x <- lexpand(sire, birth = bi_date, entry = dg_date,
             exit = ex_date, status=status,
             breaks = list(fot=fb), pophaz=popmort)
rpm <- relpois(x, formula = lex.Xst %in% 1:2 ~ FOT + agegr)
 
## some methods for glm work. e.g. test for interaction
## Not run: 
##D rpm2 <- relpois(x, formula = lex.Xst %in% 1:2 ~ FOT*agegr)
##D anova(rpm, rpm2, test="LRT")
##D AIC(rpm, rpm2)
##D ## update won't work currently
## End(Not run)



