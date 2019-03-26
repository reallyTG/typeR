library(ffmanova)


### Name: ffmanova
### Title: Fifty-fifty MANOVA
### Aliases: ffmanova
### Keywords: design models multivariate

### ** Examples


data(dressing)

# An ANOVA model with all design variables as factors 
# and with visc as the only response variable.
# Classical univariate Type II test results are produced.
ffmanova(visc ~ (factor(press) + factor(stab) + factor(emul))^2 + day,
         data = dressing) 

# A second order response surface model with day as a block factor. 
# The properties of the extended Type II approach is utilized. 
ffmanova(visc ~ (press + stab + emul)^2 + I(press^2)+ I(stab^2)+ I(emul^2)+ day,
         data = dressing)

# 50-50 MANOVA results with the particle-volume curves as 
# multivariate responses. The responses are not standardized.
ffmanova(pvol ~ (press + stab + emul)^2 + I(press^2)+ I(stab^2)+ I(emul^2)+ day,
         stand = FALSE, data = dressing)

# 50-50 MANOVA results with 9 rheological responses (standardized).
# 99 rotation simulation repetitions are performed. 
res <- ffmanova(rheo ~ (press + stab + emul)^2 + I(press^2)+ I(stab^2)+ I(emul^2)+ day,
                nSim = 99, data = dressing)
res$pRaw      #  Unadjusted single responses p-values 
res$pAdjusted #  Familywise error rate adjusted p-values 
res$pAdjFDR   #  False discovery rate adjusted p-values

# As above, but this time 9999 rotation simulation repetitions 
# are performed, but only for the model term stab^2. 
res <- ffmanova(rheo ~ (press + stab + emul)^2 + I(press^2)+ I(stab^2)+ I(emul^2)+ day,
                nSim = c(0,0,0,0,0,9999,0,0,0,0,0), data = dressing)
res$pAdjusted[6,] # Familywise error rate adjusted p-values for stab^2
res$pAdjFDR[6,]   # False discovery rate adjusted p-values for stab^2

# Note that the results of the first example above can also be 
# obtained by using the car package.
## Not run: 
##D    require(car)
##D    Anova(lm(visc ~ (factor(press) + factor(stab) + factor(emul))^2 + day,
##D          data = dressing), type = "II")
## End(Not run)

# The results of the second example differ because Anova does not recognise 
# linear terms (emul) as being contained in quadratic terms (I(emul^2)).
# A consequence here is that the clear significance of emul disappears.
## Not run: 
##D    require(car)
##D    Anova(lm(visc ~ (press + stab + emul)^2 + I(press^2)+ I(stab^2)+ I(emul^2)+ day,
##D          data = dressing), type="II")
## End(Not run)




