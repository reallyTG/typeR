library(fromo)


### Name: running_sd3
### Title: Compute first K moments over a sliding window
### Aliases: running_sd3 running_skew4 running_kurt5 running_sd
###   running_skew running_kurt running_cent_moments running_std_moments
###   running_cumulants

### ** Examples

x <- rnorm(1e5)
xs3 <- running_sd3(x,10)
xs4 <- running_skew4(x,10)

if (require(moments)) {
    set.seed(123)
    x <- rnorm(5e1)
    window <- 10L
    kt5 <- running_kurt5(x,window=window)
    rm1 <- t(sapply(seq_len(length(x)),function(iii) { 
                xrang <- x[max(1,iii-window+1):iii]
                c(moments::kurtosis(xrang)-3.0,moments::skewness(xrang),
                sd(xrang),mean(xrang),length(xrang)) },
             simplify=TRUE))
    stopifnot(max(abs(kt5 - rm1),na.rm=TRUE) < 1e-12)
}

xc6 <- running_cent_moments(x,window=100L,max_order=6L)




