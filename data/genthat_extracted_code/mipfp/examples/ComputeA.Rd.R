library(mipfp)


### Name: ComputeA
### Title: Computes the marginal matrix A and margins vector m of an
###   estimation problem
### Aliases: ComputeA
### Keywords: array algebra

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
# computing the associated marginal matrix and margins vector
res.marg <- ComputeA(dim(seed.table), tgt.list.dims, tgt.data)
print(res.marg)



