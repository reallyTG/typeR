library(MAc)


### Name: MAc-package
### Title: Meta-Analysis with Correlations
### Aliases: MAc-package MAc
### Keywords: package

### ** Examples
 
# Examples for each broad area:

id<-c(1:20)
n<-c(10,20,13,22,28,12,12,36,19,12,36,75,33,121,37,14,40,16,14,20)
r<-c(.68,.56,.23,.64,.49,-.04,.49,.33,.58,.18,-.11,.27,.26,.40,.49,
.51,.40,.34,.42,.16)
mod1<-c(1,2,3,4,1,2,8,7,5,3,9,7,5,4,3,2,3,5,7,1)
dat<-data.frame(id,n,r,mod1)
dat$var.r <- var_r(dat$r, dat$n) # MAc function to derive variance
dat$z <- r_to_z(dat$r)  # MAc function to convert to Fisher's z (z')
dat$var.z <- var_z(dat$n)  # MAc function for variance of z'
dat$mods2 <- factor(rep(1:2, 10))
dat

# Note: for all the examples in this manual, we have made up data and manually 
# created variables and datasets. If conducting your own meta-analysis, 
# a more convenient way for using the functions is to import your data from
# a .csv file (with relevant variables in the dataset). One way to do this:
# dat <- read.csv(file.choose(), header = TRUE)
#
# Then, you can run the functions with this dataset and you do not need to 
# manually create your dataset, as we have done above.
  
  

# 1. Computations to Calculate Correlations:
 
# For example, suppose the primary study reported a t-test value for differences 
# between 2 groups and the total sample size. Then, running:

r_from_t (1.74, 30)  

# reported t-value (1.74) and sample size (30) will output the 
# correlation desired for use in the meta-analysis.

# 2. Within-Study Aggregation of Effect Sizes: 

agg(id = id, r = r, n = n, data=dat) 

# where data = data.frame with columns for id, r (correlation coefficient),
# and n (sample size) with multiple rows within each study (multiple
# correlations reported for each study). Outputs an aggregated data.frame 
# with 1 effect size per study. 

# 3. Fixed and Random Effects Omnibus Analysis

omni(es = z, var = var.z, data = dat, type="weighted", method = "random", ztor = TRUE)

# where data = data.frame with columns for id, es (r or z')
# , var (variance of r or z'), n (sample size). ztor = if using z', should
# it be converted back to r? see omni documentation for more details.
 
# 4. Moderator Analyses:

# Random effects
mareg(z~ mod1 + mods2, var = var.z, method = "REML", ztor = TRUE, data = dat) 
 
# where data = data.frame with columns for es (r or z'),
# var (variance of r or z') and moderators.

# 5. Graphics:

## Not run: 
##D plotcon(es = r, var = var.r, mod = mod1, data = dat, method= "random", 
##D modname= "Moderator") 
## End(Not run)

# Additional Functions

# Export MA output to nicely formatted Word tables.

# install R2wd
# install.packages('R2wd', dependencies = TRUE)

# mareg fuction

temp <- mareg(z~ mod1 + mods2, var = var.z, method = "REML", ztor = TRUE, data = dat) 

# Export data to Word in formatted table

#  wd(temp, get = TRUE, new = TRUE)



