context("JointExceedanceCurve")

test_that("JointExceedanceCurve behaves as it should", {
    skip_on_cran()
    skip_on_travis()

    set.seed(20160832)
    # bivariate normal curve at different levels of probability: check value of curve at points; 
    # different margins
    # higher dimensional input
    
    # 2-d bvn no model fitting; check against theoretical values
    rho <- 0.5
    Mean <- c(3,12)
    Sigma <- matrix(c(1,rho,rho,1),ncol=2)
    n <- 10000
    require(mvtnorm)
    Sample <- rmvnorm(n,sigma=Sigma,mean=Mean)
    colnames(Sample) <- c("x","y")
    
    # check theoretical probabilities at calculated points on curve match input probabilities
    p <- seq(0.5,0.95,by=0.05)
    c1 <- lapply(p, function(p)JointExceedanceCurve(Sample,p))
    c2 <- lapply(c1,function(o){
        X <- cbind(o[[1]],o[[2]])
        sapply(1:length(o[[1]]), function(i)pmvnorm(lower=as.numeric(X[i,]), 
                                                 upper=rep(Inf, 2), mean=Mean, corr=Sigma))
    })
    res <- sapply(c2,mean)
    expect_equal(res, expected = p, tolerance=0.01, 
                 label="JointExceedanceCurve: theoretical probabilities at calculated points on curve match input probabilities")
    
    # check points on diagonal match theoretical quantile
    tq <- sapply(p,function(p)qmvnorm(p, sigma = Sigma,mean=Mean, tail="upper")$quantile)
    sq <- sapply(c1,function(o){
        D <- (o[[1]]-o[[2]])^2
        Min <- which.min(D)
        o[[1]][Min]
    })
    expect_equal(sq, expected = tq, tolerance=0.01, 
                 label="JointExceedanceCurve: calculated points on diagonal match theoretical quantile")

    # check that curve calculated properly at user specified points
    p <- seq(0.05,0.01,by=-0.01)
    x <- quantile(Sample[,1],seq(0.7,0.95,by=0.05))
    names(x) <- NULL
    y <- lapply(p, function(p)JointExceedanceCurve(Sample,p,x=x)[[2]])
    z <- sapply(1:length(p), function(i)JointExceedanceCurve(Sample[,2:1],p[i],x=y[[i]])[[2]])
    for(i in 1:length(p)){
        expect_equal(z[,i],x,tol=0.01,label="JointExceedanceCurve: user specified points of x for curve calculation")
    }
    
    # check for estimation from fitted models from texmex
    m <- mex(winter,mqu=0.7,dqu=0.7,which="NO")
    m2 <- predict(m,nsim=n,pqu=0.9)
    m3 <- predict(m,nsim=n,pqu=0.92)
    
    j2a <- JointExceedanceCurve(m2,0.0005, which=c(1,3)) # columns of predict matrix, which have been re-ordered from original
    j2b <- JointExceedanceCurve(m2,0.0005, which=c("O3","NO"))
    j2c <- JointExceedanceCurve(m2,0.0005, which=c(3,4)) # columns of predict matrix, which have been re-ordered from original
    j2d <- JointExceedanceCurve(m2,0.0005, which=c("NO","SO2"))
    expect_equal(j2a,j2b,label="JointExceedanceCurve: specifying which pair to return by column number or name")
    expect_equal(j2c,j2d,label="JointExceedanceCurve: specifying which pair to return by column number or name")

    O3vals <- c(15,18,21,24)
    j2e <- JointExceedanceCurve(m2,0.0005, which=c("O3","NO"),x=O3vals)
    j2f <- JointExceedanceCurve(m2,0.0005, which=c("NO","O3"),x=j2e$NO)
    expect_equal(j2f$O3,O3vals,tol=0.01,label="JointExceedanceCurve: user specified values of points at which to calc curve")
    
    NO2vals <- 55:65 # these need to be chosen with care so that the two curves are actually estimable from the two different importance samples!
    p <- 0.02
    j2g <- JointExceedanceCurve(m2,p, which=c("NO2","NO"),x=NO2vals)
    j2h <- JointExceedanceCurve(m3,p, which=c("NO2","NO"),x=NO2vals)
    expect_equal(attributes(j2g)$ExceedanceProb,p,label="JointExceedanceCurve: attribute ExceedanceProb")
    expect_equal(attributes(j2h)$ExceedanceProb,p,label="JointExceedanceCurve: attribute ExceedanceProb")
    expect_equal(j2g,j2h,tol=0.05,label="JointExceedanceCurve: curves estimated from different importance samples get same answers")
    
    # mexMCMC
    m <- mexAll(winter,mqu=0.7,dqu=rep(0.7,5))
    m4 <- mexMonteCarlo(nSample=5000,mexList=m)
    NOvals <- seq(370,450,by=10)
    p <- 0.01
    j3a <- JointExceedanceCurve(m2,p, which=c("NO","NO2"),x=NOvals)
    j3b <- JointExceedanceCurve(m4,p, which=c("NO","NO2"),x=NOvals)
    expect_equal(attributes(j3a)$ExceedanceProb,p,label="JointExceedanceCurve: for mexMCMC object attribute ExceedanceProb")
    expect_equal(attributes(j3a)$ExceedanceProb,p,label="JointExceedanceCurve: for mexMCMC object attribute ExceedanceProb")
    expect_equal(j3a,j3b,tol=0.05,
                 label="JointExceedanceCurve: curves estimated from mexMCMC object and predict.mex object give same answers (up to fitted model accuracy and sampling variation")

}   
)
