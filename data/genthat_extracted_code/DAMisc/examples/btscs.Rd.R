library(DAMisc)


### Name: btscs
### Title: Generate Spells for Binary Variables
### Aliases: btscs

### ** Examples

library(splines)
## Data from Alvarez et. al. (1996)
data(aclp)
newdat <- btscs(aclp, "democ", "year", "country")	

# Estimate Model with and without spell
full.mod <- glm(democ ~ log(gdpw) + popg + bs(spell, df=4), data=newdat, family=binomial)	
restricted.mod <- glm(democ ~ log(gdpw) + popg, data=newdat, family=binomial)	
	
# Incremental F-test of time dependence
anova(restricted.mod, full.mod, test='Chisq')	



