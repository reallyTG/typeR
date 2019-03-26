library(baytrends)


### Name: gamDiff
### Title: Compute an estimate of difference based on GAM results
### Aliases: gamDiff

### ** Examples

# run analysisOrganizeData function to create the list analySpec
dfr <- analysisOrganizeData (dataCensored, report=NA)
df        <- dfr[["df"]]
analySpec <- dfr[["analySpec"]]

# set GAM models to just one model
analySpec$gamModels <- list(
  list(option=2, name= "Non-linear trend with Seasonality (plus Interactions)",
       model= "~ cyear + s(cyear) + s(doy,bs='cc')+ ti(cyear,doy,bs=c('tp','cc'))", deriv=FALSE))

# run GAM for a single water quality variable, station and layer
gamResult <- gamTest(df, 'tn', 'CB5.4', 'S', analySpec=analySpec)

# use gamDiff to replicate estimates of change calculated in the above
gamDiff(gamRslt=gamResult[["gamOutput2"]]$gamRslt,
        iSpec=gamResult$iSpec, analySpec=analySpec,
        base.yr.set = NA, test.yr.set = NA,
        doy.set = NA, alpha = 0.05)

# use gamDiff to calculate changes from 2005/06 to 2013/14
gamDiff(gamRslt=gamResult[["gamOutput2"]]$gamRslt,
        iSpec=gamResult$iSpec, analySpec=analySpec,
        base.yr.set = c(2004:2005), test.yr.set = c(2013:2014),
        doy.set = NA, alpha = 0.05)




