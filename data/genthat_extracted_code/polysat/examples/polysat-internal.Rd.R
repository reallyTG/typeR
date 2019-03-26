library(polysat)


### Name: Internal Functions
### Title: Internal Functions in polysat
### Aliases: G INDEXG GENLIST RANMUL SELFMAT .unal1loc fixloci
### Keywords: distribution

### ** Examples

# Calculation of genotype probabilities in a tetraploid with four
# alleles plus a null, and a selfing rate of 0.5.  This is a translation
# of code in the supplementary material of De Silva et al. (2005).
m2 <- 4
m <- m2/2
na1 <- 5
self <- 0.5
ng <- na1
for(j in 2:m2){
    ng <- ng*(na1+j-1)/j
}
ag <- polysat:::GENLIST(ng, na1, m2)
temp <- polysat:::RANMUL(ng, na1, ag, m2)
rmul <- temp[[1]]
arep <- temp[[2]]
rm(temp)
smat <- polysat:::SELFMAT(ng, na1, ag, m2)
smatdiv <- (polysat:::G(m-1,m+1))^2
p1 <- c(0.1, 0.4, 0.2, 0.2, 0.1) # allele frequencies

# GPROBS subroutine
rvec <- rep(0,ng)
for(g in 1:ng){
    rvec[g] <- rmul[g]
    for(j in 1:m2){
        rvec[g] <- rvec[g]*p1[ag[g,j]]
    }
}
id <- diag(nrow=ng)
smatt <- smat/smatdiv
s3 <- id - self * smatt
s3inv <- solve(s3)
gprob <- (1-self) * s3inv %*% rvec
# gprob is a vector of probabilities of the seventy genotypes.



