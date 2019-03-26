library(geoR)


### Name: proflik
### Title: Computes Profile Likelihoods
### Aliases: proflik .proflik.aux0 .proflik.aux1 .proflik.aux10
###   .proflik.aux11 .proflik.aux1.1 .proflik.aux12 .proflik.aux13
###   .proflik.aux14 .proflik.aux15 .proflik.aux16 .proflik.aux17
###   .proflik.aux18 .proflik.aux19 .proflik.aux2 .proflik.aux20
###   .proflik.aux21 .proflik.aux21.1 .proflik.aux22 .proflik.aux23
###   .proflik.aux24 .proflik.aux27 .proflik.aux28 .proflik.aux30
###   .proflik.aux3 .proflik.aux31 .proflik.aux32 .proflik.aux33
###   .proflik.aux4 .proflik.aux5 .proflik.aux6 .proflik.aux7 .proflik.aux8
###   .proflik.aux9 .proflik.cov .proflik.lambda .proflik.main
### Keywords: spatial

### ** Examples

op <- par(no.readonly=TRUE)
ml <- likfit(s100, ini=c(.5, .5), fix.nug=TRUE)
## a first atempt to find reasonable values for the x-axis:
prof <- proflik(ml, s100, sill.values=seq(0.5, 1.5, l=4),
                range.val=seq(0.1, .5, l=4))
par(mfrow=c(1,2))
plot(prof)
## a nicer setting 
## Not run: 
##D prof <- proflik(ml, s100, sill.values=seq(0.45, 2, l=11),
##D                 range.val=seq(0.1, .55, l=11))
##D plot(prof)
##D ## to include 2-D profiles use:
##D ## (commented because this is time demanding)
##D #prof <- proflik(ml, s100, sill.values=seq(0.45, 2, l=11),
##D #                range.val=seq(0.1, .55, l=11), uni.only=FALSE)
##D #par(mfrow=c(2,2))
##D #plot(prof, nlevels=16)
## End(Not run)
par(op)



