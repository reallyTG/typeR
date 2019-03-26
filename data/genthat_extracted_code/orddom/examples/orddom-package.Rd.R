library(orddom)


### Name: orddom-package
### Title: Ordinal Dominance Statistics
### Aliases: orddom-package 'cliff's delta'
### Keywords: nonparametric robust htest

### ** Examples
## Not run: 
##D #ordinal comparison and delta statistics for independent groups x and y 
##D #(e.g. x:comparison/control group and y:treatment/experimental group)
##D orddom(x,y,paired=FALSE) 
##D #
##D #ordinal comparison and delta statistics for paired data 
##D #(e.g. x:Pretest/Baseline and y:Posttest)
##D orddom(x,y,paired=TRUE)  
##D #
##D #Dominance Matrix production
##D dms(x,y,paired=T)
##D #
##D #Print dominance matrix 
##D orddom_p(x,y,sections="4a")
##D #
##D #Graphic output and interpretational text for Cliff's delta statistics
##D delta_gr(x,y)
##D #
##D #nonparametric effect sizes (SRD/delta, A/AUC, CL/PS, NNT)
##D #(e.g. C:control group scores, T:treatment group scores)
##D dmes(C,T)
##D #
##D #Convert Cliff's delta value to Cohen's d (as distributional non-overlap)
##D delta2cohd(dmes(C,T)$dc)
##D #
##D #Confidence Interval estimate of AUC (by bootstrap)
##D #cf. Ruscio, J. & Mullen, T. (2012)
##D #(e.g. C:control group scores, T:treatment group scores)
##D dmes.boot(C,T,theta.es="Ac")
## End(Not run)


