library(freqparcoord)


### Name: regdiag
### Title: Diagnosing regression model fit using parallel coordinates.
### Aliases: regdiag regdiagbas

### ** Examples

data(mlb)

lmout <- lm(mlb$Weight ~ mlb$Height + mlb$Age)
p <- regdiag(lmout,0.10,k=50,m=25)
p
# taller, older players are overpredicted, with shorter, younger players
# underpredicted; suggests that adding quadratic terms for Height, Age
# may help in the tails
# let's compare the R-squared values
p$paramr2 
p$nonparamr2 
# not much difference (param. model a bit better), possibly due to 
# small sample size 

# doing it "the long way" (showing use without an lm/glm object)
parest <- lmout$fitted.values
regdiagbas(mlb[c("Height","Age")], mlb$Weight,parest,0.10,k=50,m=25)

data(prgeng)
pg <- prgeng
pg1 <- pg[pg$wageinc >= 40000 & pg$wkswrkd >= 48,]
l1 <- lm(wageinc ~ age+educ+sex,data=pg1)
p <- regdiag(l1)
p
p$paramr2
p$nonparamr2
# young men's wages underpredicted, older women overpredicted; both
# R-squared values low, but nonpar is about 27% higher, indicating room
# for improvement; interaction and polynomial terms may help

## Not run: 
##D data(newadult)
##D g1 <- glm(gt50 ~ edu + age + gender + mar, data=newadult, family=binomial)
##D regdiag(g1)
##D # parametric model underpredicts older highly-educated married men,
##D # and overpredicts young female lesser-educated singles; might try adding 
##D # interaction terms 
## End(Not run)



