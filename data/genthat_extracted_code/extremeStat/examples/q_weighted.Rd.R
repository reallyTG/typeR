library(extremeStat)


### Name: q_weighted
### Title: Compute weighted averages of quantile estimates
### Aliases: q_weighted
### Keywords: distribution

### ** Examples

x <- data.frame(A=1:5, RMSE=runif(5))
distLweights(x, onlydn=FALSE)

q_weighted(x,  onlydn=FALSE)
q_weighted(x,  distLweights(x, weightc=c("1"=3, "3"=5), order=FALSE, onlydn=FALSE)  )

x <- rexp(190)
d <- distLquantile(x)
d2 <- q_weighted(d)
stopifnot(all(d==d2, na.rm=TRUE))

# fast option for adding custom weighted estimates:
cw <- runif(17)
names(cw) <- c("exp", "gam", "gev", "glo", "gno", "gpa", "gum", "kap", "lap",
               "ln3", "nor", "pe3", "ray", "revgum", "rice", "wak", "wei")
dw <- distLweights(d, weightc=cw)
qw1 <- q_weighted(d, weightc=cw); qw1
qw2 <- q_weighted(d, weights=dw); qw2
stopifnot(all(qw1==qw2, na.rm=TRUE))
q_weighted(d, weights=dw, onlyc=TRUE)
q_weighted(d, weights=data.frame(weightc=cw), onlyc=TRUE)

## Not run: 
##D  # time consuming
##D system.time(pbreplicate(5000, q_weighted(d, weightc=cw)))             # 8.5 secs
##D system.time(pbreplicate(5000, q_weighted(d, weights=dw, onlyc=TRUE))) # 0.8 secs
## End(Not run)




