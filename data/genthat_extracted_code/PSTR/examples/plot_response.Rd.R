library(PSTR)


### Name: plot_response
### Title: Curve or surfaces of the expected reponse agaist the
###   corresponding variable.
### Aliases: plot_response
### Keywords: utils

### ** Examples

## No test: 
pstr = NewPSTR(Hansen99, dep='inva', indep=4:20, indep_k=c('vala','debta','cfa','sales'),
    tvars=c('vala','debta','cfa','sales'), iT=14) # create a new PSTR object

# estimate the PSTR model first
pstr = EstPSTR(use=pstr, im=1, iq=1, useDelta=TRUE, par=c(1.6,.5), method='CG')

# plot the curve and surfaces
ret = plot_response(obj=pstr, vars=1:4, log_scale = c(FALSE,TRUE), length.out=40)
attributes(ret)
ret$vala
ret$debta
## End(No test)




