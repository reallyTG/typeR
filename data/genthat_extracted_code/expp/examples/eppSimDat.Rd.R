library(expp)


### Name: eppSimDat
### Title: Type I error rate simulations
### Aliases: eppSimDat

### ** Examples


d = eppSimDat()
plot(d)


## No test: 
# Type I error rate simulation

require(lme4)
pval_glmer = vector(mode = "numeric", length = 0)
pval_glm = vector(mode = "numeric", length = 0)

# For meaningful results increase i to e.g. 500 and N in eppSimDat to e.g. 120
for(i in 1:5) { 
  x = as.data.frame(eppSimDat(N = 25, meanClutch = 10, eppRate = 0.10, eppMax = 12, 
      eppMales = 0.35, nLags = 3))
  
  fm1glmer = glmer(epp ~ rank + trait_MALE + trait_FEMALE + (1 | male) + (1 | female) , 
  data = x, family = binomial, nAGQ =  0)
  fm0glmer = update(fm1glmer, epp ~ 1 + (1 | male) + (1 | female) )
  pval_glmer[i] = anova(fm0glmer, fm1glmer)$"Pr(>Chisq)"[2]
  
  fm1glm = glm(epp ~ rank + trait_MALE + trait_FEMALE  , data = x, family = binomial)
  fm0glm = update(fm1glm, epp ~ 1 )
  pval_glm[i] = anova(fm0glm, fm1glm, test = "Chisq")$"Pr(>Chi)"[2]
  
  print(i)
 }

# Type I error rate of glmer models
table(pval_glmer<0.05)[2]/length(pval_glmer)


# Type I error rate of the equivalent glm models
table(pval_glm<0.05)[2]/length(pval_glm)


## End(No test)





