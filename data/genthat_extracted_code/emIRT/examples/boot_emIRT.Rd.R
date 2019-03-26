library(emIRT)


### Name: boot_emIRT
### Title: Parametric bootstrap of EM Standard Errirs
### Aliases: boot_emIRT
### Keywords: multivariate

### ** Examples


## Not run: 
##D 
##D ### Binary IRT example
##D example(binIRT)
##D boot.bin <- boot_emIRT(lout, .data = rc, .starts = s, .priors = p,
##D   .control = list(threads = 1, verbose = FALSE, thresh = 1e-06), Ntrials=10, verbose=2)
##D boot.bin$bse$x
##D 
##D ### Dynamic IRT example
##D example(dynIRT)
##D boot.dyn <- boot_emIRT(lout, .data = mq_data$data.mq, .starts = mq_data$cur.mq,
##D   .priors = mq_data$priors.mq, .control = list(threads = 1, verbose = FALSE,
##D   thresh = 1e-06), Ntrials=10, verbose=2)
##D boot.dyn$bse$x
##D 
##D ### Ordinal IRT example
##D example(ordIRT)
##D boot.ord <- boot_emIRT(lout, .data=newrc, .starts=cur, .priors=priors,
##D   .control = list(threads = 1, verbose = TRUE, thresh = 1e-6, maxit=300,
##D   checkfreq=50), Ntrials=5, verbose=1)
##D boot.ord$bse$x
##D 
##D ### Hierarhical IRT example
##D example(hierIRT, run.dontrun=TRUE)
##D boot.hier <- boot_emIRT((lout, .data=dwnom$data.in, .starts=dwnom$cur, .priors=dwnom$priors,
##D 	.control=list(threads = 8, verbose = TRUE, thresh = 1e-4, maxit=200, checkfreq=1),
##D 	Ntrials=5, verbose=1)
##D boot.hier$bse$x_implied
##D 
## End(Not run)




