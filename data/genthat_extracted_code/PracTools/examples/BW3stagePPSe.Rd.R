library(PracTools)


### Name: BW3stagePPSe
### Title: Estimated relvariance components for 3-stage sample
### Aliases: BW3stagePPSe
### Keywords: methods survey

### ** Examples

## Not run: 
##D     # select 3-stage sample from Maryland population
##D data(MDarea.pop)
##D MDpop <- MDarea.pop
##D require(sampling)
##D require(reshape)      # has function that allows renaming variables
##D     # make counts of SSUs and elements per PSU
##D xx <- do.call("rbind",list(by(1:nrow(MDpop),MDpop$SSU,head,1)))
##D pop.tmp <- MDpop[xx,]
##D Ni <- table(pop.tmp$PSU)
##D Qi <- table(MDarea.pop$PSU)
##D Qij <- table(MDpop$SSU)
##D m <- 30         # no. of PSUs to select
##D probi <- m*Qi / sum(Qi)
##D     # select sample of clusters
##D sam <- cluster(data=MDpop, clustername="PSU", size=m, method="systematic",
##D                pik=probi, description=TRUE)
##D     # extract data for the sample clusters
##D samclus <- getdata(MDpop, sam)
##D samclus <- rename(samclus, c(Prob = "p1i"))
##D samclus <- samclus[order(samclus$PSU),]
##D     # treat sample clusters as strata and select srswor of block groups from each
##D     # identify psu IDs for 1st instance of each ssuID
##D xx <- do.call("rbind",list(by(1:nrow(samclus),samclus$SSU,head,1)))
##D SSUs <- cbind(PSU=samclus$PSU[xx], SSU=samclus$SSU[xx])
##D     # select 2 SSUs per tract
##D n <- 2
##D s <- strata(data = as.data.frame(SSUs), stratanames = "PSU",
##D             size = rep(n,m), method="srswor")
##D s <- rename(s, c(Prob = "p2i"))
##D     # extract the SSU data
##D     # s contains selection probs of SSUs, need to get those onto data file
##D SSUsam <- SSUs[s$ID_unit, ]
##D SSUsam <- cbind(SSUsam, s[, 2:3])
##D     # identify rows in PSU sample that correspond to sample SSUs
##D tmp <- samclus$SSU %in% SSUsam$SSU
##D SSUdat <- samclus[tmp,]
##D SSUdat <- merge(SSUdat, SSUsam[, c("p2i","SSU")], by="SSU")
##D     # select srswor from each sample SSU
##D n.SSU <- m*n
##D s <- strata(data = as.data.frame(SSUdat), stratanames = "SSU",
##D             size = rep(50,n.SSU), method="srswor")
##D s <- rename(s, c(Prob = "p3i"))
##D samclus <- getdata(SSUdat, s)
##D del <- (1:ncol(samclus))[dimnames(samclus)[[2]] %in% c("ID_unit","Stratum")]
##D samclus <- samclus[, -del]
##D     # extract pop counts for PSUs in sample
##D pick <- names(Qi) %in% sort(unique(samclus$PSU))
##D Qi.sam <- Qi[pick]
##D     # extract pop counts of SSUs for PSUs in sample
##D pick <- names(Ni) %in% sort(unique(samclus$PSU))
##D Ni.sam <- Ni[pick]
##D     # extract pop counts for SSUs in sample
##D pick <- names(Qij) %in% sort(unique(samclus$SSU))
##D Qij.sam <- Qij[pick]
##D     # compute full sample weight and wts for PSUs and SSUs
##D wt <- 1 / samclus$p1i / samclus$p2i / samclus$p3i
##D w1i <- 1 / samclus$p1i
##D w2ij <- 1 / samclus$p1i / samclus$p2i
##D samdat <- data.frame(psuID = samclus$PSU, ssuID = samclus$SSU,
##D                      w1i = w1i, w2ij = w2ij, w = wt,
##D                      samclus[, c("y1","y2","y3","ins.cov", "hosp.stay")])
##D BW3stagePPSe(dat=samdat, v="y1", Ni=Ni.sam, Qi=Qi.sam, Qij=Qij.sam, m)
## End(Not run)



