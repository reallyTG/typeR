library(genepi)


### Name: haplotypeOddsRatio
### Title: Calculate haplotype disease risk.
### Aliases: haplotypeOddsRatio print.haploOR
### Keywords: regression odds-ratio

### ** Examples

# simulated data with 2 loci haplotypes 1=00, 2=01, 3=10, 4=11
# control haplotype probabilities p[i]  i=1,2,3,4
# haplotype pairs (i<=j) i=j: probs = p[i]^2 ; i<j: p[i]*p[j]
p <- c(0.25, 0.2, 0.2, 0.35)
p0 <- rep(0, 10)
l <- 0
for(i in 1:4) {for(j in i:4) {l <- l+1; p0[l] <- 2*p[i]*p[j]/(1+1*(i==j))}}
controls <- as.numeric(cut(runif(1000), cumsum(c(0,p0)), labels=1:10))
# case probabilities disease haplotype is 11
or <- c(2, 5)
p1 <- p0*c(1,1,1,2,1,1,2,1,2,8); p1 <- p1/sum(p1)
cases <- as.numeric(cut(runif(1000), cumsum(c(0,p1)), labels=1:10))
# now pool them together and set up the data frame
dat <- data.frame(status=rep(0:1, c(1000, 1000)))
# number of copies of mutant variant for locus 1
dat$gtype1 <- c(0,0,1,1,0,1,1,2,2,2)[c(controls, cases)]
# number of copies of mutant variant for locus 2
dat$gtype2 <- c(0,1,0,1,2,1,2,0,1,2)[c(controls, cases)]
# true number of copies of disease haplotype
dat$hcn <- c(0,0,0,1,0,0,1,0,1,2)[c(controls, cases)]
# model with genotypes only
haplotypeOddsRatio(status ~ 1, c("gtype1","gtype2"), dat)
# model from the logistic fit using the number of copies of disease haplotype
glm(status ~ factor(hcn), dat, family=binomial)



