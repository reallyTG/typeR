library(R2MLwiN)


### Name: Formula.translate
### Title: An internal function to translate an R formula into an R list
###   object.
### Aliases: Formula.translate

### ** Examples

## Not run: 
##D # NB: See demo(packge = 'R2MLwiN') for a wider range of examples.
##D library(R2MLwiN)
##D # NOTE: if MLwiN not saved in location R2MLwiN defaults to, specify path via:
##D # options(MLwiN_path = 'path/to/MLwiN vX.XX/')
##D # If using R2MLwiN via WINE, the path may look like this:
##D # options(MLwiN_path = '/home/USERNAME/.wine/drive_c/Program Files (x86)/MLwiN vX.XX/')
##D 
##D # Two-level random intercept model with student (level 1) nested within
##D # school (level 2) and standlrt added to the fixed part.
##D # Importantly, the ordering of school and student reflects their hierarchy,
##D # with the highest level (school) specified first.
##D # E.g. see demo(UserGuide04)
##D data(tutorial, package = 'R2MLwiN')
##D (mymodel1 <- runMLwiN(normexam ~ 1 + standlrt + (1 | school) + (1 | student),
##D                      data = tutorial))
##D 
##D # Adding a random slope
##D (mymodel2 <- runMLwiN(normexam ~ 1 + standlrt + (1 + standlrt | school)
##D                      + (1 | student), data = tutorial))
##D 
##D # Exploring complex level 1 variation
##D # E.g. see demo(UserGuide07)
##D (mymodel3 <- runMLwiN(normexam ~ 1 + standlrt + (1 + standlrt | school)
##D                       + (1 + standlrt | student), data = tutorial))
##D 
##D # Logit link with cons specified as denominator
##D # Note level 1 ID not explicitly specified
##D # E.g. see demo(UserGuide09)
##D data(bang, package = 'R2MLwiN')
##D (mymodel4 <- runMLwiN(logit(use, cons) ~ 1 + lc + age + (1 | district),
##D                       D = 'Binomial', data = bang))
##D 
##D # Mixed response model
##D # Note using MCMC estimation (EstM = 1)
##D # Normal (english) and Bernoulli (behaviour) distributed responses
##D # probit link modelling behaviour with cons as denominator
##D # E.g. see demo(MCMCGuide19)
##D data(jspmix1, package = 'R2MLwiN')
##D (mymodel <- runMLwiN(c(english, probit(behaviour, cons)) ~
##D                      1 + sex + ravens + fluent[1] + (1 | school) + (1[1] | id),
##D                      D = c('Mixed', 'Normal', 'Binomial'),
##D                      estoptions = list(EstM = 1,
##D                      mcmcMeth = list(fixM = 1, residM = 1, Lev1VarM = 1)),
##D                      data = jspmix1))
## End(Not run)




