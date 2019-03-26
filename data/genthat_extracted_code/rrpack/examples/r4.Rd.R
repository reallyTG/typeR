library(rrpack)


### Name: r4
### Title: Robust reduced-rank regression
### Aliases: r4

### ** Examples

## Not run: 
##D library(rrpack)
##D n <- 100; p <- 500; q <- 50
##D xrank <- 10; nrank <- 3; rmax <- min(n, p, q, xrank)
##D nlam <- 100; gamma <- 2
##D rho_E <- 0.3
##D rho_X <- 0.5
##D nlev <- 0
##D vlev <- 0
##D vout <- NULL
##D vlevsd <- NULL
##D nout <- 0.1 * n
##D s2n <- 1
##D voutsd <- 2
##D simdata <- rrr.sim5(n, p, q, nrank, rx = xrank, s2n = s2n,
##D                     rho_X = rho_X, rho_E = rho_E, nout = nout, vout = vout,
##D                     voutsd = voutsd,nlev = nlev,vlev=vlev,vlevsd=vlevsd)
##D Y <- simdata$Y
##D X <- simdata$X
##D fit <- r4(Y, X, maxrank = rmax,
##D                method = "rowl0", ic.type= "PIC")
##D summary(fit)
##D coef(fit)
##D which(apply(fit$s,1,function(a)sum(a^2))!=0)
## End(Not run)



