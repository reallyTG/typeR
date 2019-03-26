library(MplusAutomation)


### Name: mplusModeler
### Title: Create, run, and read Mplus models.
### Aliases: mplusModeler

### ** Examples

## Not run: 
##D # minimal example of a model using builtin data, allowing R
##D # to automatically guess the correct variables to use
##D test <- mplusObject(MODEL = "mpg ON wt hp;
##D   wt WITH hp;", rdata = mtcars)
##D 
##D  # estimate the model in Mplus and read results back into R
##D  res <- mplusModeler(test, modelout = "model1.inp", run = 1L)
##D 
##D  # when forcing writeData = "always" data gets overwritten (with a warning)
##D  resb <- mplusModeler(test, modelout = "model1.inp", run = 1L,
##D                       writeData = "always")
##D 
##D  # using writeData = "ifmissing", the default, no data re-written
##D  resc <- mplusModeler(test, modelout = "model1.inp", run = 1L)
##D 
##D  # using writeData = "ifmissing", the default, data ARE written
##D  # if data changes
##D  test <- mplusObject(MODEL = "mpg ON wt hp;
##D    wt WITH hp;", rdata = mtcars[-10, ])
##D  resd <- mplusModeler(test, modelout = "model1.inp", run = 1L)
##D 
##D  # show summary
##D  summary(resd)
##D 
##D  # show coefficients
##D  coef(resd)
##D 
##D  # what if you wanted confidence intervals
##D  # and standardized values?
##D  # first update to tell Mplus you want them, re-run and print
##D  test <- update(test, OUTPUT = ~ "CINTERVAL; STDYX;")
##D  resd <- mplusModeler(test, modelout = "model1.inp", run = 1L)
##D 
##D coef(resd)
##D confint(resd)
##D 
##D # now standardized
##D coef(resd, type = "stdyx")
##D confint(resd, type = "stdyx")
##D 
##D # put together in one data frame if desired
##D merge(
##D   coef(resd, type = "stdyx"),
##D   confint(resd, type = "stdyx"),
##D   by = "Label")
##D 
##D  # remove files
##D  unlink(resc$results$input$data$file)
##D  unlink(resd$results$input$data$file)
##D  unlink("model1.inp")
##D  unlink("model1.out")
##D 
##D # simple example of a model using builtin data
##D # demonstrates use with a few more sections
##D test2 <- mplusObject(
##D   TITLE = "test the MplusAutomation Package and mplusModeler wrapper;",
##D   MODEL = "
##D     mpg ON wt hp;
##D     wt WITH hp;",
##D   usevariables = c("mpg", "wt", "hp"),
##D   rdata = mtcars)
##D 
##D  res2 <- mplusModeler(test2, modelout = "model2.inp", run = 1L)
##D 
##D  # remove files
##D  unlink(res2$results$input$data$file)
##D  unlink("model2.inp")
##D  unlink("model2.out")
##D 
##D  # similar example using a robust estimator for standard errors
##D  # and showing how an existing model can be easily updated and reused
##D  test3 <- update(test2, ANALYSIS = ~ "ESTIMATOR = MLR;")
##D 
##D  res3 <- mplusModeler(test3, modelout = "model3.inp", run = 1L)
##D  unlink(res3$results$input$data$file)
##D  unlink("model3.inp")
##D  unlink("model3.out")
##D 
##D  # now use the built in bootstrapping methods
##D  # note that these work, even when Mplus will not bootstrap
##D  # also note how categorical variables and weights are declared
##D  # in particular, the usevariables for Mplus must be specified
##D  # because mroe variables are included in the data than are in the
##D  # model. Note the R usevariables includes all variables for both
##D  # model and weights. The same is true for clustering.
##D  test4 <- mplusObject(
##D    TITLE = "test bootstrapping;",
##D    VARIABLE = "
##D      CATEGORICAL = cyl;
##D      WEIGHT = wt;
##D      USEVARIABLES = cyl mpg;",
##D    ANALYSIS = "ESTIMATOR = MLR;",
##D    MODEL = "
##D      cyl ON mpg;",
##D    usevariables = c("mpg", "wt", "cyl"),
##D    rdata = mtcars)
##D 
##D  res4 <- mplusModeler(test4, "mtcars.dat", modelout = "model4.inp", run = 10L,
##D    hashfilename = FALSE)
##D  # see the results
##D  res4$results$boot
##D 
##D  # remove files
##D  unlink("mtcars.dat")
##D  unlink("model4.inp")
##D  unlink("model4.out")
##D 
##D # Monte Carlo Simulation Example
##D montecarlo <- mplusObject(
##D  TITLE = "Monte Carlo Example;",
##D  MONTECARLO = "
##D   NAMES ARE i1-i5;
##D   NOBSERVATIONS = 100;
##D   NREPS = 100;
##D   SEED = 1234;",
##D  MODELPOPULATION = "
##D   f BY i1-i5*1;
##D   f@1;
##D   i1-i5*1;",
##D  ANALYSIS = "
##D   ESTIMATOR = BAYES;
##D   PROC = 2;
##D   fbiter = 100;",
##D  MODEL = "
##D   f BY i1-i5*.8 (l1-l5);
##D   f@1;
##D   i1-i5*1;",
##D  MODELPRIORS = "
##D    l1-l5 ~ N(.5 .1);",
##D  OUTPUT = "TECH9;")
##D 
##D fitMonteCarlo <- mplusModeler(montecarlo,
##D   modelout = "montecarlo.inp",
##D   run = 1L,
##D   writeData = "always",
##D   hashfilename = FALSE)
##D 
##D unlink("montecarlo.inp")
##D unlink("montecarlo.out")
##D 
##D 
##D # Example including ID variable and extracting factor scores
##D dat <- mtcars
##D dat$UID <- 1:nrow(mtcars)
##D 
##D testIDs <- mplusObject(
##D   TITLE = "test the mplusModeler wrapper with IDs;",
##D   VARIABLE = "IDVARIABLE = UID;",
##D   MODEL = "
##D     F BY mpg wt hp;",
##D   SAVEDATA = "
##D     FILE IS testid_fscores.dat;
##D     SAVE IS fscores;
##D     FORMAT IS free;",
##D   usevariables = c("UID", "mpg", "wt", "hp"),
##D   rdata = dat)
##D 
##D  resIDs <- mplusModeler(testIDs, modelout = "testid.inp", run = 1L)
##D 
##D # view the saved data from Mplus, including factor scores
##D # the indicator variables, and the ID variable we specified
##D head(resIDs$results$savedata)
##D 
##D # merge the factor scores with the rest of the original data
##D # merge together by the ID column
##D dat <- merge(dat, resIDs$results$savedata[, c("F", "UID")],
##D   by = "UID")
##D 
##D # correlate merged factor scores against some other new variable
##D with(dat, cor(F, qsec))
##D 
##D  # remove files
##D  unlink(resIDs$results$input$data$file)
##D  unlink("testid.inp")
##D  unlink("testid.out")
##D  unlink("testid_fscores.dat")
##D  unlink("Mplus Run Models.log")
## End(Not run)



