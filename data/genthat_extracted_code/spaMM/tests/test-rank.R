cat("\ntest singular design matrices:\n")

# Singular matrix from ?Matrix::qr :
X <- cbind(int = 1,
           b1=rep(1:0, each=3), b2=rep(0:1, each=3),
           c1=rep(c(1,0,0), 2), c2=rep(c(0,1,0), 2), c3=rep(c(0,0,1),2))
rownames(X) <- paste0("r", seq_len(nrow(X)))
donn <- as.data.frame(X)
set.seed(123)
donn$y <- runif(6)
fv1 <- fitted(lm(y~int+ b1+b2+c1+c2+c3,data=donn))
spaMM.options(rankmethod="qr")
fv2 <- fitme(y~int+ b1+b2+c1+c2+c3,data=donn)$fv
spaMM.options(rankmethod=".rankinfo")
fv3 <- fitme(y~int+ b1+b2+c1+c2+c3,data=donn)$fv ## fixef is not unique, but fitted values must be equivalent
spaMM.options(rankmethod="qr")
testthat::expect_true( max(apply(cbind(fv1,fv2,fv3),1L,var))<1e-16)
