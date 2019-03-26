# Data
X1 <- array(rnorm(3*5*7*9*11), c(3,5,7,9,11))
dimnames(X1) <- list(
    I=paste0("i", 1:3),
    J=paste0("j", 1:5),
    K=paste0("k", 1:7),
    L=paste0("l", 1:9),
    M=paste0("m", 1:11)
    )
X1 <- as.tensor(X1)
Ranks <- c(p=2, q=4, r=6, s=8)
# TTSVD
out.TTSVD1 <- TTSVD(X1, Ranks)
out.TTSVD2 <- TTSVD(X1, accuracy=1E-10)
# Test
expect_equivalent(length(out.TTSVD1), 5)
expect_equivalent(dim(out.TTSVD1[[1]])[1], 3)
expect_equivalent(dim(out.TTSVD1[[1]])[2], 2)
expect_equivalent(dim(out.TTSVD1[[2]])[1], 2)
expect_equivalent(dim(out.TTSVD1[[2]])[2], 5)
expect_equivalent(dim(out.TTSVD1[[2]])[3], 4)
expect_equivalent(dim(out.TTSVD1[[3]])[1], 4)
expect_equivalent(dim(out.TTSVD1[[3]])[2], 7)
expect_equivalent(dim(out.TTSVD1[[3]])[3], 6)
expect_equivalent(dim(out.TTSVD1[[4]])[1], 6)
expect_equivalent(dim(out.TTSVD1[[4]])[2], 9)
expect_equivalent(dim(out.TTSVD1[[4]])[3], 8)
expect_equivalent(dim(out.TTSVD1[[5]])[1], 8)
expect_equivalent(dim(out.TTSVD1[[5]])[2], 11)
expect_equivalent(length(out.TTSVD2), 5)