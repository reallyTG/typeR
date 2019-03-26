library("sandwich")
data("PetersenCL", package = "sandwich")
m <- lm(y ~ x, data = PetersenCL)
sandwich::vcovPC(m, cluster = ~ firm + year)

PU <- subset(PetersenCL, !(firm == 1 & year == 10))
u_m <- lm(y ~ x, data = PU)
sandwich::vcovPC(u_m, cluster = ~ firm + year, pairwise = TRUE)
sandwich::vcovPC(u_m, cluster = ~ firm + year, pairwise = FALSE)


## vcovPC compared with Stata's xtpcse (xtscc y x) standard errors
pc1 <- c(0.0222006 , 0.025276)
names(pc1) <- c("(Intercept)", "x")
pc1
(pc2 <- sqrt(diag(sandwich::vcovPC(m, cluster = PetersenCL$firm, order.by = PetersenCL$year))))
all.equal(pc1, pc2, tolerance = 1e-5)


## sandwich::vcovPC compared to pcse::vcovPC
(pc3 <- pcse::vcovPC(u_m, PU$firm, PU$year, pairwise = FALSE))
(pc4 <- sandwich::vcovPC(u_m, cluster = ~ firm + year, pairwise = FALSE))
(pc5 <- pcse::vcovPC(u_m, PU$firm, PU$year, pairwise = TRUE))
(pc6 <- sandwich::vcovPC(u_m, cluster = ~ firm + year, pairwise = TRUE))
rownames(pc3) <- colnames(pc3) <- rownames(pc5) <- colnames(pc5) <- c("(Intercept)", "x")
all.equal(pc3, pc4)
all.equal(pc5, pc6)
