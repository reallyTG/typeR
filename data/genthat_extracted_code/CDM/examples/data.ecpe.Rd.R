library(CDM)


### Name: data.ecpe
### Title: Dataset ECPE
### Aliases: data.ecpe
### Keywords: datasets

### ** Examples

## Not run: 
##D data(data.ecpe, package="CDM")
##D 
##D dat <- data.ecpe$data[,-1]
##D Q <- data.ecpe$q.matrix
##D 
##D #*** Model 1: LCDM model
##D mod1 <- CDM::gdina( dat, q.matrix=Q, link="logit")
##D summary(mod1)
##D 
##D #*** Model 2: DINA model
##D mod2 <- CDM::gdina( dat, q.matrix=Q, rule="DINA")
##D summary(mod2)
##D 
##D # Model comparison using likelihood ratio test
##D anova(mod1,mod2)
##D   ##       Model   loglike Deviance Npars      AIC      BIC    Chisq df  p
##D   ##   2 Model 2 -42841.61 85683.23    63 85809.23 86185.97 206.0359 18  0
##D   ##   1 Model 1 -42738.60 85477.19    81 85639.19 86123.57       NA NA NA
##D 
##D #*** Model 3: Hierarchical LCDM (HLCDM) | Templin and Bradshaw (2014)
##D #      Testing a linear hierarchy
##D hier <- "skill3 > skill2 > skill1"
##D skill.names <- colnames(Q)
##D # define skill space with hierarchy
##D skillspace <- CDM::skillspace.hierarchy( hier, skill.names=skill.names )
##D skillspace$skillspace.reduced
##D   ##        skill1 skill2 skill3
##D   ##   A000      0      0      0
##D   ##   A001      0      0      1
##D   ##   A011      0      1      1
##D   ##   A111      1      1      1
##D zeroprob.skillclasses <- skillspace$zeroprob.skillclasses
##D 
##D # define user-defined parameters in LCDM: hierarchical LCDM (HLCDM)
##D Mj.user <- mod1$Mj
##D # select items with require two attributes
##D items <- which( rowSums(Q) > 1 )
##D # modify design matrix for item parameters
##D for (ii in items){
##D     m1 <- Mj.user[[ii]]
##D     Mj.user[[ii]][[1]] <- (m1[[1]])[,-2]
##D     Mj.user[[ii]][[2]] <- (m1[[2]])[-2]
##D }
##D 
##D # estimate model
##D #    note that avoid.zeroprobs is set to TRUE to avoid algorithmic instabilities
##D mod3 <- CDM::gdina( dat, q.matrix=Q, link="logit",
##D             zeroprob.skillclasses=zeroprob.skillclasses, Mj=Mj.user,
##D             avoid.zeroprobs=TRUE )
##D summary(mod3)
##D 
##D #*****************************************
##D #** estimate further models
##D 
##D #*** Model 4: RRUM model
##D mod4 <- CDM::gdina( dat, q.matrix=Q, rule="RRUM")
##D summary(mod4)
##D # compare some models
##D IRT.compareModels(mod1, mod2, mod3, mod4 )
##D 
##D #*** Model 5a: GDINA model with identity link
##D mod5a <- CDM::gdina( dat, q.matrix=Q, link="identity")
##D summary(mod5a)
##D #*** Model 5b: GDINA model with logit link
##D mod5b <- CDM::gdina( dat, q.matrix=Q, link="logit")
##D summary(mod5b)
##D #*** Model 5c: GDINA model with log link
##D mod5c <- CDM::gdina( dat, q.matrix=Q, link="log")
##D summary(mod5c)
##D # compare models
##D IRT.compareModels(mod5a, mod5b, mod5c)
## End(Not run)



