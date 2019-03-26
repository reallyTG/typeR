library(metagen)


### Name: metareg
### Title: Inference: Based on methods of moments and maximum likelihood.
### Aliases: metareg

### ** Examples

bcg   <- bcgVaccineData()
bcg_y <- bcg$logrisk
bcg_d <- bcg$sdiv
bcg_s <- bcg$size
bcg_x <- cbind(1,bcg$x)
sgnf_lev <- c(0.01, 0.025, 0.05, 0.01)

set.seed(865287113) # for reproducibility

c1 <- metareg(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=0.025)
c2 <- metareg(y=bcg_y, d=bcg_d, x=bcg_x, sgnf=sgnf_lev)

# When performing a meta analysis, provide the function
# with a vector of 1s.
if (!all(names(c1) == names(metagenEmpty()))) stop("Name clash")
if (!all(names(c2) == names(metagenEmpty()))) stop("Name clash")



