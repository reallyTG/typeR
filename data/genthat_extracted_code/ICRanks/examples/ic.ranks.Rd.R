library(ICRanks)


### Name: ic.ranks
### Title: Confidence intervals for ranks
### Aliases: ic.ranks

### ** Examples

n = 10; TrueCenters = 1:n
alpha = 0.05; sigma = runif(n,min=0.5,max=1.5)
y = as.numeric(sapply(1:n, function(ll) rnorm(1,TrueCenters[ll],sd=sigma[ll])))
ind = sort.int(y, index.return = TRUE)$ix
y = y[ind]
sigma = sigma[ind] # The sigmas need to follow the order of the y's
res = ic.ranks(y, sigma, Method = "ExactLR",alpha = 0.05, control = list(trace = TRUE))
LowerExact = res$Lower; UpperExact = res$Upper
res = ic.ranks(y, sigma, Method = "BoundLR", BoundChoice = "Lower",
   control = list(adjustL = FALSE, adjustU = FALSE))
LowerL = res$Lower; UpperL = res$Upper
res = ic.ranks(y, sigma, Method = "BoundLR", BoundChoice = "Upper",
   control = list(adjustL = FALSE, adjustU = FALSE, trace=FALSE))
LowerU = res$Lower; UpperU = res$Upper
res = ic.ranks(y, sigma, Method = "Tukey")
LowerTuk = res$Lower; UpperTuk = res$Upper
res = ic.ranks(y, sigma, Method = "SeqTukey")
LowerTukSeq = res$Lower; UpperTukSeq = res$Upper
res = ic.ranks(y, sigma, Method = "TukeyNoTies")
LowerTukNoTies = res$Lower; UpperTukNoTies = res$Upper
LowerExact 
LowerL
LowerU
LowerTuk 



