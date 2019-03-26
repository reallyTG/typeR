library(fromo)


### Name: running_centered
### Title: Compare data to moments computed over a sliding window.
### Aliases: running_centered running_scaled running_zscored running_sharpe
###   running_tstat

### ** Examples


if (require(moments)) {
    set.seed(123)
    x <- rnorm(5e1)
    window <- 10L
    rm1 <- t(sapply(seq_len(length(x)),function(iii) { 
                  xrang <- x[max(1,iii-window+1):iii]
                  c(sd(xrang),mean(xrang),length(xrang)) },
                  simplify=TRUE))
    rcent <- running_centered(x,window=window)
    rscal <- running_scaled(x,window=window)
    rzsco <- running_zscored(x,window=window)
    rshrp <- running_sharpe(x,window=window)
    rtsco <- running_tstat(x,window=window)
    rsrse <- running_sharpe(x,window=window,compute_se=TRUE)
    stopifnot(max(abs(rcent - (x - rm1[,2])),na.rm=TRUE) < 1e-12)
    stopifnot(max(abs(rscal - (x / rm1[,1])),na.rm=TRUE) < 1e-12)
    stopifnot(max(abs(rzsco - ((x - rm1[,2]) / rm1[,1])),na.rm=TRUE) < 1e-12)
    stopifnot(max(abs(rshrp - (rm1[,2] / rm1[,1])),na.rm=TRUE) < 1e-12)
    stopifnot(max(abs(rtsco - ((sqrt(rm1[,3]) * rm1[,2]) / rm1[,1])),na.rm=TRUE) < 1e-12)
    stopifnot(max(abs(rsrse[,1] - rshrp),na.rm=TRUE) < 1e-12)

    rm2 <- t(sapply(seq_len(length(x)),function(iii) { 
                  xrang <- x[max(1,iii-window+1):iii]
                  c(kurtosis(xrang)-3.0,skewness(xrang)) },
                  simplify=TRUE))
    mertens_se <- sqrt((1 + ((2 + rm2[,1])/4) * rshrp^2 - rm2[,2]*rshrp) / rm1[,3])
    stopifnot(max(abs(rsrse[,2] - mertens_se),na.rm=TRUE) < 1e-12)
}




