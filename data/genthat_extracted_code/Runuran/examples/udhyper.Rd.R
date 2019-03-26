library(Runuran)


### Name: udhyper
### Title: UNU.RAN object for Hypergeometric distribution
### Aliases: udhyper
### Keywords: distribution

### ** Examples

## Create distribution object for Hypergeometric distribution
dist <- udhyper(m=15,n=5,k=7)
## Generate generator object; use method DGT (inversion)
gen <- dgtd.new(dist)
## Draw a sample of size 100
x <- ur(gen,100)




