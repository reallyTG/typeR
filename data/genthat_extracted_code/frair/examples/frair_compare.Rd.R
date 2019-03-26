library(frair)


### Name: frair_compare
### Title: Test the difference between two functional response fits
### Aliases: frair_compare typeI_diff typeI_nll_diff rogersII_diff
###   rogersII_nll_diff hollingsII_diff hollingsII_nll_diff hassIII_diff
###   hassIII_nll_diff hassIIInr_diff hassIIInr_nll_diff emdII_diff
###   emdII_nll_diff flexp_diff flexp_nll_diff flexpnr_diff
###   flexpnr_nll_diff

### ** Examples

data(gammarus)

pulex <- gammarus[gammarus$spp=='G.pulex',]
celt <- gammarus[gammarus$spp=='G.d.celticus',]

pulexfit <- frair_fit(eaten~density, data=pulex, 
                response='rogersII', start=list(a = 1.2, h = 0.015), 
                fixed=list(T=40/24))
celtfit <- frair_fit(eaten~density, data=celt, 
                response='rogersII', start=list(a = 1.2, h = 0.015), 
                fixed=list(T=40/24))
# The following tests the null hypothesis that the 
# true difference between the coefficients is zero:
frair_compare(pulexfit, celtfit) # Reject null for 'h', do not reject for 'a'

## Not run: 
##D # Provides a similar conclusion to bootstrapping followed by 95% CIs
##D pulexfit_b <- frair_boot(pulexfit)
##D celtfit_b <- frair_boot(celtfit)
##D confint(pulexfit_b)
##D confint(celtfit_b) # 'a' definitely overlaps
## End(Not run)



