# Data
X3 <- matrix(runif(10*20), nrow=10)
X3 <- as(X3, "sparseMatrix")
# Skeleton Decomposition
out.SKD <- skeleton.decomp(X3, r=3, num.iter=2, thr=1E-5)
# Test
expect_equivalent(length(out.SKD), 7)
expect_equivalent(dim(out.SKD$C)[1], 10)
expect_equivalent(dim(out.SKD$C)[2], 3)
expect_equivalent(dim(out.SKD$U)[1], 3)
expect_equivalent(dim(out.SKD$U)[2], 3)
expect_equivalent(dim(out.SKD$R)[1], 3)
expect_equivalent(dim(out.SKD$R)[2], 20)

