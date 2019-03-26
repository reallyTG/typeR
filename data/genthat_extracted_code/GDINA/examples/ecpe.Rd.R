library(GDINA)


### Name: ecpe
### Title: Examination for the Certificate of Proficiency in English (ECPE)
###   data
### Aliases: ecpe
### Keywords: datasets

### ** Examples

## Not run: 
##D mod1 <- GDINA(ecpe$dat,ecpe$Q)
##D mod1
##D summary(mod1)
##D 
##D mod2 <- GDINA(ecpe$dat,ecpe$Q,model="RRUM")
##D mod2
##D anova(mod1,mod2)
##D # You may compare the following results with Feng, Habing, and Huebner (2014)
##D coef(mod2,"rrum")
##D 
##D # G-DINA with hierarchical structure
##D # see Templin & Bradshaw, 2014
##D ast <- att.structure(list(c(3,2),c(2,1)),K=3)
##D 
##D est.gdina2 <- GDINA(ecpe$dat,ecpe$Q,model = "GDINA",
##D                    control = list(conv.crit = 1e-6),
##D                    att.str = list(c(3,2),c(2,1)))
##D # see Table 7 in Templin & Bradshaw, 2014
##D summary(est.gdina2)
## End(Not run)




