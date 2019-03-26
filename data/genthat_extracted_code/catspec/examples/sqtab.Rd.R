library(catspec)


### Name: sqtab
### Title: sqtab: models for square tables
### Aliases: sqtab check.square fitmacro mob.cp mob.eqmain mob.qi mob.rc1
###   mob.symint mob.unif
### Keywords: multivariate

### ** Examples

# Examples of loglinear models for square tables,
# from Hout, M. (1983). "Mobility Tables". Sage Publication 07-031

# Table from page 11 of "Mobility Tables"
# Original source: Featherman D.L., R.M. Hauser. (1978) "Opportunity and Change."
# New York: Academic, page 49

Freq <- c(
1414,  521,  302,   643,   40,
 724,  524,  254,   703,   48,
 798,  648,  856,  1676,  108,
 756,  914,  771,  3325,  237,
 409,  357,  441,  1611, 1832)

OccFather<-gl(5,5,labels=c("Upper nonmanual","Lower nonmanual","Upper manual","Lower manual","Farm"))
OccSon<-gl(5,1,labels=c("Upper nonmanual","Lower nonmanual","Upper manual","Lower manual","Farm"))
FHtab <- data.frame(OccFather,OccSon,Freq)

xtabs(Freq~OccFather+OccSon,data=FHtab)

# independence model
indep<-glm(Freq~OccFather+OccSon,family=poisson(),data=FHtab)
summary(indep)
fitmacro(indep)

wt <- as.numeric(OccFather != OccSon)
qi0<-glm(Freq~OccFather+OccSon,weights=wt,family=poisson(),data=FHtab)
# A quasi-independence loglinear model, using structural zeros
# (page 23 of "Mobility Tables").
#  0  1  1  1  1   values of variable "wt"
#  1  0  1  1  1
#  1  1  0  1  1
#  1  1  1  0  1
#  1  1  1  1  0
qi0<-glm(Freq~OccFather+OccSon,weights=wt,family=poisson(),data=FHtab)
summary(qi0)
fitmacro(qi0)

# Quasi-independence using a "dummy factor" to create the design
# vectors for the diagonal cells (page 23).
#  1  0  0  0  0
#  0  2  0  0  0
#  0  0  3  0  0
#  0  0  0  4  0
#  0  0  0  0  5
glm.qi<-glm(Freq~OccFather+OccSon+mob.qi(OccFather,OccSon),family=poisson(),data=FHtab)
summary(glm.qi)
fitmacro(glm.qi)

# Quasi-independence without using the functions
# Factor labels prevent numeric comparisons, create numeric versions
# of the row and column variables
OccFather_n <- unclass(OccFather)
OccSon_n <- unclass(OccSon)
q1 <- ifelse(OccFather_n==OccSon_n & OccSon_n==1,1,0)
q2 <- ifelse(OccFather_n==OccSon_n & OccSon_n==2,1,0)
q3 <- ifelse(OccFather_n==OccSon_n & OccSon_n==3,1,0)
q4 <- ifelse(OccFather_n==OccSon_n & OccSon_n==4,1,0)
q5 <- ifelse(OccFather_n==OccSon_n & OccSon_n==5,1,0)
glm.qi2<-glm(Freq~OccFather+OccSon+q1+q2+q3+q4+q5,family=poisson(),data=FHtab)
summary(glm.qi2)
fitmacro(glm.qi2)

# Quasi-independence constrained (QPM-C, page 31)
# Single immobility parameter
#  1  0  0  0  0
#  0  1  0  0  0
#  0  0  1  0  0
#  0  0  0  1  0
#  0  0  0  0  1
glm.q0<-glm(Freq~OccFather+OccSon+mob.qi(OccFather,OccSon,constrained=TRUE),family=poisson(),data=FHtab)
# slightly different results than Hout also found in Stata: L2=2567.658, q0=0.964
summary(glm.q0)
fitmacro(glm.q0)

# Quasi-symmetry using the symmetric cross-classification (page 23)
#  0  1  2  3  4   values of variable "sym"
#  1  0  5  6  7
#  2  5  0  8  9
#  3  6  8  0 10
#  4  7  9 10  0  */
glm.qsym<-
glm(Freq~OccFather+OccSon+mob.symint(OccFather,OccSon),family=poisson(),data=FHtab)
summary(glm.qsym)
fitmacro(glm.qsym)

symmetry<-glm(Freq~mob.eqmain(OccFather,OccSon)
+mob.symint(OccFather,OccSon),family=poisson(),data=FHtab)
summary(symmetry)
fitmacro(symmetry)

# Crossings parameter model (page 35)
#  0  v1 v1 v1 v1 |  0  0  v2 v2 v2 |  0  0  0  v3 v3 |  0  0  0  0 v4
#  v1 0  0  0  0  |  0  0  v2 v2 v2 |  0  0  0  v3 v3 |  0  0  0  0 v4
#  v1 0  0  0  0  |  v2 v2 0  0  0  |  0  0  0  v3 v3 |  0  0  0  0 v4
#  v1 0  0  0  0  |  v2 v2 0  0  0  |  v3 v3 v3 0  0  |  0  0  0  0 v4
#  v1 0  0  0  0  |  v2 v2 0  0  0  |  v3 v3 v3 0  0  |  v4 v4 v4 v4 0
glm.cp<-glm(Freq~OccFather+OccSon+mob.cp(OccFather,OccSon),family=poisson(),data=FHtab)
summary(glm.cp)
fitmacro(glm.cp)

# Uniform association model: linear by linear association (page 58)
glm.unif<-glm(Freq~OccFather+OccSon+mob.unif(OccFather,OccSon),family=poisson(),data=FHtab)
summary(glm.unif)
fitmacro(glm.unif)

# RC model 1 (unequal row and column effects, page 58)
# Fits a uniform association parameter and row and column effect
# parameters. Row and column effect parameters have the
# restriction that the first and last categories are zero.
glm.rc1<-glm(Freq~OccFather+OccSon+mob.rc1(OccFather,OccSon),family=poisson(),data=FHtab)
summary(glm.rc1)
fitmacro(glm.rc1)

# Homogeneous row and column effects model 1 (page 58)
# An equality restriction is placed on the row and column effects
glm.hrc1<-glm(Freq~OccFather+OccSon+mob.rc1(OccFather,OccSon,equal=TRUE),family=poisson(),data=FHtab)
# Results differ from those in Hout, replicated by other programs
summary(glm.hrc1)
fitmacro(glm.hrc1)

#-------------------------------------------------------------------------------
# Examples on using these models in multinomial logistic regression
#-------------------------------------------------------------------------------
# Data from the 1972-78 GSS used by Logan (1983)
library(survival)
data(logan)

# Restructure the data in 'long' format using mlogit.data
library(mlogit)
pc <- mlogit.data(logan, shape = "wide", choice = "occupation")
head(pc,10)
# pc$alt indexes choices, pc$chid indexes respondents
# pc$occupation is a boolean variable that is TRUE where pc$alt corresponds
# with the actual choice made
class(logan$occupation) #"factor"
class(pc$alt) #"character"
# pc$alt needs to be transformed into a factor for use in the some models
# for square tables which assume ordered categories
pc$alt <- factor(pc$alt,levels=c("farm", "operatives", "craftsmen", "sales", "professional"))

# A regular multinomial logit model
m1<-mlogit(occupation ~ 0 | education+race, data=pc, reflevel = "farm")
summary(m1)

# Estimate a "quasi-uniform association" loglinear model for "focc" and "occupation"
# with "education" and "race" as covariates at the respondent level
# The quasi-uniform association model contains alternative-specific effects,
# education and race are individual specific effects
m2 <- mlogit(occupation ~ mob.qi(focc,alt)+mob.unif(focc,alt) | education+race,data=pc, reflevel = "farm")
summary(m2)

# Same model using survival::clogit
# First create a design matrix for the alternatives that drops the first category
occ.X<-model.matrix(~pc$alt)[,-1]
head(occ.X,10)
# The clogit output exceeds the default 80 characters
options(width=256)
# pc$chid which indexes respondents must be used in strata()
# Individual specific effecs are modelled as interactions between the 
# design matrix for pc$alt and the covariates 
cl.qu<-clogit(occupation~occ.X+occ.X:education+occ.X:race+
  mob.qi(focc,alt)+mob.unif(focc,alt)+strata(chid),data=pc)
summary(cl.qu)



