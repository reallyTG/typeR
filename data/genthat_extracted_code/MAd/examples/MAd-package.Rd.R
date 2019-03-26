library(MAd)


### Name: MAd-package
### Title: Meta-Analysis with Mean Differences
### Aliases: MAd-package MAd
### Keywords: package

### ** Examples
 
## EXAMPLES FOR EACH BROAD AREA

# SAMPLE DATA:
MA <- data.frame(id=factor(rep(1:5, 3)),
                 measure=c(rep("dep",5), rep("anx",5), rep("shy",5)),
                 es=c(rnorm(5, 0.8, .2), rnorm(5, 0.5, .1), rnorm(5, 0.4, .1)),
                 var.es=abs(rnorm(5*3,0.05, .03)),
                 nT=round(rnorm(5*3, 30, 5),0),
                 nC=round(rnorm(5*3, 30, 5),0),
                 mod1=factor(rep(c("a","b","c","d","e"),3)),
                 mod2=rep(seq(20, 60, 10), 3))
                 
# 1. COMPUTE MEAN DIFFERENCE STATISTIC FROM 
# REPORTED STATS (GENERALLY FROM A PRIMARY STUDY):
 
# suppose the primary study reported an log odds ratio for different 
# proportions between 2 groups. Then, running:

lor_to_d(.9070,.0676)
           
# reported log odds ratio (lor = .9070) and variance (.0676) will output the 
# standardized mean difference (d) and its variance (var.d) that can be used in 
# a meta-analysis.

## 2. ACCOUNT FOR DEPENDENCIES: WITHIN-STUDY EFFECT SIZES (ES): 

## 2 EXAMPLES:  
# EXAMPLE 1:  AGGREGATING EFFECT SIZES FOR A DATA FRAME 
# (MULTIPLE STUDIES AT LEAST SOME OF WHICH HAVE MULTIPLE DEPENDENT EFFECT SIZES)   
# EXAMPLE 2:  AGGREGATING EFFECT SIZES FOR SINGLE STUDY WITH THREE OR MORE
# EFFECT SIZES WHEN PAIRS OF DVS HAVE DIFFERENT CORRELATIONS 

## EXAMPLE 1:  MA IS A DATA FRAME CONTAINING MULTIPLE STUDIES (id),
## EACH WITH MULTIPLE EFFECT SIZES (CORRELATIONS BETWEEN ALL PAIRS OF DVS ARE r=.5.)


# AGGREGATION PROCEDURE:  
# method="GO1"; GLESER AND OLKIN (1994) PROCEDURE WHEN d IS COMPUTED 
# USING POOLED SD IN THE DENOMINATOR

MA1 <- agg(id=id, es=es, var=var.es, n.1=nT, n.2=nC, cor = .5, method="GO1", data=MA)   

MA1

## EXAMPLE 2: STUDY 1 COMPARES A TREATMENT AND CONTROL GROUP ON 
## THREE OUTCOME MEASURES (DEPRESSION, ANXIETY, and SHYNESS).
# THE CORRELATION AMONG THE THREE PAIRS OF DVS ARE r12=.5, r13=.2, and r23=.3.  

study1 <- data.frame( id=factor(rep(1, 3)), 
                      measure=c("dep", "anx", "shy"),
                      es=c(0.8, 0.5, 0.4), 
                      var.es=c(0.01, 0.02, 0.1), 
                      nT=rep(30, 3), 
                      nC=rep(30, 3))  

# ONE WOULD CONSTRUCT THE CORRELATION MATRIX AS FOLLOWS:  

cors <- matrix(c(1,.5,.2, 
                 .5,1,.3, 
                 .2,.3,1), nrow=3)  

# AGGREGATION PROCEDURE:
# method="GO1"; GLESER AND OLKIN (1994) PROCEDURE WHEN d 
# IS COMPUTED USING POOLED SD IN THE DENOMINATOR 

agg(id=id, es=es, var=var.es, n.1=nT, n.2=nC, cor=cors, method="GO1", mod = NULL, data=study1)   


# where MA = data.frame with columns for id, es (standardized
# mean difference), var.es (variance of es), n.1 (sample size of group
# one), and n.2 (sample size of comparison group) with multiple rows per
# study. Outputs an aggregated data.frame with 1 effect size per study. 

## 3.OMNIBUS ANALYSIS

# FIRST ADD MODERATORS TO THE AGGREGATED DATASET:

MODS <- data.frame(id=1:5,
                   mod1=factor(c("a","b","a","b","b")),
                   mod2=as.numeric(c(20, 30, 25, 35, 40)))
                   
MA2 <- merge(MA1, MODS, by='id')

# Random Effects
m0 <- mareg(es1~ 1, var = var1, method = "REML", data = MA2)

# where MA = data.frame with columns for id, es (standardized
# mean difference), var.es (variance of es), n.1 (sample size of group
# one), and n.2 (sample size of comparison group).
 
# view output:
summary(m0)


# 4. MODERATOR ANALYSIS:

# Random Effects
m1 <- mareg(es1~ mod1 + mod2 , var = var1, method = "REML", data = MA2) 
 
# view output:
summary(m1)

# 5. Graphics:

## Not run: 
##D plotcon(g = es1, var = var1, mod = mod1, data = MA2, method= "random", 
##D modname= "Moderator") 
## End(Not run)

# Additional Functions

# Export MA output to nicely formatted Word tables.

# install R2wd
# install.packages('R2wd', dependencies = TRUE)

# Export data to Word in formatted table

#  wd(m1, get = TRUE, new = TRUE)



