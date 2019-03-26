library(BIFIEsurvey)


### Name: BIFIE.data.transform
### Title: Data Transformation for 'BIFIEdata' Objects
### Aliases: BIFIE.data.transform
### Keywords: Data transformation

### ** Examples

library(miceadds)

#############################################################################
# EXAMPLE 1: Data transformations for TIMSS data
#############################################################################

data(data.timss2)
data(data.timssrep)
# create BIFIEdata object
bifieobj1 <- BIFIEsurvey::BIFIE.data( data.timss2, wgt=data.timss2[[1]]$TOTWGT,
            wgtrep=data.timssrep[,-1] )
# create BIFIEdata object in compact way (cdata=TRUE)
bifieobj2 <- BIFIEsurvey::BIFIE.data( data.timss2, wgt=data.timss2[[1]]$TOTWGT,
            wgtrep=data.timssrep[,-1], cdata=TRUE)

#****************************
#*** Transformation 1: Squared and cubic book variable
transform.formula <- ~ 0 + I( books^2 ) + I( books^3 )
# as.character(transform.formula)
bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj1,
                  transform.formula=transform.formula)
bifieobj$variables
# rename added variables
bifieobj$varnames[ bifieobj$varsindex.added ] <- c("books_sq", "books_cub")

# check descriptive statistics
res1 <- BIFIEsurvey::BIFIE.univar( bifieobj, vars=c("books_sq", "books_cub" ) )
summary(res1)

## Not run: 
##D #****************************
##D #*** Transformation 2: Create dummy variables for variable book
##D transform.formula <- ~ 0 + as.factor(books)
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj,
##D                     transform.formula=transform.formula )
##D ##   Included 5 variables: as.factor(books)1 as.factor(books)2 as.factor(books)3
##D ##        as.factor(books)4 as.factor(books)5
##D bifieobj$varnames[ bifieobj$varsindex.added ] <- paste0("books_D", 1:5)
##D 
##D #****************************
##D #*** Transformation 3: Discretized mathematics score
##D hi3a <- BIFIEsurvey::BIFIE.hist( bifieobj, vars="ASMMAT" )
##D plot(hi3a)
##D transform.formula <- ~ 0 + I( as.numeric(cut( ASMMAT, breaks=seq(200,800,100) )) )
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj,
##D                  transform.formula=transform.formula, varnames.new="ASMMAT_discret")
##D hi3b <- BIFIEsurvey::BIFIE.hist( bifieobj, vars="ASMMAT_discret", breaks=1:7 )
##D plot(hi3b)
##D # check frequencies
##D fr3b <- BIFIEsurvey::BIFIE.freq( bifieobj, vars="ASMMAT_discret", se=FALSE )
##D summary(fr3b)
##D 
##D #****************************
##D #*** Transformation 4: include standardization variables for book variable
##D 
##D # start with testing the transformation function on a single dataset
##D dat1 <- bifieobj$dat1
##D stats::weighted.mean( dat1[,"books"], dat1[,"TOTWGT"], na.rm=TRUE)
##D sqrt( Hmisc::wtd.var( dat1[,"books"], dat1[,"TOTWGT"], na.rm=TRUE) )
##D # z standardization
##D transform.formula <- ~ 0 + I( ( books - weighted.mean( books, TOTWGT, na.rm=TRUE) )/
##D                                 sqrt( Hmisc::wtd.var( books, TOTWGT, na.rm=TRUE) ))
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj,
##D                transform.formula=transform.formula, varnames.new="z_books" )
##D # standardize variable books with M=500 and SD=100
##D transform.formula <- ~ 0 + I(
##D         500 + 100*( books - stats::weighted.mean( books, w=TOTWGT, na.rm=TRUE) ) /
##D               sqrt( Hmisc::wtd.var( books, weights=TOTWGT, na.rm=TRUE) )  )
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj,
##D              transform.formula=transform.formula, varnames.new="z500_books" )
##D 
##D # standardize variable books with respect to M and SD of ALL imputed datasets
##D res <- BIFIEsurvey::BIFIE.univar( bifieobj, vars="books" )
##D summary(res)
##D ##       var  Nweight Ncases     M M_SE M_fmi M_VarMI M_VarRep    SD SD_SE SD_fmi
##D ##   1 books 76588.72   4554 2.945 0.04     0       0    0.002 1.146 0.015      0
##D M <- round(res$output$mean1,5)
##D SD <- round(res$output$sd1,5)
##D transform.formula <- paste0( " ~ 0 + I( ( books - ",  M, " ) / ", SD, ")"  )
##D ##   > transform.formula
##D ##   [1] " ~ 0 + I( ( books - 2.94496 ) / 1.14609)"
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj,
##D                  transform.formula=stats::as.formula(transform.formula),
##D                  varnames.new="zall_books" )
##D 
##D # check statistics
##D res4 <- BIFIEsurvey::BIFIE.univar( bifieobj,
##D               vars=c("z_books", "z500_books", "zall_books") )
##D summary(res4)
##D 
##D #****************************
##D #*** Transformation 5: include rank transformation for variable ASMMAT
##D 
##D # calculate percentage ranks using wtd.rank function from Hmisc package
##D dat1 <- bifieobj$dat1
##D 100 * Hmisc::wtd.rank( dat1[,"ASMMAT"], w=dat1[,"TOTWGT"] ) / sum( dat1[,"TOTWGT"] )
##D # define an auxiliary function for calculating percentage ranks
##D wtd.percrank <- function( x, w ){
##D     100 * Hmisc::wtd.rank( x, w, na.rm=TRUE ) / sum( w, na.rm=TRUE )
##D }
##D wtd.percrank( dat1[,"ASMMAT"], dat1[,"TOTWGT"] )
##D # define transformation formula
##D transform.formula <- ~ 0 + I( wtd.percrank( ASMMAT, TOTWGT ) )
##D # add ranks to BIFIEdata object
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj,
##D                transform.formula=transform.formula,  varnames.new="ASMMAT_rk")
##D # check statistic
##D res5 <- BIFIEsurvey::BIFIE.univar( bifieobj, vars=c("ASMMAT_rk" ) )
##D summary(res5)
##D 
##D #****************************
##D #*** Transformation 6: recode variable books
##D 
##D library(car)
##D # recode variable books according to "1,2=0, 3,4=1, 5=2"
##D dat1 <- bifieobj$dat1
##D # use Recode function from car package
##D car::Recode( dat1[,"books"], "1:2='0'; c(3,4)='1';5='2'")
##D # define transformation formula
##D transform.formula <- ~ 0 + I( car::Recode( books, "1:2='0'; c(3,4)='1';5='2'") )
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj,
##D                transform.formula=transform.formula,  varnames.new="book_rec" )
##D res6 <- BIFIEsurvey::BIFIE.freq( bifieobj, vars=c("book_rec" ) )
##D summary(res6)
##D 
##D #****************************
##D #*** Transformation 7: include some variables aggregated to the school level
##D 
##D dat1 <- as.data.frame(bifieobj$dat1)
##D # at first, create school ID in the dataset by transforming the student ID
##D dat1$idschool <- as.numeric(substring( dat1$IDSTUD, 1, 5 ))
##D transform.formula <- ~ 0 +I( as.numeric( substring( IDSTUD, 1, 5 ) ) )
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj,
##D                transform.formula=transform.formula, varnames.new="idschool" )
##D 
##D #*** test function for a single dataset bifieobj$dat1
##D dat1 <- as.data.frame(bifieobj$dat1)
##D gm <- miceadds::GroupMean( data=dat1$ASMMAT, group=dat1$idschool, extend=TRUE)[,2]
##D 
##D # add school mean ASMMAT
##D tformula <- ~ 0 + I( miceadds::GroupMean( ASMMAT, group=idschool, extend=TRUE)[,2] )
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj, transform.formula=tformula,
##D                 varnames.new="M_ASMMAT" )
##D # add within group centered mathematics values of ASMMAT
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj,
##D                 transform.formula=~ 0 + I( ASMMAT - M_ASMMAT ),
##D                 varnames.new="WC_ASMMAT" )
##D 
##D # add school mean books
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj,
##D                 transform.formula=~ 0 + I( add.groupmean( books, idschool ) ),
##D                 varnames.new="M_books" )
##D 
##D #****************************
##D #*** Transformation 8: include fitted values and residuals from a linear model
##D # create new BIFIEdata object
##D data(data.timss1)
##D bifieobj3 <- BIFIEsurvey::BIFIE.data( data.timss1, wgt=data.timss1[[1]]$TOTWGT,
##D             wgtrep=data.timssrep[,-1] )
##D 
##D # specify transformation
##D transform.formula <- ~ 0 + I( fitted( stats::lm( ASMMAT ~ migrant + female ) ) ) +
##D                              I( residuals( stats::lm( ASMMAT ~ migrant + female ) ) )
##D   # Note that lm omits cases in regression by listwise deletion.
##D # add fitted values and residual to BIFIEdata object
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj3,
##D                   transform.formula=transform.formula )
##D bifieobj$varnames[ bifieobj$varsindex.added ] <- c("math_fitted1", "math_resid1")
##D 
##D #****************************
##D #*** Transformation 9: Including principal component scores in BIFIEdata object
##D 
##D # define auxiliary function for extracting PCA scores
##D BIFIE.princomp <- function( formula, Ncomp ){
##D     X <- stats::princomp( formula, cor=TRUE)
##D     Xp <- X$scores[, 1:Ncomp ]
##D     return(Xp)
##D }
##D # define transformation formula
##D transform.formula <- ~ 0 +
##D         I( BIFIE.princomp( ~ migrant + female + books + lang + ASMMAT, 3 ) )
##D # apply transformation
##D bifieobj <- BIFIEsurvey::BIFIE.data.transform( bifieobj3,
##D                 transform.formula=transform.formula )
##D bifieobj$varnames[ bifieobj$varsindex.added ] <- c("pca_sc1", "pca_sc2","pca_sc3")
##D # check descriptive statistics
##D res9 <- BIFIEsurvey::BIFIE.univar( bifieobj, vars="pca_sc1", se=FALSE)
##D summary(res9)
##D res9$output$mean1M
##D 
##D # The transformation formula can also be conveniently generated by string operations
##D vars <- c("migrant", "female", "books", "lang" )
##D transform.formula2 <- as.formula( paste0( "~ 0 + I ( BIFIE.princomp( ~ ",
##D        paste0( vars, collapse="+" ),  ", 3 ) )") )
##D   ##   > transform.formula2
##D   ##   ~0 + I(BIFIE.princomp(~migrant + female + books + lang, 3))
##D 
##D #****************************
##D #*** Transformation 10: Overwriting variables books and migrant
##D bifieobj4 <-  BIFIEsurvey::BIFIE.data.transform( bifieobj3,
##D             transform.formula=~ 0 + I( 1*(books >=1 ) ) + I(2*migrant),
##D                 varnames.new=c("books","migrant") )
##D summary(bifieobj4)
## End(Not run)



