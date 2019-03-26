library(GSE)


### Name: geochem
### Title: Geochemical Data
### Aliases: geochem
### Keywords: datasets

### ** Examples

## Not run: 
##D library(ICSNP)
##D library(rrcov)
##D 
##D data(geochem)
##D n <- nrow(geochem)
##D p <- ncol(geochem)
##D 
##D # MLE
##D res.ML <- list(mu=colMeans(geochem), S=cov(geochem))
##D 
##D # Tyler's M
##D geochem.med <- apply(geochem,2,median,na.rm=TRUE)
##D res.Tyler <- tyler.shape(geochem, location=geochem.med)
##D res.Tyler <- res.Tyler*(median(mahalanobis( geochem, geochem.med, res.Tyler))/qchisq(0.5, df=p) )
##D res.Tyler <- list(mu=geochem.med, S=res.Tyler)
##D 
##D # Rocke's Covariace 
##D res.Rock <- CovSest(geochem, method="rocke")
##D res.Rock <- list(mu=res.Rock@center, S=res.Rock@cov)
##D 
##D # Fast-MCD
##D res.FMCD <- CovMcd( geochem)
##D res.FMCD <- list(mu=res.FMCD@center, S=res.FMCD@cov)
##D 
##D # MVE
##D res.MVE <- CovMve( geochem)
##D res.MVE <- list(mu=res.MVE@center, S=res.MVE@cov)
##D 
##D # S-estimator with bisquare rho function
##D res.S <- CovSest(geochem, method="bisquare")
##D res.S <- list(mu=res.S@center, S=res.S@cov)
##D 
##D # Fast-S
##D res.FS <- CovSest(geochem)
##D res.FS <- list(mu=res.FS@center, S=res.FS@cov)
##D 
##D # 2SGS
##D res.2SGS <- TSGS( geochem, seed=999 )
##D res.2SGS <- list(mu=res.2SGS@mu, S=res.2SGS@S)
##D 
##D # Combine all the results
##D geochem.res <- list(ML=res.ML, Tyler=res.Tyler, Rocke=res.Rock, MCD=res.FMCD, 
##D 	MVE=res.MVE, FS=res.FS, MVES=res.S, TSGS=res.2SGS)
##D 
##D ## Compare LRT distances between different estimators
##D res.tab <- data.frame( 	LRT.to.2SGS=c(slrt( res.ML$S, res.2SGS$S),
##D 			slrt( res.Tyler$S, res.2SGS$S), 
##D 			slrt( res.Rock$S, res.2SGS$S),
##D 			slrt( res.FMCD$S, res.2SGS$S),
##D 			slrt( res.MVE$S, res.2SGS$S),
##D 			slrt( res.FS$S, res.2SGS$S),
##D 			slrt( res.S$S, res.2SGS$S),
##D 			slrt( res.2SGS$S, res.2SGS$S) ))
##D row.names(res.tab) <- c("ML","Tyler","Rocke","MCD","MVE","FS","MVES","TSGS")
##D 
##D # Calculate proportion of outliers cellwise
##D pairwise.mahalanobis <- function(x, mu, S){
##D 	# function that computes pairwise mahalanobis distances
##D 	p <- ncol(x)
##D 	pairs.md <- c()
##D 	for(i in 1:(p-1)) for(j in (i+1):p)
##D 		pairs.md <- c(pairs.md, mahalanobis( x[,c(i,j)], mu[c(i,j)], S[c(i,j),c(i,j)]))
##D 	pairs.md
##D }
##D res.tab$Full <- res.tab$Pairs <- res.tab$Cell <- NA
##D for(i in names(geochem.res) ){
##D 	## Identify cellwise outliers
##D 	uni.dist <- sweep(sweep(geochem, 2, geochem.res[[i]]$mu, "-"), 2, 
##D 		sqrt(diag(geochem.res[[i]]$S)), "/")^2
##D 	uni.dist.stat <- mean(uni.dist > qchisq(.99^(1/(n*p)), 1))
##D 	res.tab$Cell[ which( row.names(res.tab) == i)] <- round(uni.dist.stat,3)
##D 
##D 	## Identify pairwise outliers
##D 	pair.dist <- pairwise.mahalanobis( geochem, geochem.res[[i]]$mu, geochem.res[[i]]$S)
##D 	pair.dist.stat <- mean(pair.dist > qchisq(0.99^(1/(n*choose(p,2))), 2))
##D 	res.tab$Pairs[ which( row.names(res.tab) == i)] <- round(pair.dist.stat,3)
##D 
##D 	## Identify any large global MD
##D 	full.dist <- mahalanobis( geochem, geochem.res[[i]]$mu, geochem.res[[i]]$S)
##D 	full.dist.stat <- mean(full.dist > qchisq(0.99^(1/n), p))
##D 	res.tab$Full[ which( row.names(res.tab) == i)] <- round(full.dist.stat,3)
##D }
##D res.tab
## End(Not run)



