library(agridat)


### Name: usgs.herbicides
### Title: Concentrations of herbicides in streams in the United States
### Aliases: usgs.herbicides
### Keywords: datasets

### ** Examples

data(usgs.herbicides)
dat <- usgs.herbicides

## Not run: 
##D 
##D   require("NADA")
##D   # create censored data for one trait
##D   dat$y <- as.numeric(dat$atrazine)
##D   dat$ycen <- is.na(dat$y)
##D   dat$y[is.na(dat$y)] <- .05
##D   
##D   # percent censored
##D   with(dat, censummary(y, censored=ycen))
##D   # median/mean
##D   with(dat, cenmle(y, ycen, dist="lognormal"))
##D   # boxplot
##D   with(dat, cenboxplot(obs=y, cen=ycen, log=FALSE))
##D   # with(dat, boxplot(y))
##D   pp <- with(dat, ros(obs=y, censored=ycen, forwardT="log")) # default lognormal
##D   plot(pp)
## End(Not run)

if(require("NADA")){
  plotfun <- function(vv){
    dat$y <- as.numeric(dat[[vv]])
    dat$ycen <- is.na(dat$y)
    dat$y[is.na(dat$y)] <- .01
    # qqnorm(log(dat$y), main=vv) # ordinary qq plot shows censored values
    pp <- with(dat, ros(obs=y, censored=ycen, forwardT="log"))
    plot(pp, main=vv) # omits censored values
  }
  op <- par(mfrow=c(3,3))
  vnames <- c("acetochlor", "alachlor", "ametryn", "atrazine","CIAT", "CEAT", "cyanazine", #"CAM",
              "dimethenamid", "flufenacet")
  for(vv in vnames) plotfun(vv)
  par(op)
}




