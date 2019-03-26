library(perturb)


### Name: colldiag
### Title: Condition indexes and variance decomposition proportions
### Aliases: colldiag print.colldiag
### Keywords: regression

### ** Examples

# Belsley (1991). "Conditioning Diagnostics"
# The Consumption Function (pp. 149-154)
data(consumption)

ct1 <- with(consumption, c(NA,cons[-length(cons)]))

# compare (5.3)
m1 <- lm(cons ~ ct1+dpi+rate+d_dpi, data = consumption)
anova(m1)
summary(m1)

# compare exhibit 5.11
with(consumption, cor(cbind(ct1, dpi, rate, d_dpi), use="complete.obs"))

# compare exhibit 5.12
cd<-colldiag(m1)
cd
print(cd,fuzz=.3)

## Not run: 
##D # Example of reading UCLA data files from 
##D # https://stats.idre.ucla.edu/r/webbook/regression-with-rchapter-4-beyond-ols/
##D library(foreign)
##D elemapi <- read.dta("https://stats.idre.ucla.edu/stat/stata/webbooks/reg/elemapi.dta")
##D attach(elemapi)
##D 
##D # Example of SAS collinearity diagnostics from
##D # https://stats.idre.ucla.edu/sas/webbooks/reg/
##D # 2.4 Tests for Collinearity
##D m2 <- lm(api00 ~ acs_k3+avg_ed+grad_sch+col_grad+some_col)
##D summary(m2)
##D library(car)
##D vif(m2)
##D 
##D library(perturb)
##D cd2<-colldiag(m2,add.intercept=FALSE,center=TRUE)
##D print(cd2,dec.places=5)
## End(Not run)



