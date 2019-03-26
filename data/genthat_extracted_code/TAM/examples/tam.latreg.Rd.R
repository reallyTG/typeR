library(TAM)


### Name: tam.latreg
### Title: Latent Regression Model
### Aliases: tam.latreg summary.tam.latreg print.tam.latreg
### Keywords: Latent regression model summary

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Unidimensional latent regression model with fitted IRT model in
##D #            sirt package
##D #############################################################################
##D 
##D library(sirt)
##D data(data.pisaRead, package="sirt")
##D dat <- data.pisaRead$data
##D 
##D items <- grep("R4", colnames(dat), value=TRUE )    # select test items from data
##D # define testlets
##D testlets <- substring( items, 1, 4 )
##D itemcluster <- match( testlets, unique(testlets) )
##D # fit Rasch copula model (only few iterations)
##D mod <- sirt::rasch.copula2( dat[,items], itemcluster=itemcluster, mmliter=5)
##D # extract individual likelihood
##D like1 <- IRT.likelihood( mod )
##D # fit latent regression model in TAM
##D Y <- dat[, c("migra", "hisei", "female") ]
##D mod2 <- TAM::tam.latreg( like1, theta=attr(like1, "theta"), Y=Y, pid=dat$idstud )
##D summary(mod2)
##D # plausible value imputation
##D pv2 <- TAM::tam.pv( mod2 )
##D # create list of imputed datasets
##D Y <- dat[, c("idstud", "idschool", "female", "hisei", "migra") ]
##D pvnames <- c("PVREAD")
##D datlist <- TAM::tampv2datalist( pv2, pvnames=pvnames, Y=Y, Y.pid="idstud")
##D 
##D #--- fit some models
##D library(mice)
##D library(miceadds)
##D # convert data list into a mice object
##D mids1 <- miceadds::datalist2mids( datlist )
##D # perform an ANOVA
##D mod3a <- with( mids1, stats::lm(PVREAD ~ hisei*migra) )
##D summary( pool( mod3a ))
##D mod3b <- miceadds::mi.anova( mids1, "PVREAD ~ hisei*migra" )
##D 
##D #############################################################################
##D # EXAMPLE 2: data.pisaRead - fitted IRT model in mirt package
##D #############################################################################
##D 
##D library(sirt)
##D library(mirt)
##D 
##D data(data.pisaRead, package="sirt")
##D dat <- data.pisaRead$data
##D 
##D # define dataset with item responses
##D items <- grep("R4", colnames(dat), value=TRUE )
##D resp <- dat[,items]
##D # define dataset with covariates
##D X <- dat[, c("female","hisei","migra") ]
##D 
##D # fit 2PL model in mirt
##D mod <- mirt::mirt( resp, 1, itemtype="2PL", verbose=TRUE)
##D print(mod)
##D # extract coefficients
##D sirt::mirt.wrapper.coef(mod)
##D 
##D # extract likelihood
##D like <- IRT.likelihood(mod)
##D str(like)
##D 
##D # fit latent regression model in TAM
##D mod2 <- TAM::tam.latreg( like, Y=X, pid=dat$idstud )
##D summary(mod2)
##D # plausible value imputation
##D pv2 <- TAM::tam.pv( mod2, samp.regr=TRUE, nplausible=5 )
##D # create list of imputed datasets
##D X <- dat[, c("idstud", "idschool", "female", "hisei", "migra") ]
##D pvnames <- c("PVREAD")
##D datlist <- TAM::tampv2datalist( pv2, pvnames=pvnames, Y=X, Y.pid="idstud")
##D str(datlist)
##D 
##D # regression using semTools package
##D library(semTools)
##D lavmodel <- "
##D    PVREAD ~ hisei + female
##D            "
##D mod1a <- semTools::sem.mi( lavmodel, datlist)
##D summary(mod1a, standardized=TRUE, rsquare=TRUE)
##D 
##D #############################################################################
##D # EXAMPLE 3: data.Students - fitted confirmatory factor analysis in lavaan
##D #############################################################################
##D 
##D library(CDM)
##D library(sirt)
##D library(lavaan)
##D 
##D data(data.Students, package="CDM")
##D dat <- data.Students
##D vars <- scan(what="character", nlines=1)
##D    urban female sc1 sc2 sc3 sc4 mj1 mj2 mj3 mj4
##D dat <- dat[, vars]
##D dat <- na.omit(dat)
##D 
##D # fit confirmatory factor analysis in lavaan
##D lavmodel <- "
##D    SC=~ sc1__sc4
##D    SC ~~ 1*SC
##D    MJ=~ mj1__mj4
##D    MJ ~~ 1*MJ
##D    SC ~~ MJ
##D         "
##D # process lavaan syntax
##D res <- TAM::lavaanify.IRT( lavmodel, dat )
##D # fit lavaan CFA model
##D mod1 <- lavaan::cfa( res$lavaan.syntax, dat, std.lv=TRUE)
##D summary(mod1, standardized=TRUE, fit.measures=TRUE )
##D # extract likelihood
##D like1 <- TAM::IRTLikelihood.cfa( dat, mod1 )
##D str(like1)
##D # fit latent regression model in TAM
##D X <- dat[, c("urban","female") ]
##D mod2 <- TAM::tam.latreg( like1, Y=X  )
##D summary(mod2)
##D # plausible value imputation
##D pv2 <- TAM::tam.pv( mod2, samp.regr=TRUE, normal.approx=TRUE )
##D # create list of imputed datasets
##D Y <- dat[, c("urban", "female" ) ]
##D pvnames <- c("PVSC", "PVMJ")
##D datlist <- TAM::tampv2datalist( pv2, pvnames=pvnames, Y=Y )
##D str(datlist)
## End(Not run)



