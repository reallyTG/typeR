library(c212)


### Name: c212.ptheta
### Title: Reports the posterior probability that theta (the increase in
###   the log-odds) is greater than zero for each Adverse Event
### Aliases: c212.ptheta
### Keywords: c212.ptheta Bayesian Hierarchy Berry and Berry

### ** Examples


## Not run: 
##D data(c212.trial.data)
##D raw = c212.BB(c212.trial.data)
## End(Not run)

## Not run: 
##D p = c212.BB.ptheta(rm)
##D 
##D head(p)
##D           B       AE    ptheta
##D 1 Bdy-sys_1 Adv-Ev_1 0.2560500
##D 2 Bdy-sys_2 Adv-Ev_2 0.9426417
##D 3 Bdy-sys_2 Adv-Ev_3 0.8751500
##D 4 Bdy-sys_2 Adv-Ev_4 0.1154917
##D 5 Bdy-sys_2 Adv-Ev_5 0.2317417
##D 6 Bdy-sys_3 Adv-Ev_6 1.0000000
## End(Not run)



