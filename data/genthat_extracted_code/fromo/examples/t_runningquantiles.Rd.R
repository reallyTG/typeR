library(fromo)


### Name: t_running_apx_quantiles
### Title: Compute approximate quantiles over a sliding time window
### Aliases: t_running_apx_quantiles t_running_apx_median

### ** Examples

x <- rnorm(1e5)
xq <- t_running_apx_quantiles(x,c(0.1,0.25,0.5,0.75,0.9),
       time=seq_along(x),window=200,lb_time=c(100,200,400))

xq <- t_running_apx_median(x,time=seq_along(x),window=200,lb_time=c(100,200,400))
xq <- t_running_apx_median(x,time=cumsum(runif(length(x),min=0.5,max=1.5)),
      window=200,lb_time=c(100,200,400))

# weighted median?
wts <- runif(length(x),min=1,max=5)
xq <- t_running_apx_median(x,wts=wts,wts_as_delta=TRUE,window=1000,lb_time=seq(1000,10000,by=1000))

# these should give the same answer:
xr <- running_apx_median(x,window=200);
xt <- t_running_apx_median(x,time=seq_along(x),window=199.99)




