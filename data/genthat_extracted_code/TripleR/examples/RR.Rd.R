library(TripleR)


### Name: RR
### Title: Triple R: Round-Robin Analyses Using R
### Aliases: RR liking_a likingLong multiLikingLong liking_b metaliking_a
###   metaliking_b multiGroup multiNarc
### Keywords: univar htest

### ** Examples

# The example data are taken from the "Mainz Freshman Study" and consist 
# of ratings of liking as well as ratings of the metaperception of 
# liking at zero-acquaintance using a Round-Robin group of 54 participants 

#------------------------------------------------------------
# ----  Single group   --------------------------------------
#------------------------------------------------------------

# Load data frame in long format - it contains 4 variables:
#liking ratings indicator a (liking_a, "How likeable do you find this person?")  
#liking ratings indicator b (liking_b, "Would you like to get to know this person?")
#metaliking ratings indicator a (metaliking_a, "How likeable does this person find you?")
#metaliking ratings indicator b (metaliking_b, "Would this person like to get to know you?")
data("likingLong")

#manifest univariate SRM analysis
RR1 <- RR(liking_a ~ perceiver.id*target.id, data=likingLong)

## Not run: 
##D #manifest bivariate SRM analysis
##D RR2 <- RR(liking_a + metaliking_a ~ perceiver.id*target.id, data=likingLong)
##D 
##D #latent (construct-level) univariate SRM analysis
##D RR3 <- RR(liking_a / liking_b ~ perceiver.id*target.id, data=likingLong)
##D 
##D #latent (construct-level) univariate SRM analysis, define new variable name for the latent construct
##D RR3b <- RR(liking_a / liking_b ~ perceiver.id*target.id, data=likingLong, varname="liking")
##D # compare:
##D head(RR3$effects)
##D head(RR3b$effects)
##D 
##D #latent (construct-level) bivariate SRM analysis
##D RR4 <- RR(liking_a/liking_b + metaliking_a/metaliking_b ~ perceiver.id*target.id, data=likingLong)
##D 
##D 
##D # prints output of the manifest univariate analysis
##D # in terms of actor and partner variance (default output labels)
##D print(RR1, measure1="behavior") 
##D 
##D # prints output of the manifest univariate analysis 
##D # in terms of perceiver and target variance (appropriate for perception data)
##D print(RR1, measure1="perception")
##D 
##D # prints output of the manifest bivariate SRM analysis appropriate 
##D # for perception-metaperception data  
##D print(RR2, measure1="perception", measure2="metaperception")
##D 
##D #prints output of the latent univariate SRM analysis
##D # appropriate for perception data  
##D print(RR3, measure1="perception") 
##D 
##D #prints output of the latent bivariate SRM analysis
##D # appropriate for perception-perception data  
##D # Note: you can use abbreviations of the strings "behavior", "perception", and "metaperception"
##D print(RR4, measure1="p", measure2="p") 
## End(Not run)


#------------------------------------------------------------
# ----  Multiple groups --------------------------------------
#------------------------------------------------------------

# data("multiLikingLong") is a variant of the liking data set (see above) with multiple groups
data("multiLikingLong")

# set RR.style to "perception" (affects subsequent printing of objects)
RR.style("perception")

#manifest univariate SRM analysis
RR1m <- RR(liking_a ~ perceiver.id*target.id|group.id, data=multiLikingLong)

## Not run: 
##D #manifest bivariate SRM analysis
##D RR2m <- RR(liking_a + metaliking_a ~ perceiver.id*target.id|group.id, data=multiLikingLong)
##D 
##D #latent (construct-level) univariate SRM analysis
##D RR3m <- RR(liking_a / liking_b ~ perceiver.id*target.id|group.id, data=multiLikingLong)
##D 
##D #latent (construct-level) bivariate SRM analysis
##D RR4m <- RR(liking_a/liking_b + metaliking_a/metaliking_b ~ perceiver.id*target.id|group.id,
##D 		 		data=multiLikingLong)
##D 
##D # prints output of the manifest univariate analysis
##D # in terms of actor and partner variance (default output labels)
##D print(RR1m, measure1="behavior") 
##D 
##D # prints output of the manifest univariate analysis 
##D # in terms of perceiver and target variance (appropriate for perception data)
##D print(RR1m, measure1="perception")
##D 
##D 
##D #------------------------------------------------------------
##D # ----  Multiple groups with missing values --------------------------------------
##D #------------------------------------------------------------
##D 
##D # a multi group data set with two variables:
##D # ex = extraversion ratings, and ne = neurotizism ratings
##D data("multiGroup")
##D 
##D #manifest univariate SRM analysis, data set with missings
##D RR1miss <- RR(ex~perceiver.id*target.id|group.id, data=multiGroup, na.rm=TRUE)
##D 
##D #manifest univariate SRM analysis, data set with missings, 
##D # minimum 10 data points are requested for each participant
##D RR1miss <- RR(ex~perceiver.id*target.id|group.id, data=multiGroup, na.rm=TRUE, minData=10)
## End(Not run)




