library(plmm)


### Name: plot
### Title: Nonparametric Function Plot
### Aliases: plot.plmm plot.wplmm

### ** Examples

data(plmm.data)
model <- plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)
plot(model, data=plmm.data, ann="F")
title(ylab=expression(paste("y-X",hat(beta))))

## Not run: 
##D model <- plmm(y2~x1+x2+x3|t1+t2, random=cluster, data=plmm.data)
##D plot(model, data=plmm.data, display="rgl") 
## End(Not run)



