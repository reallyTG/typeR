library(bimetallic)


### Name: Power of Chi-square tests
### Title: Power of Chi-square tests
### Aliases: chisq.sim.factory is.legal chisq.lytic.func dlambda

### ** Examples

##Make a chisq simulator under a study scenario
sim = chisq.sim.factory(R = 4, gam_ca = 3, gam_co = 0,
	ppv = .8, npv = 1, homRR = 2.2, N_co = 1000,
	maf = .1, prev = .01, model = "mult")

##Run one realization of the simulation
sim()

##Run 100 realizations of the simulation
times = 100
chisq_or = as.data.frame(t(replicate(times, sim())))

##Find the number of times chisq_or$stat.X2[i] exceeded .01 significance
sig = .01
critval = qchisq(1-sig, 2)
nsucess = sum(chisq_or$stat > critval)

##Find the power
nsucess/times

##Compare to asymptotic
lambda = chisq.lytic.func(R = 4, gam_ca = 3, gam_co = 0,
	ppv = .8, npv = 1, homRR = 2.2, N_co = 1000,
	maf = .1, prev = .01, model = "mult")

1-pchisq(qchisq(1-sig, 2), 2, ncp=lambda)

## generate a multifactorial design
paramset = list(R = c(.5, 1, 2, 4), gam_ca = c(0, 1), gam_co = 0,
	ppv = c(.4, .6, .8), npv = .8, homRR = c(1.4, 3, 9), N_co = 1000,
	maf = .1, prev = .01, model = "mult")
paramgrid = do.call(expand.grid, c(paramset, stringsAsFactors=FALSE))

##call chisq.lytic and dlambda for each experiment
lambda = vector()
dl = vector()
for( i in 1:nrow(paramgrid)){
	lambda[i] = do.call(chisq.lytic.func, paramgrid[i,])
	dl[i] = do.call(dlambda, paramgrid[i,])
}

##bind it to the parameter data.frame 
##calculate the difference in lambda for gam_ca=0 vs gam_ca=1
paramgrid = cbind(paramgrid, lambda, dl)
param0 = subset(paramgrid, gam_ca==0)
param1 = subset(paramgrid, gam_ca==1)
all(paste(param0[,c(1, 3:10)])==paste(param1[,c(1, 3:10)]))
param0 = cbind(param0, finite_diff_dl = param1$lambda - param0$lambda)

##do they agree?
with(param0, cor(dl, finite_diff_dl))



