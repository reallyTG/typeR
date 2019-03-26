library(unmarked)


### Name: unmarkedMultFrame
### Title: Create an unmarkedMultFrame, unmarkedFrameGMM, unmarkedFrameGDS,
###   or unmarkedFrameGPC object
### Aliases: unmarkedMultFrame yearlySiteCovs
###   yearlySiteCovs,unmarkedMultFrame-method yearlySiteCovs<-
###   yearlySiteCovs<-,unmarkedMultFrame-method unmarkedFrameGMM
###   unmarkedFrameGDS unmarkedFrameGPC

### ** Examples


n <- 50   # number of sites
T <- 4    # number of primary periods
J <- 3    # number of secondary periods

site <- 1:50
years <- data.frame(matrix(rep(2010:2013, each=n), n, T))
years <- data.frame(lapply(years, as.factor))
occasions <- data.frame(matrix(rep(1:(J*T), each=n), n, J*T))

y <- matrix(0:1, n, J*T)

umf <- unmarkedMultFrame(y=y,
    siteCovs = data.frame(site=site),
    obsCovs=list(occasion=occasions),
    yearlySiteCovs=list(year=years),
    numPrimary=T)

umfGMM1 <- unmarkedFrameGMM(y=y,
    siteCovs = data.frame(site=site),
    obsCovs=list(occasion=occasions),
    yearlySiteCovs=data.frame(year=c(t(years))),
    # or: yearlySiteCovs=list(year=years),
    numPrimary=T, type="removal")


# A user-defined piFun calculating removal probs when time intervals differ.
instRemPiFun <- function(p) {
	M <- nrow(p)
	J <- ncol(p)
	pi <- matrix(NA, M, J)
	p[,1] <- pi[,1] <- 1 - (1 - p[,1])^2
	p[,2] <- 1 - (1 - p[,2])^3
	p[,3] <- 1 - (1 - p[,3])^5
	for(i in 2:J) {
		pi[,i] <- pi[, i - 1]/p[, i - 1] * (1 - p[, i - 1]) * p[, i]
		}
	return(pi)
	}

# Associated obsToY matrix required by unmarkedFrameMPois
o2y <- diag(ncol(y))
o2y[upper.tri(o2y)] <- 1
o2y


umfGMM2 <- unmarkedFrameGMM(y=y,
    siteCovs = data.frame(site=site),
    obsCovs=list(occasion=occasions),
    yearlySiteCovs=data.frame(year=years),
    numPrimary=T, obsToY=o2y, piFun="instRemPiFun")

str(umfGMM2)






