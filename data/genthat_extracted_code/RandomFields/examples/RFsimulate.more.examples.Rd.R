library(RandomFields)


### Name: RFsimulate.more.examples
### Title: Further Examples for the Simulation of Random Fields
### Aliases: RFsimulate.more.examples

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Don't show: ## Not run: 
##D #############################################################
##D ## ##
##D ## Basic examples: Unconditional simulation ## 
##D ## ##
##D #############################################################
##D 
##D #############################################################
##D ## Example 1: Location formats / Plot method ##
##D #############################################################
##D 
##D RFgetModelNames(type="variogram") ## the complete list covariance models
##D ## and variogram models
##D ## our choice is RMstable
##D 
##D ## define the model:
##D model <- RMtrend(mean=0.5) + # mean
##D RMstable(alpha=1, var=4, scale=10) +
##D # see help("RMstable")
##D # for additional arguments
##D RMnugget(var=1) # nugget
##D 
##D ## define the locations:
##D from <- 0
##D to <- 20
##D step <- 1 ## nicer, but also time consuming if step <- 0.1
##D x.seq <- seq(from, to, step) 
##D y.seq <- seq(from, to, step)
##D 
##D ## simulate and get image of output:
##D simulated <- RFsimulate(model, x=x.seq, y=y.seq)
##D plot(simulated)
##D ## for comparison only:
##D image(x.seq, y.seq, RFspDataFrame2conventional(simulated)$data)
##D 
##D #############################################################
##D ## ... using seq(from, by, length.out) notation
##D len <- 21 ## more generally len <- (to-from)/step+1
##D x.short <- y.short <- c(from, step, len)
##D short.matrix <- cbind(x.short, y.short)
##D simulated <- RFsimulate(model = model, x=short.matrix)
##D plot(simulated) 
##D 
##D #############################################################
##D ## ... using GridTopology for the locations:
##D len <- 21 ## more generally len <- (to-from)/step+1
##D gridtop <- GridTopology(c(from,from), c(step,step), c(len,len))
##D simulated <- RFsimulate(model = model, x=gridtop)
##D plot(simulated) 
##D 
##D ############################################################
##D ## arbitrary points
##D x <- runif(100, max=20) 
##D y <- runif(100, max=20) # 100 points in 2 dimensional space
##D simulated <- RFsimulate(model = model, x=x, y=y)
##D plot(simulated)
##D 
##D #############################################################
##D ## using the 1-dimensional plot routine
##D ## simulate 1-dimensional random field first
##D x.seq <- seq(from, to, step) # grid
##D simulated <- RFsimulate(model = model, x=x.seq)
##D plot(simulated) 
##D 
##D 
##D #############################################################
##D ## Example 2: Simulation several realizations at once      ##
##D ## Access to simulated data                                ##
##D #############################################################
##D 
##D model <- RMstable(alpha=1.5)
##D step <- 1 ## nicer, but also time consuming if step <- 0.1
##D x.seq <- seq(0, 20, step) 
##D y.seq <- seq(0, 20, step) # grid
##D simulated <- RFsimulate(model, x=x.seq, y=y.seq,
##D n=4) # 4 realizations at once
##D plot(simulated) 
##D summary(simulated@data$variable1.n2)
##D # summary of simulated univariate data of 2nd realization
##D 
##D 
##D #############################################################
##D ## Example 3: simulating with trend                        ##
##D #############################################################
##D 
##D ##s function 
##D model <- RMexp(var=0.3) +
##D RMtrend(arbitraryfct = function(x,y) 2*sin(x)*cos(y))
##D x.seq <- y.seq <- seq(-5,5,0.1)
##D simulated <- RFsimulate(model, x=x.seq,y=y.seq)
##D plot(simulated)
##D 
##D #############################################################
##D ## with linear trend surface: 3x-y 
##D 
##D model1 <- RMexp() + RMtrend(plane=c(3,-1), fctcoeff=1)
##D # or equivalently:
##D model2 <- RMexp() + RMtrend(arbitraryfct=function(x,y) 3*x-y)
##D 
##D simulated <- RFsimulate(model1, x=x.seq, y=y.seq)
##D persp(x.seq,y.seq, RFspDataFrame2conventional(simulated)$data,
##D phi=30, theta=-3)
##D 
##D 
##D #############################################################
##D ## Example 4: Brownian motion (using Stein's method) ##
##D #############################################################
##D 
##D # Brownian motion (1 dimensional)
##D alpha <- 1 # in [0,2)
##D x.seq <- seq(0, 10, 0.001)
##D simulated <- RFsimulate(model = RMfbm(alpha=alpha),
##D x=x.seq) 
##D plot(simulated) 
##D 
##D  
##D #############################################################
##D ## Example 5: Models that depend on "submodels"; ##
##D ## Combining models / Operators on models ##
##D #############################################################
##D  
##D RFgetModelNames(operator=TRUE) ## list all models
##D ## that are an operator;
##D ## our choice is RMcoxisham
##D D <- as.matrix(1) # a 1x1-correlation matrix for RMcoxisham
##D submodel <- RMwhittle(nu=0.3)  # submodel on which the operator
##D ##                                model RMcoxisham will be applied
##D model <- RMcoxisham(submodel, mu=0, D=D, beta=2)
##D x.seq <- y.seq <- seq(-10,10,0.1)
##D simulated <- RFsimulate(model = model,
##D x=x.seq, y=y.seq) 
##D plot(simulated)
##D 
##D #############################################################
##D ## further nesting of models is possible: 
##D 
##D #model2 <- RMcoxisham(RMintexp(RMdewijsian(alpha=1)),
##D # mu=0, D=D, beta=2)
##D #simulated <- RFsimulate(model = model2,
##D # x=x.seq, y=y.seq) 
##D #plot(simulated)
##D 
##D #############################################################
##D ## addition of random fields using RMplus
##D 
##D model1 <- RMexp(var=5) + RMwhittle(nu=1, var=5)
##D ## Alternatively, the common variance argument var=5
##D ## can be included in the RMplus model:
##D model2 <- RMplus(C0 = RMexp(), C1 = RMwhittle(nu=1), var=5)
##D x.seq <- y.seq <- seq(-10,10,0.5)
##D 
##D simulated1 <- RFsimulate(model = model1, x=x.seq, y=y.seq) 
##D simulated2 <- RFsimulate(model = model2, x=x.seq, y=y.seq)
##D # compare (should give the same
##D plot(simulated1)
##D plot(simulated2)
##D sum(abs(simulated1@data - simulated2@data)) # should be numerically zero
##D  
##D 
##D #############################################################
##D ## Example 6: A bivariate random field ##
##D #############################################################
##D 
##D RFgetModelNames(vdim=2) ## list all bivariate models
##D ## our choice is RMbiWM
##D model <- RMbiwm(nudiag=c(1.3, 0.7), nured=2.5,
##D s=c(1, 1, 1), cdiag=c(0.7, 0.8), rhored=1)
##D x.seq <- y.seq <- seq(-10,10,0.5)
##D simulated <- RFsimulate(model = model, x=x.seq, y=y.seq) 
##D plot(simulated)
##D 
##D 
##D 
##D #############################################################
##D ## ##
##D ## Basic examples: Conditional simulation ## 
##D ## ##
##D #############################################################
##D 
##D #############################################################
##D ## Example 7: ways to pass given data ##
##D #############################################################
##D 
##D # simulate given locations and corresponding data
##D # (simulate measurements)
##D x <- runif(n=100, min=-1, max=1)
##D y <- runif(n=100, min=-1, max=1)
##D dta <- RFsimulate(model = RMexp(), x=x, y=y, grid=FALSE)
##D # locations for conditional simulation
##D x.seq.cond <- y.seq.cond <- seq(-1.5,1.5,length=100)
##D 
##D #############################################################
##D ## pass given data and locations as SP4-object
##D ## given.data is an SP4-object
##D 
##D cond.simulated <- RFsimulate(RMexp(), x=x.seq.cond, y=y.seq.cond, data=dta)
##D 
##D #############################################################
##D ## or equivalently: pass given data and locations as a matrix
##D 
##D cond.simulated.2 <- RFsimulate(RMexp(), x=x.seq.cond, y=y.seq.cond,
##D                                data = cbind(x, y, dta@data))
##D 
##D all.equal(cond.simulated, cond.simulated.2) ## TRUE
##D plot(cond.simulated, dta)
##D  
##D 
##D #############################################################
##D ## multiple realizations
##D 
##D # simulate corresponding data twice (2 measurements)
##D given.data.2realize <-
##D    RFsimulate(model = RMwhittle(nu=1.1), x=x.seq.cond, y=y.seq.cond,
##D                                 data=dta, n=2) 
##D plot(given.data.2realize, dta)
##D  
##D #############################################################
##D ## simulation not on a grid
##D 
##D x.cond <- runif(1000, -2, 2)
##D y.cond <- runif(1000, -2, 2)
##D cond.simulated <- RFsimulate(model=RMwhittle(nu=1.4),
##D x=x.cond, y=y.cond, grid=FALSE, data=dta)
##D plot(cond.simulated, dta)
##D 
##D 
##D #############################################################
##D ## Example 8: allow measurement errors ##
##D #############################################################
##D 
##D # err.model specifies the error model, typically RMnugget
##D cond.simulated <-
##D   RFsimulate(model=RMexp(), x=x.seq.cond, y=y.seq.cond,
##D              data=dta, err.model=RMnugget(var=1))
##D plot(cond.simulated, dta)
##D 
## End(Not run)## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


