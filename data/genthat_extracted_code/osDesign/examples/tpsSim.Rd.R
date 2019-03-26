library(osDesign)


### Name: tpsSim
### Title: Simulation function for two-phase study designs.
### Aliases: tpsSim

### ** Examples

##
data(Ohio)

## Design matrix that forms the basis for model and 
## phase I strata specification
##
XM <- cbind(Int=1, Ohio[,1:3])      ## main effects only
XI <- cbind(XM, SbyR=XM[,3]*XM[,4]) ## interaction between sex and race

## 'True' values for the underlying logistic model
##
fitM <- glm(cbind(Death, N-Death) ~ factor(Age) + Sex + Race, data=Ohio,
            family=binomial)
fitI <- glm(cbind(Death, N-Death) ~ factor(Age) + Sex * Race, data=Ohio,
            family=binomial)
##
betaNamesM <- c("Int", "Age1", "Age2", "Sex", "Race")
betaNamesI <- c("Int", "Age1", "Age2", "Sex", "Race", "SexRace")

## Two-phase design stratified by age
##   * sample 50 from each of 6 phase I strata
##   * show primary output (% bias, 95% CP, relative uncertainty)
##
## Not run: 
##D ocAge <- tpsSim(B=1000, betaTruth=fitM$coef, X=XM, N=Ohio$N, strata=2,
##D                 nII0=c(50,50,50), nII1=c(50,50,50), betaNames=betaNamesM,
##D                 monitor=100)
##D ocAge
## End(Not run)

## All possible balanced two-phase designs
##  * 250 controls and 250 cases
##  * only show the relative uncertainty output
##
## Not run: 
##D ocAll <- tpsSim(B=1000, betaTruth=fitM$coef, X=XM, N=Ohio$N, strata=0,
##D                 nII=c(250, 250), betaNames=betaNamesM, monitor=100)
##D ocAll
## End(Not run)

## Two-phase design stratified by race
##  * balanced solely on outcome
##  * only show the relative uncertainty output
##
## Not run: 
##D ocRace <- tpsSim(B=1000, betaTruth=fitI$coef, X=XI, N=Ohio$N, strata=4,
##D                  nII0=c(200, 50), nII1=c(200, 50), betaNames=betaNamesI,
##D                  monitor=100)
##D ocRace
## End(Not run)

## Comparison of two case-control designs
##  * 240 controls and 260 cases
##  * 240 controls and 260 cases
##  * only show the relative uncertainty output
##
## Not run: 
##D ocCC <- tpsSim(B=1000, betaTruth=fitM$coef, X=XM, N=Ohio$N, strata=1,
##D                nII0=240, nII1= 260, ccDesign=c(200,300),
##D                betaNames=betaNamesM, monitor=100)
##D ocCC
## End(Not run)

## Illustration of setting where one of the covariates is continuous
##  * restrict to black and white children born in 2003
##  * dichotomize smoking, mothers age, weight gain during pregnancy and weight weight
##  * note the use of 'etaTerms' to restrict to specific variables 
##    (the majority of which are created)
##  * note the use of 'strata=list(11,12)' to simultaneously investigate stratification by
##     - 11th column in XM: derived 'smoker' variable
##     - 12th column in XM: derived 'teen' variable
##
## Warning: takes a long time!
## Not run: 
##D data(infants)
##D ##
##D infants <- infants[infants$year == 2003,]
##D ##
##D infants$race[!is.element(infants$race, c(1,2))] <- NA  ## White/Black = 0/1
##D infants$race <- infants$race - 1
##D infants <- na.omit(infants)
##D ##
##D infants$smoker  <- as.numeric(infants$cignum > 0)
##D infants$teen    <- as.numeric(infants$mage < 20)
##D infants$lowgain <- as.numeric(infants$gained < 20)
##D infants$lbw     <- as.numeric(infants$weight < 2500)
##D infants$weeks   <- (infants$weeks - 36) / 4              ## estimate a 4-week contrast
##D ##
##D fitM  <- glm(death ~ smoker + teen + race + male + lowgain + lbw + weeks, 
##D data=infants, family=binomial)
##D betaM <- fitM$coef
##D XM    <- cbind(Int=1, infants)
##D etaM  <- c("Int", "smoker", "teen", "race", "male", "lowgain", "lbw", "weeks")
##D ##
##D tpsSim(B=1000, betaTruth=fitM$coef, X=XM, N=rep(1, nrow(XM)), strata=list(11,12),
##D        expand="none", etaTerms=etaM, nII=c(1000,1000),
##D        threshold=c(-20,20), monitor=100)
## End(Not run)



