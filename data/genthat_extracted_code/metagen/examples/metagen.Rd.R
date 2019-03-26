library(metagen)


### Name: metagen
### Title: Inference: Analysis of the data set
### Aliases: metagen

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_x <- cbind(1,bcg$x)
sgnf_lev <- c(0.01, 0.025, 0.05, 0.01)

set.seed(865287113) # for reproducibility

# Runs a standard analysis, use n=1000 in an actual
# analysis instead!
m1 <- metagen(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=0.025, n=50)
m2 <- metagen(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=sgnf_lev, n=50)

# Runs the methods based on generalised principles via an
# adjustment for the unknown heteroscedasticity.  Use
# n=1000 in an actual analysis instead!!
bcg_s <- bcg$size
m3 <- metagen(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=0.025, s=bcg_s, n=50,
  adj=TRUE)
m4 <- metagen(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=sgnf_lev, s=bcg_s,
  n=50, adj=TRUE)

if (!all(names(m1) == names(metagenEmpty()))) stop("Name clash")
if (!all(names(m2) == names(metagenEmpty()))) stop("Name clash")
if (!all(names(m3) == names(metagenEmpty()))) stop("Name clash")
if (!all(names(m4) == names(metagenEmpty()))) stop("Name clash")



