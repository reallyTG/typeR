library(mirt)


### Name: SIBTEST
### Title: Simultaneous Item Bias Test (SIBTEST)
### Aliases: SIBTEST
### Keywords: SIBTEST SIBTEST, crossing

### ** Examples


## Not run: 
##D 
##D set.seed(1234)
##D n <- 30
##D N <- 500
##D a <- matrix(1, n)
##D d <- matrix(rnorm(n), n)
##D group <- c(rep('reference', N), rep('focal', N*2))
##D 
##D ## -------------
##D # groups completely equal
##D dat1 <- simdata(a, d, N, itemtype = 'dich')
##D dat2 <- simdata(a, d, N*2, itemtype = 'dich')
##D dat <- rbind(dat1, dat2)
##D 
##D #DIF (all other items as anchors)
##D SIBTEST(dat, group, suspect_set = 6)
##D 
##D #DIF (specific anchors)
##D SIBTEST(dat, group, match_set = 1:5, suspect_set = 6)
##D 
##D # DBF (all and specific anchors, respectively)
##D SIBTEST(dat, group, suspect_set = 11:30)
##D SIBTEST(dat, group, match_set = 1:5, suspect_set = 11:30)
##D 
##D #DTF
##D SIBTEST(dat, group, suspect_set = 11:30)
##D SIBTEST(dat, group, match_set = 1:10) #equivalent
##D 
##D # different hyper pars
##D dat1 <- simdata(a, d, N, itemtype = 'dich')
##D dat2 <- simdata(a, d, N*2, itemtype = 'dich', mu = .5, sigma = matrix(1.5))
##D dat <- rbind(dat1, dat2)
##D SIBTEST(dat, group, 6:30)
##D SIBTEST(dat, group, 11:30)
##D 
##D #DIF testing with anchors 1 through 5
##D SIBTEST(dat, group, 6, match_set = 1:5)
##D SIBTEST(dat, group, 7, match_set = 1:5)
##D SIBTEST(dat, group, 8, match_set = 1:5)
##D 
##D #DIF testing with all other items as anchors
##D SIBTEST(dat, group, 6)
##D SIBTEST(dat, group, 7)
##D SIBTEST(dat, group, 8)
##D 
##D ## -------------
##D ## systematic differing slopes and intercepts (clear DTF)
##D dat1 <- simdata(a, d, N, itemtype = 'dich')
##D dat2 <- simdata(a + c(numeric(15), rnorm(n-15, 1, .25)), d + c(numeric(15), rnorm(n-15, 1, 1)),
##D   N*2, itemtype = 'dich')
##D dat <- rbind(dat1, dat2)
##D SIBTEST(dat, group, 6:30)
##D SIBTEST(dat, group, 11:30)
##D 
##D #DIF testing using valid anchors
##D SIBTEST(dat, group, suspect_set = 6, match_set = 1:5)
##D SIBTEST(dat, group, suspect_set = 7, match_set = 1:5)
##D SIBTEST(dat, group, suspect_set = 30, match_set = 1:5)
##D 
## End(Not run)



