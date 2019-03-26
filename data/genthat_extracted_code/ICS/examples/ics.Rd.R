library(ICS)


### Name: ics
### Title: Two Scatter Matrices ICS Transformation
### Aliases: ics
### Keywords: models multivariate

### ** Examples

    # example using two functions
    set.seed(123456)
    X1 <- rmvnorm(250, rep(0,8), diag(c(rep(1,6),0.04,0.04)))
    X2 <- rmvnorm(50, c(rep(0,6),2,0), diag(c(rep(1,6),0.04,0.04)))
    X3 <- rmvnorm(200, c(rep(0,7),2), diag(c(rep(1,6),0.04,0.04)))

    X.comps <- rbind(X1,X2,X3)
    A <- matrix(rnorm(64),nrow=8)
    X <- X.comps %*% t(A)

    ics.X.1 <- ics(X)
    summary(ics.X.1)
    plot(ics.X.1)

    # compare to
    pairs(X)
    pairs(princomp(X,cor=TRUE)$scores)

    # slow:
    
    # library(ICSNP)
    # ics.X.2 <- ics(X, tyler.shape, duembgen.shape, S1args=list(location=0))
    # summary(ics.X.2)
    # plot(ics.X.2)
    
    rm(.Random.seed)
    
    # example using two computed scatter matrices for outlier detection
    
    library(robustbase)
    ics.wood<-ics(wood,tM(wood)$V,tM(wood,2)$V)
    plot(ics.wood)
    
    # example using three pictures
    library(pixmap)
    
    fig1 <- read.pnm(system.file("pictures/cat.pgm", package = "ICS")[1])
    fig2 <- read.pnm(system.file("pictures/road.pgm", package = "ICS")[1])
    fig3 <- read.pnm(system.file("pictures/sheep.pgm", package = "ICS")[1])
    
    p <- dim(fig1@grey)[2]

    fig1.v <- as.vector(fig1@grey)
    fig2.v <- as.vector(fig2@grey)
    fig3.v <- as.vector(fig3@grey)
    X <- cbind(fig1.v,fig2.v,fig3.v)
    
    set.seed(4321)
    A <- matrix(rnorm(9), ncol = 3)
    X.mixed <- X %*% t(A)

    ICA.fig <- ics(X.mixed)
    
    par.old <- par()
    par(mfrow=c(3,3), omi = c(0.1,0.1,0.1,0.1), mai = c(0.1,0.1,0.1,0.1))

    plot(fig1)
    plot(fig2)
    plot(fig3)

    plot(pixmapGrey(X.mixed[,1],ncol=p))
    plot(pixmapGrey(X.mixed[,2],ncol=p))
    plot(pixmapGrey(X.mixed[,3],ncol=p))

    plot(pixmapGrey(ics.components(ICA.fig)[,1],ncol=p))
    plot(pixmapGrey(ics.components(ICA.fig)[,2],ncol=p))
    plot(pixmapGrey(ics.components(ICA.fig)[,3],ncol=p))

    par(par.old)
    rm(.Random.seed)
    


