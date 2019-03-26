library(AICcmodavg)


### Name: multComp
### Title: Create Model Selection Tables based on Multiple Comparisons
### Aliases: multComp multComp.default multComp.aov multComp.gls
###   multComp.glm multComp.lm multComp.lme multComp.mer multComp.merMod
###   multComp.rlm multComp.survreg print.multComp
### Keywords: models

### ** Examples

##one-way ANOVA example
data(turkey)

##convert diet to factor
turkey$Diet <- as.factor(turkey$Diet)
##run one-way ANOVA
m.aov <- lm(Weight.gain ~ Diet, data = turkey)

##compute models with different grouping patterns
##and also compute model-averaged group means
out <- multComp(m.aov, factor.id = "Diet", correction = "none")
##look at results
out

##look at grouping structure of a given model
##and compare with original variable
cbind(model.frame(out$models[[2]]), turkey$Diet)

##evidence ratio
evidence(out$model.table)

##compute Bonferroni-adjusted confidence intervals
multComp(m.aov, factor.id = "Diet", correction = "bonferroni")


##two-way ANOVA with interaction
## Not run: 
##D data(calcium)
##D 
##D m.aov2 <- lm(Calcium ~ Hormone + Sex + Hormone:Sex, data = calcium)
##D 
##D ##multiple comparisons
##D multComp(m.aov2, factor.id = "Hormone")
##D ##returns an error because 'Hormone' factor is
##D ##involved in an interaction
##D 
##D ##create interaction variable
##D calcium$inter <- interaction(calcium$Hormone, calcium$Sex)
##D 
##D ##run model with interaction
##D m.aov.inter <- lm(Calcium ~ inter, data = calcium)
##D 
##D ##compare both
##D logLik(m.aov2)
##D logLik(m.aov.inter)
##D ##both are identical
##D 
##D ##multiple comparisons
##D multComp(m.aov.inter, factor.id = "inter")
## End(Not run)


##Poisson regression
## Not run: 
##D ##example from ?glm
##D ##Dobson (1990) Page 93: Randomized Controlled Trial :
##D counts <- c(18,17,15,20,10,20,25,13,12)
##D outcome <- gl(3,1,9)
##D treatment <- gl(3,3)
##D print(d.AD <- data.frame(treatment, outcome, counts))
##D glm.D93 <- glm(counts ~ outcome + treatment, data = d.AD, family = poisson)
##D 
##D multComp(mod = glm.D93, factor.id = "outcome")
## End(Not run)


##example specifying 'newdata'
## Not run: 
##D data(dry.frog)
##D m1 <- lm(log_Mass_lost ~ Shade + Substrate +
##D       cent_Initial_mass + Initial_mass2,
##D       data = dry.frog)
##D 
##D multComp(m1, factor.id = "Substrate",
##D           newdata = data.frame(
##D             Substrate = c("PEAT", "SOIL", "SPHAGNUM"),
##D             Shade = 0, cent_Initial_mass = 0,
##D             Initial_mass2 = 0))
## End(Not run)



