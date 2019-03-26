library(mipfp)


### Name: CompareMaxDev
### Title: Comparing deviations of mipfp objects
### Aliases: CompareMaxDev
### Keywords: univar

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
# creating the seed, a 10% sample of spnamur
seed.df <- spnamur.sub[sample(nrow(spnamur), round(0.10*nrow(spnamur))), ]
seed.table <- table(seed.df)
# applying the different fitting methods
r.ipfp <- Estimate(seed=seed.table, target.list=tgt.list.dims, 
                   target.data = tgt.data,  method = "ipfp")
r.ml   <- Estimate(seed = seed.table, target.list = tgt.list.dims, 
                   target.data = tgt.data, method = "ml")
r.chi2 <- Estimate(seed = seed.table, target.list = tgt.list.dims, 
                   target.data = tgt.data, method = "chi2")
r.lsq  <- Estimate(seed = seed.table, target.list = tgt.list.dims, 
                   target.data = tgt.data, method = "lsq")
# print the maximum absolute deviation between targets and generated margins
CompareMaxDev(list(r.ipfp,r.ml,r.chi2,r.lsq), echo = TRUE)
# compute the maximum absolute deviation between the true and estimated tables
CompareMaxDev(list(r.ipfp,r.ml,r.chi2,r.lsq), echo = TRUE, 
              true.table = true.table)



