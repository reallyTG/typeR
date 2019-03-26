library(MPDiR)


### Name: polmer
### Title: Ordinal Regression with Mixed-effects
### Aliases: polmer
### Keywords: models

### ** Examples

#	data(Faces)
#	if(require(lme4.0, quietly = TRUE)){
	# no random effects specified - calls glm
#	Faces.glm <- polmer(SimRating ~ sibs, Faces)
	# random effect of observer - call glmer
	#  GLITCH: must specify random effect as second level of factor (levels of sibs are 0/1)
	
#	Faces.glmer <- polmer(SimRating ~ sibs + (sibs1 - 1 | Obs),
#		Faces)
#	}



