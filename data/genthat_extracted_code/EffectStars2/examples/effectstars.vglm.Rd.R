library(EffectStars2)


### Name: effectstars.vglm
### Title: Plot effect stars for vglm objects.
### Aliases: effectstars.vglm

### ** Examples

## Not run: 
##D ############################################
##D ### Examples for multinomial logit model
##D ############################################
##D 
##D ### German election data
##D data(election) 
##D library(VGAM)
##D m_elect <- vglm(Partychoice ~ Gender + West + Age + Union + Highschool + Unemployment
##D + Pol.Interest + Democracy + Religion, family = multinomial(), data = election)
##D 
##D effectstars(m_elect)
##D 
##D # include p.values
##D effectstars(m_elect, p.values = TRUE)
##D 
##D ### German election data with category-specific covariates
##D 
##D data(election)
##D election[,13:16] <- election[,13:16] - election[,12]
##D election[,18:21] <- election[,18:21] - election[,17]
##D election[,23:26] <- election[,23:26] - election[,22]
##D election[,28:31] <- election[,28:31] - election[,27]
##D 
##D election$Social <- election$Social_SPD
##D election$Immigration <- election$Immigration_SPD
##D election$Nuclear <- election$Nuclear_SPD
##D election$Left_Right <- election$Left_Right_SPD
##D 
##D m.all <- vglm(Partychoice ~ Social + Immigration + Nuclear + Left_Right + Age + 
##D                 Religion + Democracy + Pol.Interest + Unemployment + Highschool + Union + West + 
##D                 Gender, data = election, 
##D                 family = multinomial(parallel = TRUE~-1 + Social + Immigration + 
##D                 Nuclear + Left_Right, refLevel = 1),
##D               xij = list(Social ~ Social_SPD + Social_FDP + Social_Greens + Social_Left,
##D                          Immigration ~ Immigration_SPD + Immigration_FDP + 
##D                          Immigration_Greens + Immigration_Left,
##D                          Nuclear ~ Nuclear_SPD + Nuclear_FDP + 
##D                          Nuclear_Greens + Nuclear_Left,
##D                          Left_Right ~ Left_Right_SPD + Left_Right_FDP + 
##D                          Left_Right_Greens + Left_Right_Left),
##D               form2 = ~Social + Immigration + Nuclear + Left_Right + Age + 
##D                 Religion + Democracy + Pol.Interest + Unemployment + Highschool + Union + West + 
##D                 Gender + Social_SPD + Social_FDP + Social_Greens + Social_Left +
##D                 Immigration_SPD + Immigration_FDP + Immigration_Greens + Immigration_Left +
##D                 Nuclear_SPD + Nuclear_FDP + Nuclear_Greens + Nuclear_Left +
##D                 Left_Right_SPD + Left_Right_FDP + Left_Right_Greens + Left_Right_Left
##D )
##D 
##D effectstars(m.all, symmetric = FALSE, p.values = TRUE)
##D summary(m.all)
##D 
##D 
##D ### Chilean plebiscite data
##D data(plebiscite)
##D m_chile <- vglm(Vote ~ ., family = multinomial(), data = plebiscite)
##D effectstars(m_chile)
##D 
##D # choose fixed circle sizes and use reference category instead of symmetric side constraints
##D effectstars(m_chile, symmetric = FALSE, fixed = TRUE)
##D 
##D ############################################
##D ### Examples for ordinal data
##D ############################################
##D 
##D ### Munich insolvency data
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



