library(AICcmodavg)


### Name: fam.link.mer
### Title: Extract Distribution Family and Link Function
### Aliases: fam.link.mer
### Keywords: models

### ** Examples

##modified example from ?glmer
## Not run: 
##D if(require(lme4)){
##D ##create proportion of incidence
##D cbpp$prop <- cbpp$incidence/cbpp$size
##D gm1 <- glmer(prop ~ period + (1 | herd), family = binomial,
##D              weights = size, data = cbpp)
##D fam.link.mer(gm1)
##D gm2 <- glmer(prop ~ period + (1 | herd),
##D              family = binomial(link = "cloglog"), weights = size,
##D              data = cbpp)
##D fam.link.mer(gm2)
##D }
## End(Not run)


##example with linear mixed model with Orthodont data from
##Pinheiro and Bates (2000)
## Not run: 
##D data(Orthodont, package = "nlme")
##D m1 <- lmer(distance ~ Sex + (1 | Subject), data = Orthodont,
##D            REML = FALSE)
##D fam.link.mer(m1)
##D m2 <- glmer(distance ~ Sex + (1 | Subject),
##D             family = gaussian(link = "log"), data = Orthodont,
##D             REML = FALSE)
##D fam.link.mer(m2)
##D detach(package:lme4)
## End(Not run)



