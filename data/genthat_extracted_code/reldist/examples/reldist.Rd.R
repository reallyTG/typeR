library(reldist)


### Name: reldist
### Title: Inference for Relative Distributions
### Aliases: reldist
### Keywords: distribution

### ** Examples

#
# First load the data.
#

data(nls, package="reldist")

#
# A simple example comparing permanent wages of the original to the
# recent cohort in the NLS.  See H&M (1999) for details.

reldist(y=recent$chpermwage,yo=original$chpermwage)

#
# A more sophisticated version of the same.
#

reldist(y=recent$chpermwage, yo=original$chpermwage,
        yowgt=original$wgt, ywgt=recent$wgt,      
        bar=TRUE,                                   
        smooth=0.1,                              
        yolabs=seq(-1, 3, by=0.5),                 
        ylim=c(0, 3.0),cex=0.8,                   
        ylab="Relative Density",                 
        xlab="Proportion of the Original Cohort")

#
# A CDF version.
#

reldist(y=recent$chpermwage, yo=original$chpermwage,
    yowgt=original$wgt, ywgt=recent$wgt,      
    cdfplot=TRUE,                               
    smooth=0.4,                              
    yolabs=seq(-1,3,by=0.5),                 
    ylabs=seq(-1,3,by=0.5),                  
    cex=0.8,                                 
    ylab="proportion of the recent cohort",  
    xlab="proportion of the original cohort")



