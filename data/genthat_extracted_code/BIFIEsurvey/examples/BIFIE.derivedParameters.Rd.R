library(BIFIEsurvey)


### Name: BIFIE.derivedParameters
### Title: Statistical Inference for Derived Parameters
### Aliases: BIFIE.derivedParameters summary.BIFIE.derivedParameters
###   coef.BIFIE.derivedParameters vcov.BIFIE.derivedParameters
### Keywords: Derived parameters summary coef vcov

### ** Examples

#############################################################################
# EXAMPLE 1: Imputed TIMSS dataset
#            Inference for correlations and derived parameters
#############################################################################

data(data.timss1)
data(data.timssrep)

# create BIFIE.dat object
bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
           wgtrep=data.timssrep[, -1 ] )

# compute correlations
res1 <- BIFIEsurvey::BIFIE.correl( bdat,
            vars=c("ASSSCI", "ASMMAT", "books", "migrant" )  )
summary(res1)
res1$parnames
  ##    [1] "ASSSCI_ASSSCI"   "ASSSCI_ASMMAT"   "ASSSCI_books"    "ASSSCI_migrant"
  ##    [5] "ASMMAT_ASMMAT"   "ASMMAT_books"    "ASMMAT_migrant"  "books_books"
  ##    [9] "books_migrant"   "migrant_migrant"

# define four derived parameters
derived.parameters <- list(
        # squared correlation of science and mathematics
        "R2_sci_mat"=~ 0 + I( 100* ASSSCI_ASMMAT^2  ),
        # partial correlation of science and mathematics controlling for books
        "parcorr_sci_mat"=~ 0 + I( ( ASSSCI_ASMMAT - ASSSCI_books * ASMMAT_books ) /
                            sqrt(( 1 - ASSSCI_books^2 ) * ( 1-ASMMAT_books^2 ) ) ),
        # original correlation science and mathematics (already contained in res1)
        "cor_sci_mat"=~ 0 + I( ASSSCI_ASMMAT ),
        # original correlation books and migrant
        "cor_book_migra"=~ 0 + I( books_migrant )
        )

# statistical inference for derived parameters
res2 <- BIFIEsurvey::BIFIE.derivedParameters( res1, derived.parameters )
summary(res2)



