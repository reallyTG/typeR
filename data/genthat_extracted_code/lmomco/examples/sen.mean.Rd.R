library(lmomco)


### Name: sen.mean
### Title: Sen's Weighted Mean Statistic
### Aliases: sen.mean
### Keywords: special function

### ** Examples

fake.dat <- c(123,34,4,654,37,78)
sen.mean(fake.dat); mean(fake.dat) # These should be the same values

sen.mean(fake.dat, k=(length(fake.dat)/2) - 1); median(fake.dat)
# Again, same values

# Finally, the sen.mean() is like a symmetrically trimmed TL-moment
# Let us demonstrate by computed a two sample trimming for each side
# for a Normal distribution having a mean of 100.
fake.dat <- rnorm(20, mean=100)
lmr <- TLmoms(fake.dat, trim=2)
sen <- sen.mean(fake.dat, k=2)

print(abs(lmr$lambdas[1] - sen$sen)) # zero is returned



