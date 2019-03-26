library(gnm)


### Name: Dref
### Title: Specify a Diagonal Reference Term in a gnm Model Formula
### Aliases: Dref DrefWeights
### Keywords: models regression nonlinear

### ** Examples

### Examples from Clifford and Heath paper
### (Results differ slightly - possible transcription error in
### published data?)
set.seed(1)

## reconstruct counts voting Labour/non-Labour
count <- with(voting, percentage/100 * total)
yvar <- cbind(count, voting$total - count)

## fit diagonal reference model with constant weights
classMobility <- gnm(yvar ~ -1 + Dref(origin, destination), 
                     family = binomial, data = voting)
DrefWeights(classMobility)

## create factors indicating movement in and out of salariat (class 1)
upward <- with(voting, origin != 1 & destination == 1)
downward <- with(voting, origin == 1 & destination != 1)

## fit separate weights for the "socially mobile" groups
socialMobility <- gnm(yvar ~ -1 + Dref(origin, destination,
                                       delta = ~ 1 + downward + upward),
                      family = binomial, data = voting)
DrefWeights(socialMobility)

## fit separate weights for downwardly mobile groups only
downwardMobility <- gnm(yvar ~ -1 + Dref(origin, destination,
                                         delta = ~ 1 + downward),
                        family = binomial, data = voting)
DrefWeights(downwardMobility)

## Not run: 
##D 	       
##D ### Examples from Van der Slik paper
##D ### For illustration only - data not publically available
##D ### Using data in data.frame named 'conformity', with variables
##D ### MCFM - mother's conformity score
##D ### FCFF - father's conformity score
##D ### MOPLM - a factor describing the mother's education with 7 levels
##D ### FOPLF - a factor describing the father's education with 7 levels
##D ### AGEM - mother's birth cohort
##D ### MRMM - mother's traditional role model
##D ### FRMF - father's traditional role model
##D ### MWORK - mother's employment
##D ### MFCM - mother's family conflict score
##D ### FFCF - father's family conflict score
##D 
##D set.seed(1)
##D 
##D ## Models for mothers' conformity score as specified in Figure 1
##D A <- gnm(MCFM ~ -1 + AGEM + MRMM + FRMF + MWORK + MFCM + 
##D          Dref(MOPLM, FOPLF), family = gaussian, data = conformity,
##D          verbose = FALSE)
##D A
##D ## Call:
##D ## gnm(formula = MCFM ~ -1 + AGEM + MRMM + FRMF + MWORK + MFCM + 
##D ##     Dref(MOPLM, FOPLF), family = gaussian, data = conformity, 
##D ##     verbose = FALSE)
##D ## 
##D ## Coefficients:
##D ##                     AGEM                      MRMM  
##D ##                  0.06363                  -0.32425  
##D ##                     FRMF                     MWORK  
##D ##                 -0.25324                  -0.06430  
##D ##                     MFCM  Dref(MOPLM, FOPLF)delta1  
##D ##                 -0.06043                  -0.33731  
##D ## Dref(MOPLM, FOPLF)delta2   Dref(., .).MOPLM|FOPLF1  
##D ##                 -0.02505                   4.95121  
##D ##  Dref(., .).MOPLM|FOPLF2   Dref(., .).MOPLM|FOPLF3  
##D ##                  4.86329                   4.86458  
##D ##  Dref(., .).MOPLM|FOPLF4   Dref(., .).MOPLM|FOPLF5  
##D ##                  4.72343                   4.43516  
##D ##  Dref(., .).MOPLM|FOPLF6   Dref(., .).MOPLM|FOPLF7  
##D ##                  4.18873                   4.43378  
##D ## 
##D ## Deviance:            425.3389 
##D ## Pearson chi-squared: 425.3389 
##D ## Residual df:         576    
##D  
##D ## Weights as in Table 4
##D DrefWeights(A)
##D ## Refitting with parameters of first Dref weight constrained to zero
##D ## $MOPLM
##D ##    weight        se
##D ## 0.4225636 0.1439829
##D ## 
##D ## $FOPLF
##D ##    weight        se
##D ## 0.5774364 0.1439829 
##D 
##D F <- gnm(MCFM ~ -1 + AGEM + MRMM + FRMF + MWORK + MFCM + 
##D          Dref(MOPLM, FOPLF, delta = ~1 + MFCM), family = gaussian,
##D          data = conformity, verbose = FALSE)
##D F	 
##D ## Call:
##D ## gnm(formula = MCFM ~ -1 + AGEM + MRMM + FRMF + MWORK + MFCM + 
##D ##     Dref(MOPLM, FOPLF, delta = ~1 + MFCM), family = gaussian, 
##D ##     data = conformity, verbose = FALSE)
##D ## 
##D ## 
##D ## Coefficients:
##D ##                                                     AGEM  
##D ##                                                  0.05818  
##D ##                                                     MRMM  
##D ##                                                 -0.32701  
##D ##                                                     FRMF  
##D ##                                                 -0.25772  
##D ##                                                    MWORK  
##D ##                                                 -0.07847  
##D ##                                                     MFCM  
##D ##                                                 -0.01694  
##D ## Dref(MOPLM, FOPLF, delta = ~ . + MFCM).delta1(Intercept)  
##D ##                                                  1.03515  
##D ##           Dref(MOPLM, FOPLF, delta = ~ 1 + .).delta1MFCM  
##D ##                                                 -1.77756  
##D ## Dref(MOPLM, FOPLF, delta = ~ . + MFCM).delta2(Intercept)  
##D ##                                                 -0.03515  
##D ##           Dref(MOPLM, FOPLF, delta = ~ 1 + .).delta2MFCM  
##D ##                                                  2.77756  
##D ##              Dref(., ., delta = ~ 1 + MFCM).MOPLM|FOPLF1  
##D ##                                                  4.82476  
##D ##              Dref(., ., delta = ~ 1 + MFCM).MOPLM|FOPLF2  
##D ##                                                  4.88066  
##D ##              Dref(., ., delta = ~ 1 + MFCM).MOPLM|FOPLF3  
##D ##                                                  4.83969  
##D ##              Dref(., ., delta = ~ 1 + MFCM).MOPLM|FOPLF4  
##D ##                                                  4.74850  
##D ##              Dref(., ., delta = ~ 1 + MFCM).MOPLM|FOPLF5  
##D ##                                                  4.42020  
##D ##              Dref(., ., delta = ~ 1 + MFCM).MOPLM|FOPLF6  
##D ##                                                  4.17957  
##D ##              Dref(., ., delta = ~ 1 + MFCM).MOPLM|FOPLF7  
##D ##                                                  4.40819  
##D ## 
##D ## Deviance:            420.9022 
##D ## Pearson chi-squared: 420.9022 
##D ## Residual df:         575 
##D ##
##D ##
##D 
##D ## Standard error for MFCM == 1 lower than reported by Van der Slik et al
##D DrefWeights(F)
##D ## Refitting with parameters of first Dref weight constrained to zero
##D ## $MOPLM
##D ##   MFCM     weight        se
##D ## 1    1 0.02974675 0.2277711
##D ## 2    0 0.74465224 0.2006916
##D ## 
##D ## $FOPLF
##D ##   MFCM    weight        se
##D ## 1    1 0.9702532 0.2277711
##D ## 2    0 0.2553478 0.2006916
## End(Not run)



