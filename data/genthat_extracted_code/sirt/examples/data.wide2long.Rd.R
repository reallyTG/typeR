library(sirt)


### Name: data.wide2long
### Title: Converting a Data Frame from Wide Format in a Long Format
### Aliases: data.wide2long
### Keywords: R utilities

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: data.pisaRead
##D #############################################################################
##D miceadds::library_install("lme4")
##D 
##D data(data.pisaRead)
##D dat <- data.pisaRead$data
##D Q <- data.pisaRead$item   # item predictors
##D 
##D # define items
##D items <- colnames(dat)[ substring( colnames(dat), 1, 1 )=="R" ]
##D dat1 <- dat[, c( "idstud", items ) ]
##D # matrix with person predictors
##D X <- dat[, c("idschool", "hisei", "female", "migra") ]
##D 
##D # create dataset in long format
##D dat.long <- sirt::data.wide2long( dat=dat1, id="idstud", X=X, Q=Q )
##D 
##D #***
##D # Model 1: Rasch model
##D mod1 <- lme4::glmer( resp ~ 0 + ( 1 | idstud ) + as.factor(item), data=dat.long,
##D             family="binomial", verbose=TRUE)
##D summary(mod1)
##D 
##D #***
##D # Model 2: Rasch model and inclusion of person predictors
##D mod2 <- lme4::glmer( resp ~ 0 + ( 1 | idstud ) + as.factor(item) + female + hisei + migra,
##D            data=dat.long, family="binomial", verbose=TRUE)
##D summary(mod2)
##D 
##D #***
##D # Model 3: LLTM
##D mod3 <- lme4::glmer(resp ~ (1|idstud) + as.factor(ItemFormat) + as.factor(TextType),
##D             data=dat.long, family="binomial", verbose=TRUE)
##D summary(mod3)
##D 
##D #############################################################################
##D # EXAMPLE 2: Rasch model in lme4
##D #############################################################################
##D 
##D set.seed(765)
##D N <- 1000  # number of persons
##D I <- 10    # number of items
##D b <- seq(-2,2,length=I)
##D dat <- sirt::sim.raschtype( stats::rnorm(N,sd=1.2), b=b )
##D dat.long <- sirt::data.wide2long( dat=dat )
##D #***
##D # estimate Rasch model with lmer
##D library(lme4)
##D mod1 <- lme4::glmer( resp ~ 0 + as.factor( item ) + ( 1 | id_index), data=dat.long,
##D              verbose=TRUE, family="binomial")
##D summary(mod1)
##D   ##   Random effects:
##D   ##    Groups   Name        Variance Std.Dev.
##D   ##    id_index (Intercept) 1.454    1.206
##D   ##   Number of obs: 10000, groups: id_index, 1000
##D   ##
##D   ##   Fixed effects:
##D   ##                        Estimate Std. Error z value Pr(>|z|)
##D   ##   as.factor(item)I0001  2.16365    0.10541  20.527  < 2e-16 ***
##D   ##   as.factor(item)I0002  1.66437    0.09400  17.706  < 2e-16 ***
##D   ##   as.factor(item)I0003  1.21816    0.08700  14.002  < 2e-16 ***
##D   ##   as.factor(item)I0004  0.68611    0.08184   8.383  < 2e-16 ***
##D   ##   [...]
## End(Not run)



