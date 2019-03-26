library(mirt)


### Name: DRF
### Title: Differential Response Functioning statistics
### Aliases: DRF
### Keywords: DRF

### ** Examples

## Not run: 
##D 
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
##D dat1 <- simdata(a, d, N, itemtype = 'dich')
##D dat2 <- simdata(a, d, N, itemtype = 'dich')
##D dat <- rbind(dat1, dat2)
##D mod <- multipleGroup(dat, model, group=group, SE=TRUE,
##D                      invariance=c('free_means', 'free_var'))
##D plot(mod)
##D plot(mod, which.items = 6:10) #DBF
##D plot(mod, type = 'itemscore')
##D plot(mod, type = 'itemscore', which.items = 10:15)
##D 
##D DRF(mod)
##D DRF(mod, focal_items = 6:10) #DBF
##D DRF(mod, DIF=TRUE)
##D DRF(mod, DIF=TRUE, focal_items = 10:15)
##D 
##D DRF(mod, plot = TRUE)
##D DRF(mod, focal_items = 6:10, plot = TRUE) #DBF
##D DRF(mod, DIF=TRUE, plot = TRUE)
##D DRF(mod, DIF=TRUE, focal_items = 10:15, plot = TRUE)
##D 
##D mirtCluster()
##D DRF(mod, draws = 500)
##D DRF(mod, draws = 500, plot=TRUE)
##D 
##D # pre-draw parameter set to save computations
##D param_set <- draw_parameters(mod, draws = 500)
##D DRF(mod, focal_items = 6, param_set=param_set) #DIF
##D DRF(mod, DIF=TRUE, param_set=param_set) #DIF
##D DRF(mod, focal_items = 6:10, param_set=param_set) #DBF
##D DRF(mod, param_set=param_set) #DTF
##D 
##D DRF(mod, focal_items = 6:10, draws=500) #DBF
##D DRF(mod, focal_items = 10:15, draws=500) #DBF
##D 
##D DIFs <- DRF(mod, draws = 500, DIF=TRUE)
##D print(DIFs)
##D DRF(mod, draws = 500, DIF=TRUE, plot=TRUE)
##D 
##D DIFs <- DRF(mod, draws = 500, DIF=TRUE, focal_items = 6:10)
##D print(DIFs)
##D DRF(mod, draws = 500, DIF=TRUE, focal_items = 6:10, plot = TRUE)
##D 
##D DRF(mod, DIF=TRUE, focal_items = 6)
##D DRF(mod, draws=500, DIF=TRUE, focal_items = 6)
##D 
##D # evaluate specific values for sDRF
##D Theta_nodes <- matrix(seq(-6,6,length.out = 100))
##D 
##D sDTF <- DRF(mod, Theta_nodes=Theta_nodes)
##D head(sDTF)
##D sDTF <- DRF(mod, Theta_nodes=Theta_nodes, draws=200)
##D head(sDTF)
##D 
##D # sDIF (isolate single item)
##D sDIF <- DRF(mod, Theta_nodes=Theta_nodes, focal_items=6)
##D head(sDIF)
##D sDIF <- DRF(mod, Theta_nodes=Theta_nodes, focal_items = 6, draws=200)
##D head(sDIF)
##D 
##D ## -------------
##D ## random slopes and intercepts for 15 items, and latent mean difference
##D ##    (no systematic DTF should exist, but DIF will be present)
##D set.seed(1234)
##D dat1 <- simdata(a, d, N, itemtype = 'dich', mu=.50, sigma=matrix(1.5))
##D dat2 <- simdata(a + c(numeric(15), rnorm(n-15, 0, .25)),
##D                 d + c(numeric(15), rnorm(n-15, 0, .5)), N, itemtype = 'dich')
##D dat <- rbind(dat1, dat2)
##D mod1 <- multipleGroup(dat, 1, group=group)
##D plot(mod1)
##D DRF(mod1) #does not account for group differences! Need anchors
##D 
##D mod2 <- multipleGroup(dat, model, group=group, SE=TRUE,
##D                       invariance=c('free_means', 'free_var'))
##D plot(mod2)
##D 
##D #significant DIF in multiple items....
##D # DIF(mod2, which.par=c('a1', 'd'), items2test=16:30)
##D DRF(mod2)
##D DRF(mod2, draws=500) #non-sig DTF due to item cancellation
##D 
##D ## -------------
##D ## systematic differing slopes and intercepts (clear DTF)
##D set.seed(1234)
##D dat1 <- simdata(a, d, N, itemtype = 'dich', mu=.50, sigma=matrix(1.5))
##D dat2 <- simdata(a + c(numeric(15), rnorm(n-15, 1, .25)), d + c(numeric(15), rnorm(n-15, 1, .5)),
##D                 N, itemtype = 'dich')
##D dat <- rbind(dat1, dat2)
##D mod3 <- multipleGroup(dat, model, group=group, SE=TRUE,
##D                       invariance=c('free_means', 'free_var'))
##D plot(mod3) #visable DTF happening
##D 
##D # DIF(mod3, c('a1', 'd'), items2test=16:30)
##D DRF(mod3) #unsigned bias. Signed bias indicates group 2 scores generally higher on average
##D DRF(mod3, draws=500)
##D DRF(mod3, draws=500, plot=TRUE) #multiple DRF areas along Theta
##D 
##D # plot the DIF
##D DRF(mod3, draws=500, DIF=TRUE, plot=TRUE)
##D 
##D # evaluate specific values for sDRF
##D Theta_nodes <- matrix(seq(-6,6,length.out = 100))
##D sDTF <- DRF(mod3, Theta_nodes=Theta_nodes, draws=200)
##D head(sDTF)
##D 
##D # DIF
##D sDIF <- DRF(mod3, Theta_nodes=Theta_nodes, focal_items = 30, draws=200)
##D car::some(sDIF)
##D 
##D ## ----------------------------------------------------------------
##D ### multidimensional DTF
##D 
##D set.seed(1234)
##D n <- 50
##D N <- 1000
##D 
##D # only first 5 items as anchors within each dimension
##D model <- 'F1 = 1-25
##D           F2 = 26-50
##D           COV = F1*F2
##D           CONSTRAINB = (1-5, a1), (1-5, 26-30, d), (26-30, a2)'
##D 
##D a <- matrix(c(rep(1, 25), numeric(50), rep(1, 25)), n)
##D d <- matrix(rnorm(n), n)
##D group <- c(rep('Group_1', N), rep('Group_2', N))
##D Cov <- matrix(c(1, .5, .5, 1.5), 2)
##D Mean <- c(0, 0.5)
##D 
##D # groups completely equal
##D dat1 <- simdata(a, d, N, itemtype = 'dich', sigma = cov2cor(Cov))
##D dat2 <- simdata(a, d, N, itemtype = 'dich', sigma = Cov, mu = Mean)
##D dat <- rbind(dat1, dat2)
##D mod <- multipleGroup(dat, model, group=group, SE=TRUE,
##D                      invariance=c('free_means', 'free_var'))
##D coef(mod, simplify=TRUE)
##D plot(mod, degrees = c(45,45))
##D DRF(mod)
##D 
##D # some intercepts slightly higher in Group 2
##D d2 <- d
##D d2[c(10:15, 31:35)] <- d2[c(10:15, 31:35)] + 1
##D dat1 <- simdata(a, d, N, itemtype = 'dich', sigma = cov2cor(Cov))
##D dat2 <- simdata(a, d2, N, itemtype = 'dich', sigma = Cov, mu = Mean)
##D dat <- rbind(dat1, dat2)
##D mod <- multipleGroup(dat, model, group=group, SE=TRUE,
##D                      invariance=c('free_means', 'free_var'))
##D coef(mod, simplify=TRUE)
##D plot(mod, degrees = c(45,45))
##D 
##D DRF(mod)
##D DRF(mod, draws = 500)
##D 
## End(Not run)



