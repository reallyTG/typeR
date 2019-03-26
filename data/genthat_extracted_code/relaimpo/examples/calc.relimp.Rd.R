library(relaimpo)


### Name: calc.relimp
### Title: Function to calculate relative importance metrics for linear
###   models
### Aliases: calc.relimp calc.relimp.default calc.relimp.formula
###   calc.relimp.lm
### Keywords: multivariate models

### ** Examples

#####################################################################
### Example: relative importance of various socioeconomic indicators 
###          for Fertility in Switzerland
### Fertility is first column of data set swiss
#####################################################################
data(swiss)
    calc.relimp(swiss, 
       type = c("lmg", "last", "first", "betasq", "pratt", "genizi", "car") )
    # calculation of all available relative importance metrics 
        # non-US version offers the additional metric "pmvd", 
        # i.e. call would be 
        # calc.relimp(cov(swiss), 
        # type = c("lmg", "pmvd", "last", "first", "betasq, "pratt"), 
        # rela = TRUE )
    ## same analysis with formula or lm method and a few modified options
    crf <- calc.relimp(Fertility~Agriculture+Examination+Education+Catholic+Infant.Mortality,swiss, 
        subset = Catholic>40,
        type = c("lmg", "last", "first", "betasq", "pratt"), rela = TRUE )
    crf
    linmod <- lm(Fertility~Agriculture+Examination+Education+Catholic+Infant.Mortality,swiss)
    crlm <- calc.relimp(linmod, 
        type = c("lmg", "last", "first", "betasq", "pratt", "genizi", "car"), rela = TRUE )
    plot(crlm)
    # bar plot of the relative importance metrics

    #of statistical interest in this context: correlation matrix
       cor(swiss)

    #demonstration of conditioning on one regressor using always
    calc.relimp(swiss, 
       type = c("lmg", "last", "first", "betasq", "pratt"), rela = FALSE,
       always = "Education" )

    # using calc.relimp with grouping of two regressors
    # and weights (not reasonable here, purely for demo purposes)
    calc.relimp(swiss, 
       type = c("lmg", "last", "first"), rela = FALSE,
       groups = c("Education","Examination"), weights = abs(-23:23) )

    # using calc.relimp with grouping of two regressors
    # and a design object (not reasonable here, purely for demo purposes)
    des <- svydesign(~1, data=swiss, weights=~abs(-23:23))
    calc.relimp(swiss, 
       type = c("lmg", "last", "first"), rela = FALSE,
       groups = c("Education","Examination"), groupnames ="EduExam", design = des)

    # calc.relimp with factors (betasq and pratt not possible)
      # (calc.relimp would not be necessary here, 
      # because the experiment is balanced)
    calc.relimp(1/time~poison+treat,data=poisons, rela = FALSE,
         type = c("lmg", "last", "first"))
    # including also the interaction (lmg possible only)
    calc.relimp(1/time~poison*treat,data=poisons, rela = FALSE)



