library(miceadds)


### Name: ma_lme4_formula
### Title: Utility Functions for Working with 'lme4' Formula Objects
### Aliases: ma_lme4_formula ma_lme4_formula_terms
###   ma_lme4_formula_design_matrices

### ** Examples

#############################################################################
# EXAMPLE 1: Splitting a lme4 formula
#############################################################################

#*** formula for a multilevel model
formula <- y ~ I( miceadds::cwc(x, idcluster)) + z + I(z^2) + I( miceadds::gm(x, idcluster) ) + w +
                        ( x + I(x^2) | idcluster)  + (0 +  w | idcluster ) +
                        ( 0 + I(as.factor(f)) | idcluster)
miceadds::ma_lme4_formula_terms(formula)

#*** formula for a single level model
formula2 <- y ~ I( miceadds::cwc(x, idcluster)) + z + I(z^2) + I( miceadds::gm(x, idcluster) ) + w
miceadds::ma_lme4_formula_terms(formula2)

#############################################################################
# EXAMPLE 2: Design matrices for multilevel model
#############################################################################

data(data.ma07, package="miceadds")
dat <- data.ma07

formula <- x1 ~ x2 + I( miceadds::gm( x2, id2)) + I( miceadds::gm( x2, id3)) + y1 + z1 +
                    ( x2 | id2:id3 ) + ( 1 | id3 ) + ( 0 + x2 | id3 )
res <- miceadds::ma_lme4_formula_design_matrices(formula, data=dat)
str(res)



