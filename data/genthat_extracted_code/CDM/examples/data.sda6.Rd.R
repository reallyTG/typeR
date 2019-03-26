library(CDM)


### Name: data.sda6
### Title: Dataset SDA6 (Jurich & Bradshaw, 2014)
### Aliases: data.sda6
### Keywords: datasets

### ** Examples

## Not run: 
##D data(data.sda6, package="CDM")
##D 
##D data <- data.sda6$data
##D q.matrix <- data.sda6$q.matrix
##D 
##D #*** Model 1a: LCDM with gdina
##D mod1a <- CDM::gdina( data, q.matrix, rule="ACDM", linkfct="logit",
##D                   reduced.skillspace=FALSE )
##D summary(mod1a)
##D 
##D #*** Model 1b: estimate LCDM with gdm
##D mod1b <- CDM::gdm( data, q.matrix=q.matrix, theta.k=c(0,1) )
##D summary(mod1b)
##D 
##D #*** Model 2: LCDM with hierarchy II > CM
##D B <- "II > CM"
##D ss2 <- CDM::skillspace.hierarchy(B=B, skill.names=colnames(q.matrix ) )
##D mod2 <- CDM::gdina( data, q.matrix, rule="ACDM", linkfct="logit",
##D                 skillclasses=ss2$skillspace.reduced,
##D                 reduced.skillspace=FALSE )
##D summary(mod2)
##D 
##D #*** Model 3: LCDM with hierarchy II > CM and DG > CM
##D B <- "II > CM
##D       DG > CM"
##D ss2 <- CDM::skillspace.hierarchy(B=B, skill.names=colnames(q.matrix ) )
##D mod3 <- CDM::gdina( data, q.matrix, rule="ACDM", linkfct="logit",
##D                skillclasses=ss2$skillspace.reduced,
##D                reduced.skillspace=FALSE )
##D summary(mod3)
##D 
##D # model comparisons
##D anova(mod1a,mod2)
##D anova(mod1a,mod3)
##D # model fit
##D summary( CDM::modelfit.cor.din(mod1a))
##D summary( CDM::modelfit.cor.din(mod2) )
##D summary( CDM::modelfit.cor.din(mod3) )
## End(Not run)



