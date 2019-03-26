context("predict.mex")

test_that("predict.mex behaves as it should", {
  skip_on_cran()
  skip_on_travis()
    # reproduce Table 5 in Heffernan and Tawn 2004
  smarmod <- mex(summer, mqu=c(.9, .7, .7, .85, .7), which="NO", penalty="none", dqu=.7,margins="gumbel",constrain=FALSE)
  wmarmod <- mex(winter, mqu=.7,  dqu=0.7, penalty="none", which="NO",margins="gumbel",constrain=FALSE)
  set.seed(20111010)
  NOmodWinter <- bootmex(wmarmod,trace=101)
  NOpredWinter <- predict(NOmodWinter, nsim = 500,trace=101) # matches sample size in H+T2004
  
  NOmodSummer <- bootmex(smarmod,trace=101)
  NOpredSummer <- predict(NOmodSummer, nsim = 500,trace=101)
  
  Table5winter <- rbind(c(8.3, 75.4, 569.9, 44.6, 132.3),
                        c(1.2, 4.4, 45.2, 6.7, 8.2))
  Table5summer <- rbind(c(39.6,62.2,213.5,48.5,83.7),
                        c(4.3,4.3,17.5,11.8, 7.9))
  
  dimnames(Table5winter) <- dimnames(Table5summer) <- list(c("E(x)", "SE"),
                                                           c("O3", "NO2", "NO", "SO2", "PM10"))
  
  Table5summer <- Table5summer[, c("NO", "O3", "NO2", "SO2", "PM10")]
  Table5winter <- Table5winter[, c("NO", "O3", "NO2", "SO2", "PM10")]
  
  resSummer <- summary(NOpredSummer)$ans[1:2,]
  resWinter <- summary(NOpredWinter)$ans[1:2,]
  
  pointEstSummer <- apply(NOpredSummer$data$sim,2,mean)
  pointEstWinter <- apply(NOpredWinter$data$sim,2,mean)
  
  tol <- 0.05
  
  # Get rid of dimnames to stop it causing equals() to fail
  dimnames(Table5summer) <- dimnames(Table5winter) <- dimnames(resSummer) <- dimnames(resWinter) <-
    names(pointEstSummer) <- names(pointEstWinter) <- NULL
  
  expect_that(Table5summer, equals(resSummer, tolerance=tol), label="predict.mex:Table5summerdata")
  expect_that(Table5winter, equals(resWinter, tolerance=tol), label="predict.mex:Table5winterdata")
  
  expect_that(pointEstSummer, equals(resSummer[1, ], tolerance=tol), label="predict.mex:pointestvsboot,summerdata")
  expect_that(pointEstWinter, equals(resWinter[1, ], tolerance=tol), label="predict.mex:pointestvsboot,winterdata")
  
  # check execution for 2-d data
  
  R <- 20
  nsim <- 100
  wavesurge.mex <- mex(wavesurge,mqu=.7,dqu=0.7,margins="laplace",which=1)
  wavesurge.boot <- bootmex(wavesurge.mex,R=R,trace=R+1)
  wavesurge.pred <- predict(wavesurge.boot,nsim=nsim,trace=R+1)
  
  expect_that(length(wavesurge.pred$replicates), equals(R), label="predict.mexexecutionfor2-ddata")
  expect_that(dim(wavesurge.pred$replicates[[3]]), equals(c(nsim, 2)))
  expect_that(names(wavesurge.pred$replicates[[4]]), equals(names(wavesurge)), label="predict.mexexecutionfor2-ddata")
  
  # check predictions Laplace estimation equal to Gumbel for large samples and high threshold
  
  tol <- 0.01
  seeds <- 20:24
  set.seed(20111004)
  n <- 100000
  mqu <- c(0,0.9)
  dqu <- 0.99
  for(i in 1:5){
    x <- rgpd(n=n,sigma=1,xi=0.1)
    y <- 5 + rexp(1,5)*x + rnorm(n,0,x/max(x))
    data <- data.frame(x=x,y=y)
    
    data.gpd <- migpd(data , mqu=mqu, penalty="none")
    lap.mex <- mexDependence(data.gpd, which=1, dqu=dqu, start=c(-0.1,0.1), PlotLikDo=FALSE,v=20)
    gum.mex <- mex(data,mqu=c(0,0.9), which=1, dqu=dqu, margins="gumbel", constrain=FALSE)
    
    set.seed(seeds[i])
    lap.pred <- predict(lap.mex, nsim=10000, trace=R+1)
    set.seed(seeds[i])
    gum.pred <- predict(gum.mex, nsim=10000, trace=R+1)
    
    lap.ans <- summary(lap.pred)$ans
    gum.ans <- summary(gum.pred)$ans
    
  expect_that(lap.ans, equals(gum.ans, tolerance=tol), label=paste("predict.mexLaplacepredictionsequaltoGumbel,testreplicate",i))
  }
}
)
