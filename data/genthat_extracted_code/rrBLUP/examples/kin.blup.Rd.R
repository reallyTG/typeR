library(rrBLUP)


### Name: kin.blup
### Title: Genotypic value prediction based on kinship
### Aliases: kin.blup

### ** Examples

#random population of 200 lines with 1000 markers
M <- matrix(rep(0,200*1000),200,1000)
for (i in 1:200) {
  M[i,] <- ifelse(runif(1000)<0.5,-1,1)
}
rownames(M) <- 1:200
A <- A.mat(M)

#random phenotypes
u <- rnorm(1000)
g <- as.vector(crossprod(t(M),u))
h2 <- 0.5  #heritability
y <- g + rnorm(200,mean=0,sd=sqrt((1-h2)/h2*var(g)))

data <- data.frame(y=y,gid=1:200)

#predict breeding values
ans <- kin.blup(data=data,geno="gid",pheno="y",K=A)
accuracy <- cor(g,ans$g)




