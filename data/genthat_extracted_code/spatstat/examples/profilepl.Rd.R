library(spatstat)


### Name: profilepl
### Title: Fit Models by Profile Maximum Pseudolikelihood or AIC
### Aliases: profilepl
### Keywords: spatial models

### ** Examples

    # one irregular parameter
    rr <- data.frame(r=seq(0.05,0.15, by=0.01))
    ## Don't show: 
      rr <- data.frame(r=c(0.05,0.1,0.15))
    
## End(Don't show)
    ps <- profilepl(rr, Strauss, cells)
    ps
    if(interactive()) plot(ps)

    # two irregular parameters
    rs <- expand.grid(r=seq(0.05,0.15, by=0.01),sat=1:3)
    ## Don't show: 
      rs <- expand.grid(r=c(0.07,0.12),sat=1:2)
    
## End(Don't show)
    pg <- profilepl(rs, Geyer, cells)
    pg
    if(interactive()) {
      plot(pg)
      as.ppm(pg)
    }

    # multitype pattern with a common interaction radius
    ## Not run: 
##D      RR <- data.frame(R=seq(0.03,0.05,by=0.01))
##D      MS <- function(R) { MultiStrauss(radii=diag(c(R,R))) }
##D      pm <- profilepl(RR, MS, amacrine ~marks)
##D     
## End(Not run)
    ## more information 
    summary(pg)



