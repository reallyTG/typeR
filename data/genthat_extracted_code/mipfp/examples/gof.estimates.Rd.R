library(mipfp)


### Name: gof.estimates
### Title: Wald, Log-likelihood ratio and Person Chi-square statistics for
###   mipfp object
### Aliases: gof.estimates gof.estimates.default gof.estimates.mipfp
### Keywords: multivariate htest

### ** Examples

# loading the data
data(spnamur, package = "mipfp")
# subsetting the data frame, keeping only the first 3 variables
spnamur.sub <- subset(spnamur, select = Household.type:Prof.status)
# true table
true.table <- table(spnamur.sub)
# extracting the margins
tgt.v1        <- apply(true.table, 1, sum)
tgt.v1.v2     <- apply(true.table, c(1,2), sum)
tgt.v2.v3     <- apply(true.table, c(2,3), sum)
tgt.list.dims <- list(1, c(1,2), c(2,3))
tgt.data      <- list(tgt.v1, tgt.v1.v2, tgt.v2.v3)
# creating the seed, a 10 pct sample of spnamur
seed.df <- spnamur.sub[sample(nrow(spnamur), round(0.10*nrow(spnamur))), ]
seed.table <- table(seed.df)
# applying one fitting method (ipfp)
r.ipfp <- Estimate(seed=seed.table, target.list=tgt.list.dims, 
                   target.data = tgt.data)
# printing the G2, X2 and W2 statistics
print(gof.estimates(r.ipfp))
# alternative way (pretty printing, with p-values)
print(summary(r.ipfp)$stats.gof)



