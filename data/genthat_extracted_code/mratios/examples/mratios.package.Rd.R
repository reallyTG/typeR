library(mratios)


### Name: mratios-package
### Title: mratios
### Aliases: mratios-package mratios
### Keywords: package

### ** Examples


library(mratios)

############################################################

# # # ttestratio: 
# Two-sample test and confidence interval
# for comparison of means, allowing for heteroscedasticity

data(ASAT)
ASAT
ttestratio(ASAT~group, data=ASAT, alternative="less", base=1,
 rho=1.25, var.equal=TRUE)

data(Mutagenicity)
boxplot(MN~Treatment, data=Mutagenicity)
# It seems to be inappropriate to assume homogeneous variances:

# 1) comparing whether the active control is more effective
# than vehicle control

ttestratio(MN~Treatment,
 data=subset(Mutagenicity, Treatment=="Cyclo25"|Treatment=="Vehicle"),
 alternative="greater", rho=1, var.equal=FALSE)

# 2) lowest dose vs. vehicle control

ttestratio(MN~Treatment,
 data=subset(Mutagenicity, Treatment=="Hydro30"|Treatment=="Vehicle"),
 alternative="greater", rho=1, var.equal=FALSE)


#########################################################

# # # sci.ratio:
# Calculation of simultaneous confidence intervals for ratios
# of linear combinations of treatment means in a one-way ANOVA model

data(BW)
boxplot(Weight~Dose, data=BW)

# Body weights of a 90-day chronic toxicology study on rats
# with a control (1) and three dose groups (2,3,4).

# Calculate upper confidence limits for the ratio of means
# of the three dose groups vs. the control group:
# Which of the doses lead to not more than 90 percent weight loss
# compared to the control group:

m21 <- sci.ratio(Weight~Dose, data=BW, type="Dunnett",
 alternative="greater")

summary(m21)

plot(m21, rho0=0.9)

###########################################################

# # # simtest.ratio: Simultaneous tests for ratios of means 

## Not run: 
##D data(AP)
##D 
##D boxplot(prepost~treatment, data=AP)
##D 
##D # Test whether the differences of doses 50, 100, 150 vs. Placebo
##D # are non-inferior to the difference Active Control vs. Placebo 
##D 
##D NC <- rbind(
##D "(D100-D0)" = c(0,-1,1,0,0),
##D "(D150-D0)" = c(0,-1,0,1,0),
##D  "(D50-D0)" = c(0,-1,0,0,1))
##D 
##D DC <- rbind(
##D "(AC-D0)" = c(1,-1,0,0,0),
##D "(AC-D0)" = c(1,-1,0,0,0),
##D "(AC-D0)" = c(1,-1,0,0,0))
##D 
##D NC
##D DC
##D 
##D stAP <- simtest.ratio(prepost ~ treatment, data=AP,
##D  Num.Contrast=NC, Den.Contrast=DC, Margin.vec=c(0.9,0.9,0.9))
##D summary(stAP)
## End(Not run)

#####################################################################

# # # sci.ratio.gen:
# Simultaneous confidence intervals for ratios of coefficients
# in the general linear model:

# Slope-ratio assay, data from Jensen(1989), Biometrical Journal 31,
# 841-853.

data(SRAssay)
SRAssay

# In this problem, the interest is in simultaneous estimation
# of the ratios of slopes relative to the slope of the standard
# treatment. 

# First it is needed to carefully define the vector of responses 
# and the design matrix of th general linear model:
# The design matrix can be constructed using model.matrix,
# and the vector of the response variable can be extracted
# from the dataframe.

X <- model.matrix(Response~Treatment:Dose, data=SRAssay)
Response <- SRAssay[,"Response"]

# The response vector and the design matrix are:

X
Response

# The following coefficients result:

lm(Response~0+X)

# where the last four coefficients are the estimated slopes
# of the control treatment and the three new treatments

# Contrasts for the ratios of the slopes of the three new treatments
# vs. the control are then defined as:

Num.Contrast <- matrix(c(0,0,1,0,0,
                         0,0,0,1,0,
                         0,0,0,0,1),nrow=3,byrow=TRUE)
Den.Contrast <- matrix(c(0,1,0,0,0,
                         0,1,0,0,0,
                         0,1,0,0,0),nrow=3,byrow=TRUE)


summary(sci.ratio.gen(Y=Response, X=X,
 Num.Contrast=Num.Contrast, Den.Contrast=Den.Contrast))

########################################################################

# # # n.ratio: Sample size computations in comparisons with a
#     control based on relative margins.


  #
  #  Example 1: Sample size calculation in tests for non-inferiority
  #  (two-sample case)(Laster and Johnson (2003),
  #  Statistics in Medicine 22:187-200)

     n.ratio(m=1, rho=0.8, Power=0.8, CV0=0.75, rho.star=1,
     alpha=0.05)


  #
  #  Example 2: Sample size calculation in simultaneous tests for
  #  non-inferiority
  #  (Dilba et al. (2006), Statistics in Medicine 25: 1131-1147)

     n.ratio(m=3, rho=0.7, Power=0.8, CV0=0.5, rho.star=0.95,
     alpha=0.05)




