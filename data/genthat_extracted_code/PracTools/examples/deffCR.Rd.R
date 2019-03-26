library(PracTools)


### Name: deffCR
### Title: Chen-Rust design effect
### Aliases: deffCR
### Keywords: methods survey

### ** Examples

require(sampling)
require(reshape)
data(MDarea.pop)
Ni <- table(MDarea.pop$TRACT)
m <- 10
probi <- m*Ni / sum(Ni)
    # select sample of clusters
set.seed(-780087528)
sam <- sampling::cluster(data=MDarea.pop, clustername="TRACT", size=m, method="systematic",
                pik=probi, description=TRUE)
    # extract data for the sample clusters
samclus <- getdata(MDarea.pop, sam)
samclus <- rename(samclus, c(Prob = "pi1"))
    # treat sample clusters as strata and select srswor from each
nbar <- 4
s <- sampling::strata(data = as.data.frame(samclus), stratanames = "TRACT",
            size = rep(nbar,m), method="srswor")
    # extracts the observed data
samdat <- getdata(samclus,s)
samdat <- rename(samdat, c(Prob = "pi2"))
    # add a fake stratum ID
H <- 2
nh <- m * nbar / H
stratum <- NULL
for (h in 1:H){
    stratum <- c(stratum, rep(h,nh))
}
wt <- 1/(samdat$pi1*samdat$pi2) * runif(m*nbar)
samdat <- cbind(subset(samdat, select = -c(Stratum)), stratum, wt)
deffCR(w = samdat$wt, strvar = samdat$stratum, clvar = samdat$TRACT, Wh=NULL, y=samdat$y2)



