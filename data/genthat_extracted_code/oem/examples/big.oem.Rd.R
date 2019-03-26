library(oem)


### Name: big.oem
### Title: Orthogonalizing EM for big.matrix objects
### Aliases: big.oem

### ** Examples

set.seed(123)
nrows <- 50000
ncols <- 100
bkFile <- "bigmat.bk"
descFile <- "bigmatk.desc"
bigmat <- filebacked.big.matrix(nrow=nrows, ncol=ncols, type="double",
                                backingfile=bkFile, backingpath=".",
                                descriptorfile=descFile,
                                dimnames=c(NULL,NULL))

# Each column value with be the column number multiplied by
# samples from a standard normal distribution.
set.seed(123)
for (i in 1:ncols) bigmat[,i] = rnorm(nrows)*i

y <- rnorm(nrows) + bigmat[,1] - bigmat[,2]

fit <- big.oem(x = bigmat, y = y, 
               penalty = c("lasso", "elastic.net", 
                           "ols", 
                           "mcp",       "scad", 
                           "mcp.net",   "scad.net",
                           "grp.lasso", "grp.lasso.net",
                           "grp.mcp",   "grp.scad",
                           "sparse.grp.lasso"), 
               groups = rep(1:20, each = 5))
               
fit2 <- oem(x = bigmat[,], y = y, 
            penalty = c("lasso", "grp.lasso"), 
            groups = rep(1:20, each = 5))   
           
max(abs(fit$beta[[1]] - fit2$beta[[1]]))            

layout(matrix(1:2, ncol = 2))
plot(fit)
plot(fit, which.model = 2)




