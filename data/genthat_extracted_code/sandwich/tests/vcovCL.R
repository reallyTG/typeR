library("sandwich")
data("PetersenCL", package = "sandwich")
m <- lm(y ~ x, data = PetersenCL)
b <- glm((y > 0) ~ x, data = PetersenCL, family = binomial(link = "logit"))

## various versatile variance flavors
vcovCL(m, cluster = ~ firm, type = "HC0", cadjust = TRUE)
vcovCL(m, cluster = ~ firm, type = "HC0", cadjust = FALSE)
vcovCL(m, cluster = ~ firm, type = "HC1", cadjust = TRUE)
vcovCL(m, cluster = ~ firm, type = "HC1", cadjust = FALSE)
vcovCL(m, cluster = ~ firm, type = "HC2", cadjust = TRUE)
vcovCL(m, cluster = ~ firm, type = "HC2", cadjust = FALSE)
vcovCL(m, cluster = ~ firm, type = "HC3", cadjust = TRUE)
vcovCL(m, cluster = ~ firm, type = "HC3", cadjust = FALSE)

vcovCL(m, cluster = ~ firm + year, type = "HC0", cadjust = TRUE)
vcovCL(m, cluster = ~ firm + year, type = "HC0", cadjust = FALSE)
vcovCL(m, cluster = ~ firm + year, type = "HC1", cadjust = TRUE)
vcovCL(m, cluster = ~ firm + year, type = "HC1", cadjust = FALSE)
vcovCL(m, cluster = ~ firm + year, type = "HC2", cadjust = TRUE)
vcovCL(m, cluster = ~ firm + year, type = "HC2", cadjust = FALSE)
vcovCL(m, cluster = ~ firm + year, type = "HC3", cadjust = TRUE)
vcovCL(m, cluster = ~ firm + year, type = "HC3", cadjust = FALSE)


## comparison with multiwayvcov::cluster.vcov

all.equal(
  vcovCL(m, cluster = ~ firm),
  multiwayvcov::cluster.vcov(m, ~ firm)
)
all.equal(
  vcovCL(m, cluster = ~ firm + year, multi0 = TRUE),
  multiwayvcov::cluster.vcov(m, ~ firm + year)
)
all.equal(
  vcovCL(m, cluster = ~ firm, type = "HC0", cadjust = FALSE),
  multiwayvcov::cluster.vcov(m, ~ firm, df_correction = FALSE)
)
all.equal(
  vcovCL(m, cluster = ~ firm + year, type = "HC0", cadjust = FALSE),
  multiwayvcov::cluster.vcov(m, ~ firm + year, df_correction = FALSE)
)


## comparison with BMlmSE snippet (https://github.com/kolesarm/Robust-Small-Sample-Standard-Errors,
## Bell-McCaffrey standard errors as described in Imbens and Kolesar 2016)

## BMlmSE(m, clustervar = factor(PetersenCL$firm))$vcov
bellmc1 <- matrix(c(0.0044944872570532, -6.59291186924326e-05, -6.59291186924326e-05, 0.00256823604178553), nrow = 2)
rownames(bellmc1) <- colnames(bellmc1) <- c("(Intercept)", "x")

(bellmc2 <- vcovCL(m, cluster = ~ firm, type = "HC2"))
all.equal(bellmc1, bellmc2)


## comparison with Stata/MP 12.0
## regress y x, vce(cluster firm)
clm <- matrix(c(0.0044907, -0.00006474, -0.00006474, 0.00255993), nrow = 2)

## logit via brl (https://economics.mit.edu/faculty/angrist/data1/mhe/brl)
## generate binary = (y > 0)
## brl binary x, cluster(firm) logit
clb <- matrix(c(0.00358954,  0.00001531, 0.00001531, 0.00275766), nrow = 2)
rownames(clm) <- colnames(clm) <- rownames(clb) <- colnames(clb) <- c("(Intercept)", "x")

all.equal(vcovCL(m, cluster = ~ firm), clm, tol = 1e-5)
all.equal(vcovCL(b, cluster = ~ firm), clb, tol = 1e-5)

## clustered HC2 for OLS and logit
hc2m <- matrix(c(0.00449449, -0.00006593, -0.00006593, 0.00256824), nrow = 2)
hc2b <- matrix(c(0.00359275,  0.000015, 0.000015, 0.00276326), nrow = 2)
rownames(hc2m) <- colnames(hc2m) <- rownames(hc2b) <- colnames(hc2b) <- c("(Intercept)", "x")

all.equal(vcovCL(m, cluster = ~ firm, type = "HC2"), hc2m, tol = 1e-5)
all.equal(vcovCL(b, cluster = ~ firm, type = "HC2"), hc2b, tol = 2e-4)


## more examples

data("InstInnovation", package = "sandwich")
n <- glm(cites ~ institutions, data = InstInnovation, family = poisson)

vcovCL(n, cluster = ~ company, type = "HC0", cadjust = TRUE)
vcovCL(n, cluster = ~ company, type = "HC0", cadjust = FALSE)
vcovCL(n, cluster = ~ company, type = "HC1", cadjust = TRUE)
vcovCL(n, cluster = ~ company, type = "HC1", cadjust = FALSE)
vcovCL(n, cluster = ~ company, type = "HC2", cadjust = TRUE)
vcovCL(n, cluster = ~ company, type = "HC2", cadjust = FALSE)
vcovCL(n, cluster = ~ company, type = "HC3", cadjust = TRUE)
vcovCL(n, cluster = ~ company, type = "HC3", cadjust = FALSE)

vcovCL(n, cluster = ~ company + year, type = "HC0", cadjust = TRUE)
vcovCL(n, cluster = ~ company + year, type = "HC0", cadjust = FALSE)
vcovCL(n, cluster = ~ company + year, type = "HC1", cadjust = TRUE)
vcovCL(n, cluster = ~ company + year, type = "HC1", cadjust = FALSE)
vcovCL(n, cluster = ~ company + year, type = "HC2", cadjust = TRUE)
vcovCL(n, cluster = ~ company + year, type = "HC2", cadjust = FALSE)
vcovCL(n, cluster = ~ company + year, type = "HC3", cadjust = TRUE)
vcovCL(n, cluster = ~ company + year, type = "HC3", cadjust = FALSE)


o <- lm(log(cites) ~ institutions, data = InstInnovation, subset = cites > 0)

vcovCL(o, cluster = ~ company + year, type = "HC0", cadjust = TRUE, multi0 = TRUE)
vcovCL(o, cluster = ~ company + year, type = "HC0", cadjust = TRUE, multi0 = FALSE)
vcovCL(o, cluster = ~ company + year, type = "HC0", cadjust = FALSE, multi0 = TRUE)
vcovCL(o, cluster = ~ company + year, type = "HC0", cadjust = FALSE, multi0 = FALSE)
vcovCL(o, cluster = ~ company + year, type = "HC1", cadjust = TRUE, multi0 = TRUE)
vcovCL(o, cluster = ~ company + year, type = "HC1", cadjust = TRUE, multi0 = FALSE)
vcovCL(o, cluster = ~ company + year, type = "HC1", cadjust = FALSE, multi0 = TRUE)
vcovCL(o, cluster = ~ company + year, type = "HC1", cadjust = FALSE, multi0 = FALSE)
vcovCL(o, cluster = ~ company + year, type = "HC2", cadjust = TRUE, multi0 = TRUE)
vcovCL(o, cluster = ~ company + year, type = "HC2", cadjust = TRUE, multi0 = FALSE)
vcovCL(o, cluster = ~ company + year, type = "HC2", cadjust = FALSE, multi0 = TRUE)
vcovCL(o, cluster = ~ company + year, type = "HC2", cadjust = FALSE, multi0 = FALSE)
vcovCL(o, cluster = ~ company + year, type = "HC3", cadjust = TRUE, multi0 = TRUE)
vcovCL(o, cluster = ~ company + year, type = "HC3", cadjust = TRUE, multi0 = FALSE)
vcovCL(o, cluster = ~ company + year, type = "HC3", cadjust = FALSE, multi0 = TRUE)
vcovCL(o, cluster = ~ company + year, type = "HC3", cadjust = FALSE, multi0 = FALSE)

