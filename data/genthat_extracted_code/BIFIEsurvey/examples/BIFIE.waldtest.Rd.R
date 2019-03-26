library(BIFIEsurvey)


### Name: BIFIE.waldtest
### Title: Wald Tests for BIFIE Methods
### Aliases: BIFIE.waldtest summary.BIFIE.waldtest
### Keywords: Wald test summary

### ** Examples

#############################################################################
# EXAMPLE 1: Imputed TIMSS dataset
#############################################################################

data(data.timss1)
data(data.timssrep)

# create BIFIE.dat object
bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
           wgtrep=data.timssrep[, -1 ] )

#******************
#*** Model 1: Linear regression
res1 <- BIFIEsurvey::BIFIE.linreg( bdat, dep="ASMMAT", pre=c("one","books","migrant"),
         group="female" )
summary(res1)

#*** Wald test which tests whether sigma and R^2 values are the same
res1$parnames    # parameter names
pn <- res1$parnames ; PN <- length(pn)
Cdes <- matrix(0,nrow=2, ncol=PN)
colnames(Cdes) <- pn
# equality of R^2  ( R^2(female0) - R^2(female1)=0 )
Cdes[ 1, c("R^2_NA_female_0", "R^2_NA_female_1" ) ] <- c(1,-1)
# equality of sigma ( sigma(female0) - sigma(female1)=0)
Cdes[ 2, c("sigma_NA_female_0", "sigma_NA_female_1" ) ] <- c(1,-1)
# design vector
rdes <- rep(0,2)
# perform Wald test
wmod1 <- BIFIEsurvey::BIFIE.waldtest( BIFIE.method=res1, Cdes=Cdes, rdes=rdes )
summary(wmod1)

## Not run: 
##D #******************
##D #*** Model 2: Correlations
##D 
##D # compute some correlations
##D res2a <- BIFIEsurvey::BIFIE.correl( bdat, vars=c("ASMMAT","ASSSCI","migrant","books"))
##D summary(res2a)
##D 
##D # test whether r(MAT,migr)=r(SCI,migr) and r(MAT,books)=r(SCI,books)
##D pn <- res2a$parnames; PN <- length(pn)
##D Cdes <- matrix( 0, nrow=2, ncol=PN )
##D colnames(Cdes) <- pn
##D Cdes[ 1, c("ASMMAT_migrant", "ASSSCI_migrant") ] <- c(1,-1)
##D Cdes[ 2, c("ASMMAT_books", "ASSSCI_books") ] <- c(1,-1)
##D rdes <- rep(0,2)
##D # perform Wald test
##D wres2a <- BIFIEsurvey::BIFIE.waldtest( res2a, Cdes, rdes )
##D summary(wres2a)
##D 
##D #******************
##D #*** Model 3: Frequencies
##D 
##D # Number of books splitted by gender
##D res3a <- BIFIEsurvey::BIFIE.freq( bdat, vars=c("books"), group="female" )
##D summary(res3a)
##D 
##D # test whether book(cat4,female0)+book(cat5,female0)=book(cat4,female1)+book(cat5,female5)
##D pn <- res3a$parnames
##D PN <- length(pn)
##D Cdes <- matrix( 0, nrow=1, ncol=PN )
##D colnames(Cdes) <- pn
##D Cdes[ 1, c("books_4_female_0", "books_5_female_0",
##D     "books_4_female_1", "books_5_female_1" ) ] <- c(1,1,-1,-1)
##D rdes <- c(0)
##D # Wald test
##D wres3a <- BIFIEsurvey::BIFIE.waldtest( res3a, Cdes, rdes )
##D summary(wres3a)
##D 
##D #******************
##D #*** Model 4: Means
##D 
##D # math and science score splitted by gender
##D res4a <- BIFIEsurvey::BIFIE.univar( bdat, vars=c("ASMMAT","ASSSCI"), group="female")
##D summary(res4a)
##D 
##D # test whether there are significant gender differences in math and science
##D #=> multivariate ANOVA
##D pn <- res4a$parnames
##D PN <- length(pn)
##D Cdes <- matrix( 0, nrow=2, ncol=PN )
##D colnames(Cdes) <- pn
##D Cdes[ 1, c("ASMMAT_female_0", "ASMMAT_female_1"  ) ] <- c(1,-1)
##D Cdes[ 2, c("ASSSCI_female_0", "ASSSCI_female_1"  ) ] <- c(1,-1)
##D rdes <- rep(0,2)
##D # Wald test
##D wres4a <- BIFIEsurvey::BIFIE.waldtest( res4a, Cdes, rdes )
##D summary(wres4a)
## End(Not run)



