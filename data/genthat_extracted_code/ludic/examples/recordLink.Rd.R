library(ludic)


### Name: recordLink
### Title: Probabilistic Patient Record Linkage
### Aliases: recordLink

### ** Examples

set.seed(123)
ncodes <- 500
npat <- 200
incid <- abs(rnorm(n=ncodes, 0.15, 0.07))
bin_codes <- rbinom(n=npat*ncodes, size=1,  prob=rep(incid, npat))
bin_codes_mat <- matrix(bin_codes, ncol=ncodes, byrow = TRUE)
data1_ex <- bin_codes_mat[1:(npat/2+npat/10),]
data2_ex <- bin_codes_mat[c(1:(npat/10), (npat/2+npat/10 + 1):npat), ]
rownames(data1_ex) <- paste0("ID", 1:(npat/2+npat/10), "_data1")
rownames(data2_ex) <- paste0("ID", c(1:(npat/10), (npat/2+npat/10 + 1):npat), "_data2")

## Not run: 
##D res <- recordLink(data1 = data1_ex, data2 = data2_ex, 
##D                  use_diff = FALSE, eps_minus = 0.01, eps_plus = 0.01)
##D round(res[c(1:3, 19:23), c(1:3, 19:23)], 3)
## End(Not run)




