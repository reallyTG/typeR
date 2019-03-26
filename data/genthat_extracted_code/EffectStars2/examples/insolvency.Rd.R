library(EffectStars2)


### Name: insolvency
### Title: Insolvency data
### Aliases: insolvency
### Keywords: datasets ordinal response

### ** Examples


## Not run: 
##D data(insolvency)
##D insolvency$Age <- scale(insolvency$Age)
##D 
##D my_formula <- Insolvency ~ Age + Gender
##D 
##D m_acat <- vglm(my_formula, data = insolvency,family = acat())
##D m_cratio <- vglm(my_formula, data = insolvency,family = cratio())
##D m_sratio <- vglm(my_formula, data = insolvency,family = sratio())
##D m_cumulative <- vglm(my_formula, data = insolvency,family = cumulative())
##D 
##D summary(m_acat)
##D effectstars(m_acat, p.values = TRUE)
##D 
##D summary(m_cratio)
##D effectstars(m_cratio, p.values = TRUE)
##D 
##D summary(m_sratio)
##D effectstars(m_sratio, p.values = TRUE)
##D 
##D summary(m_cumulative)
##D effectstars(m_cumulative, p.values = TRUE)
## End(Not run)




