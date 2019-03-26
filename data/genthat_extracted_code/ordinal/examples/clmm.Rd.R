library(ordinal)


### Name: clmm
### Title: Cumulative Link Mixed Models
### Aliases: clmm
### Keywords: models

### ** Examples


## Cumulative link model with one random term:	
fmm1 <- clmm(rating ~ temp + contact + (1|judge), data = wine)	
summary(fmm1)	
	
## Not run: 
##D  	
##D ## May take a couple of seconds to run this.	
##D 
##D ## Cumulative link mixed model with two random terms:
##D mm1 <- clmm(SURENESS ~ PROD + (1|RESP) + (1|RESP:PROD), data = soup,
##D             link = "probit", threshold = "equidistant")
##D mm1
##D summary(mm1)
##D 
##D ## test random effect:
##D mm2 <- clmm(SURENESS ~ PROD + (1|RESP), data = soup,
##D             link = "probit", threshold = "equidistant")
##D anova(mm1, mm2)
## End(Not run)




