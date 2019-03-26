library(PSTR)


### Name: plot_transition
### Title: Plot the transition function of the estimated PSTR model.
### Aliases: plot_transition
### Keywords: utils

### ** Examples

## No test: 
pstr = NewPSTR(Hansen99, dep='inva', indep=4:20, indep_k=c('vala','debta','cfa','sales'),
    tvars=c('vala'), iT=14) # create a new PSTR object

# estimate the PSTR model
pstr = EstPSTR(use=pstr, im=1, iq=1, useDelta=TRUE, par=c(1.6,.5), method='CG')

# plot the transition function

ret = plot_transition(pstr)
# plot by running
ret

ret = plot_transition(pstr, color = "blue", size = 2,
    x="customize the label for x axis",y="customize the label for y axis",
    title="The Title",subtitle="The subtitle",caption="Make a caption here.",log_scale=TRUE)
ret
## End(No test)




