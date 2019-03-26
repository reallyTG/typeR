library(MAd)


### Name: agg
### Title: Aggregate Dependent Effect Sizes
### Aliases: agg
### Keywords: aggregation

### ** Examples

## 2 EXAMPLES:  

# EXAMPLE 1:  Aggregating effect sizes for a data frame
# (multiple studies at least some of which have multiple
# effect sizes), assuming equal correlations (r=.5) between
# pairs of DVs.
# EXAMPLE 2:  Aggregating effect sizes for a single study
# with 3 or more effect sizes when pairs of DVs have 
# different correlations.

# LOAD DATA (EXAMPLE DATA FROM HOYT & DEL RE, 2015 SIMULATION):
data(dat.hoyt)

## EXAMPLE 1:  dat.hoyt is a data frame with multiple studies identified
## by variable 'id'.  Each study has multiple effect sizes based on 
## multiple DVs.  Correlations between all pairs of DVs are r=.5.

# NOTE: Based on a simulation study by Hoyt & Del Re (2015), it is
# recommended that methods "G01" and "G02" (Gleser and Olkin) 
# should aggregate Cohen's d, without using Hedges & Olkin's 
# recommended bias correction.  (Studies providing only a single
# effect size should still be corrected for bias, after aggregation.)

# Method "BHHR" should aggregate Hedges' g, after bias correction.


# Option 1: method="BHHR"; Borenstein et al. (2009) procedure. 
# Use with Hedges' g; can also be used with any other effect 
# size (e.g., z', LOR).

agg(id=id, es=g, var=vg,  cor=.5,
    method="BHHR", mod=NULL, data=dat.hoyt) 

#  Option 2: method="GO1"; Gleser & Olkin (1994) procedure when
#  d is computed using pooled sd in denominator. 

agg(id=id, es=d, var=vd, n.1=n.T, n.2=n.C, cor = .5, 
    method="GO1", mod = NULL, data=dat.hoyt)   

# Option 3: method="GO2"; Gleser & Olkin (1994) procedure when
# d is computed using sd.2 (typically control group sd)
# in denominator

agg(id=id, es=d, var=vd, n.1=n.T, n.2=n.C, cor = .5, 
    method="GO2", mod = NULL, data=dat.hoyt)   


## EXAMPLE 2: Single study comparing T and C group
## on three DVs:  depression, anxiety, and shyness
## r12=.5; r13=.2; r23=.3

data <- dat.hoyt[20:22,]

# Step 1:  Create the correlation matrix, based on r12, r13, and r23:  

cors <- matrix(c(1,.5,.2, 
                 .5,1,.3, 
                 .2,.3,1), nrow=3)  

# Step 2:  Aggregate using agg() function.

# Option 1: method="BHHR"; Borenstein et al. (2009) procedure. 
# Use with Hedges' g; can also be used with any other effect 
# size (e.g., z', LOR).

agg(id=id, es=g, var=vg,  cor=cors,
    method="BHHR", mod=NULL, data=data) 

#  Option 2: method="GO1"; Gleser & Olkin (1994) procedure when
#  d is computed using pooled sd in denominator. 

agg(id=id, es=d, var=vd, n.1=n.T, n.2=n.C, cor = cors, 
    method="GO1", mod = NULL, data=data)   

# Option 3: method="GO2"; Gleser & Olkin (1994) procedure when
# d is computed using sd.2 (typically control group sd)
# in denominator

agg(id=id, es=d, var=vd, n.1=n.T, n.2=n.C, cor = cors, 
    method="GO2", mod = NULL, data=data)   


## Citation ##
# Hoyt, W. T., & Del Re, A. C. (2013).  Comparison of methods for 
# aggregating dependent effect sizes in meta-analysis.  
# Manuscript submitted for publication.

  





