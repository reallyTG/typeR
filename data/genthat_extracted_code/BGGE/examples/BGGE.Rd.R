library(BGGE)


### Name: BGGE
### Title: Genotype x Environment models using regression kernel
### Aliases: BGGE

### ** Examples

# multi-environment main genotypic model
library(BGLR)
data(wheat)
X<-wheat.X[1:200,1:600]  # Subset of 200 subjects and 600 markers
rownames(X) <- 1:200
Y<-wheat.Y[1:200,]
A<-wheat.A[1:200,1:200] # Pedigree

GB<-tcrossprod(X)/ncol(X)
K<-list(G = list(Kernel = GB, Type = "D"))
y<-Y[,1]
fit<-BGGE(y = y,K = K, ne = length(y), ite = 300, burn = 100, thin = 2)

# multi-environment main genotypic model
Env <- as.factor(c(2,3)) #subset of 2 environments
pheno_geno <- data.frame(env = gl(n = 2, k = nrow(Y), labels = Env),
                         GID = gl(n = nrow(Y), k = 1,length = nrow(Y) * length(Env)),
                         value = as.vector(Y[,2:3]))

K <- getK(Y = pheno_geno, X = X, kernel = "GB", model = "MM")
y <- pheno_geno[,3]
fit <- BGGE(y = y, K = K, ne = rep(nrow(Y), length(Env)), ite = 300, burn = 100,thin = 1)





