library(mirt)


### Name: draw_parameters
### Title: Draw plausible parameter instantiations from a given model
### Aliases: draw_parameters

### ** Examples


## Not run: 
##D set.seed(1234)
##D n <- 40
##D N <- 500
##D 
##D # only first 5 items as anchors
##D model <- 'F = 1-40
##D           CONSTRAINB = (1-5, a1), (1-5, d)'
##D 
##D a <- matrix(1, n)
##D d <- matrix(rnorm(n), n)
##D group <- c(rep('Group_1', N), rep('Group_2', N))
##D 
##D ## -------------
##D # groups completely equal
##D dat1 <- simdata(a, d, N, itemtype = 'dich')
##D dat2 <- simdata(a, d, N, itemtype = 'dich')
##D dat <- rbind(dat1, dat2)
##D mod <- multipleGroup(dat, model, group=group, SE=TRUE,
##D                      invariance=c('free_means', 'free_var'))
##D 
##D param_set <- draw_parameters(mod, 100)
##D head(param_set)
## End(Not run)




