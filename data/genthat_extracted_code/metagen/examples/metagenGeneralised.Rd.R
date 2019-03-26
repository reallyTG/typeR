library(metagen)


### Name: metagenGeneralised
### Title: Inference: Based on generalised inference principles.
### Aliases: metagenGeneralised

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_x <- cbind(1,bcg$x)
sgnf_lev <- c(0.01, 0.025, 0.05, 0.01)

set.seed(865287113) # for reproducibility

# Runs a standard analysis, use n=1000 in an actual
# analysis instead!!
g1 <- metagenGeneralised(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=0.025, n=50)
g2 <- metagenGeneralised(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=sgnf_lev,
  n=50)

# Runs the methods based on generalised principles via an
# adjustment for the unknown heteroscedasticity.  Use n=1000 in an
# actual analysis instead!!
bcg_s <- bcg$size
g3 <- metagenGeneralised(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=0.025,
  s=bcg_s, n=50, adj=TRUE)
g4 <- metagenGeneralised(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=sgnf_lev,
  s=bcg_s, n=50, adj=TRUE)

# The implementation can also handle the case in which
# a meta regression is planed with no intercept and only a
# single covariate (i.e. dim(x) = 1).  In this case,
# the design matrix can simply be provided by a vector.
# (This makes no sense in this example and shall only proves
# feasibility)
g5 <- metagenGeneralised(y=bcg_y, d=bcg_d, x=bcg$x, sgnf=0.025, n=50)

# When performing a meta analysis, provide the function
# with a vector of 1s.
g6 <- metagenGeneralised(y=bcg_y, d=bcg_d, x=rep(1,length(bcg_y)),
  sgnf=0.025, n=50)

if (!all(names(g1) == names(metagenEmpty()))) stop("Name clash")
if (!all(names(g2) == names(metagenEmpty()))) stop("Name clash")
if (!all(names(g3) == names(metagenEmpty()))) stop("Name clash")
if (!all(names(g4) == names(metagenEmpty()))) stop("Name clash")
if (!all(names(g5) == names(metagenEmpty()))) stop("Name clash")
if (!all(names(g6) == names(metagenEmpty()))) stop("Name clash")



