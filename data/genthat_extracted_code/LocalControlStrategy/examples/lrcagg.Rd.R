library(LocalControlStrategy)


### Name: lrcagg
### Title: Calculate the observed Distribution of LRCs in Local Control
###   Strategy
### Aliases: lrcagg
### Keywords: nonparametric

### ** Examples

    data(radon)
    xvars <- c("obesity", "over65", "cursmoke")
    hclobj <- LCcluster(radon, xvars)
    e <- LCsetup(hclobj, radon, lnradon, lcanmort)
    lrc050 <- lrcagg(50, e)
    lrc050
    plot(lrc050, e)



