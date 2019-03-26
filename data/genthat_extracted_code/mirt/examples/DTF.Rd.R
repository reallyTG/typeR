library(mirt)


### Name: DTF
### Title: Differential test functioning statistics
### Aliases: DTF
### Keywords: DTF

### ** Examples

## Not run: 
##D set.seed(1234)
##D n <- 30
##D N <- 500
##D 
##D # only first 5 items as anchors
##D model <- 'F = 1-30
##D           CONSTRAINB = (1-5, a1), (1-5, d)'
##D 
##D a <- matrix(1, n)
##D d <- matrix(rnorm(n), n)
##D group <- c(rep('Group_1', N), rep('Group_2', N))
##D 
##D ## -------------
##D # groups completely equal
##D dat1 <- simdata(a, d, N, itemtype = '2PL')
##D dat2 <- simdata(a, d, N, itemtype = '2PL')
##D dat <- rbind(dat1, dat2)
##D mod <- multipleGroup(dat, model, group=group, SE=TRUE,
##D                      invariance=c('free_means', 'free_var'))
##D plot(mod)
##D 
##D DTF(mod)
##D mirtCluster()
##D DTF(mod, draws = 1000) #95% C.I. for sDTF containing 0. uDTF is very small
##D DTF(mod, draws = 1000, plot='sDTF') #sDTF 95% C.I.'s across Theta always include 0
##D 
##D ## -------------
##D ## random slopes and intercepts for 15 items, and latent mean difference
##D ##    (no systematic DTF should exist, but DIF will be present)
##D set.seed(1234)
##D dat1 <- simdata(a, d, N, itemtype = '2PL', mu=.50, sigma=matrix(1.5))
##D dat2 <- simdata(a + c(numeric(15), runif(n-15, -.2, .2)),
##D                 d + c(numeric(15), runif(n-15, -.5, .5)), N, itemtype = '2PL')
##D dat <- rbind(dat1, dat2)
##D mod1 <- multipleGroup(dat, 1, group=group)
##D plot(mod1) #does not account for group differences! Need anchors
##D 
##D mod2 <- multipleGroup(dat, model, group=group, SE=TRUE,
##D                       invariance=c('free_means', 'free_var'))
##D plot(mod2)
##D 
##D #significant DIF in multiple items....
##D # DIF(mod2, which.par=c('a1', 'd'), items2test=16:30)
##D DTF(mod2)
##D DTF(mod2, draws=1000) #non-sig DTF due to item cancellation
##D 
##D ## -------------
##D ## systematic differing slopes and intercepts (clear DTF)
##D dat1 <- simdata(a, d, N, itemtype = '2PL', mu=.50, sigma=matrix(1.5))
##D dat2 <- simdata(a + c(numeric(15), rnorm(n-15, 1, .25)), d + c(numeric(15), rnorm(n-15, 1, .5)),
##D                 N, itemtype = '2PL')
##D dat <- rbind(dat1, dat2)
##D mod3 <- multipleGroup(dat, model, group=group, SE=TRUE,
##D                       invariance=c('free_means', 'free_var'))
##D plot(mod3) #visable DTF happening
##D 
##D # DIF(mod3, c('a1', 'd'), items2test=16:30)
##D DTF(mod3) #unsigned bias. Signed bias indicates group 2 scores generally higher on average
##D DTF(mod3, draws=1000)
##D DTF(mod3, draws=1000, plot='func')
##D DTF(mod3, draws=1000, plot='sDTF') #multiple DTF areas along Theta
##D 
##D # evaluate specific values for sDTF
##D Theta_nodes <- matrix(seq(-6,6,length.out = 100))
##D sDTF <- DTF(mod3, Theta_nodes=Theta_nodes)
##D head(sDTF)
##D sDTF <- DTF(mod3, Theta_nodes=Theta_nodes, draws=100)
##D head(sDTF)
##D 
## End(Not run)



