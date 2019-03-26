library(popEpi)


### Name: relpois_ag
### Title: Excess hazard Poisson model
### Aliases: relpois_ag

### ** Examples

## use the simulated rectal cancer cohort
data(sire, package = "popEpi")
sire$agegr <- cut(sire$dg_age, c(0,45,60,Inf), right=FALSE)

## create aggregated example data
fb <- c(0,3/12,6/12,1,2,3,4,5)
x <- lexpand(sire, birth = bi_date, entry = dg_date,
             exit = ex_date, status=status %in% 1:2,
             breaks = list(fot=fb), 
             pophaz=popmort, pp = FALSE,
             aggre = list(agegr, fot))
             
## fit model using aggregated data
rpm <- relpois_ag(formula = from0to1 ~ fot + agegr,  data = x,
                  d.exp = d.exp, offset = log(pyrs))
summary(rpm)
 
## the usual functions for handling glm models work
rpm2 <- update(rpm, . ~ fot*agegr)
anova(rpm, rpm2, test="LRT")
AIC(rpm, rpm2)

## other features such as residuals or predicting are not guaranteed
## to work as intended.



