library(intubate)


### Name: Hmisc
### Title: Interfaces for Hmisc package for data science pipelines.
### Aliases: ntbt_areg.boot ntbt_aregImpute ntbt_biVar ntbt_bpplotM
###   ntbt_dataRep ntbt_describe ntbt_Dotplot ntbt_Ecdf
###   ntbt_fit.mult.impute ntbt_nobsY ntbt_rcorrcens ntbt_redun
###   ntbt_summary ntbt_summaryD ntbt_summaryM ntbt_summaryP ntbt_summaryRc
###   ntbt_summaryS ntbt_transcan ntbt_varclus ntbt_xYplot
### Keywords: intubate magrittr Hmisc areg.boot aregImpute biVar bpplotM
###   dataRep describe Dotplot Ecdf fit.mult.impute nobsY rcorrcens redun
###   summary summaryD summaryM summaryP summaryRc summaryS transcan
###   varclus xYplot

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(Hmisc)
##D 
##D ## ntbt_areg.boot
##D set.seed(171)  # to be able to reproduce example
##D x1 <- rnorm(200)
##D x2 <- runif(200)  # a variable that is really unrelated to y]
##D x3 <- factor(sample(c('cat','dog','cow'), 200,TRUE))  # also unrelated to y
##D y  <- exp(x1 + rnorm(200)/3)
##D 
##D data <- data.frame(y, x1, x2, x3)
##D 
##D ## Original function to interface
##D f  <- areg.boot(y ~ x1 + x2 + x3, data, B = 40)
##D plot(f)
##D 
##D ## The interface puts data as first parameter
##D f  <- ntbt_areg.boot(data, y ~ x1 + x2 + x3, B = 40)
##D plot(f)
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_areg.boot(y ~ x1 + x2 + x3, B = 40) %>%
##D   plot()
##D 
##D 
##D ## ntbt_aregImpute
##D x1 <- factor(sample(c('a','b','c'),1000,TRUE))
##D x2 <- (x1=='b') + 3*(x1=='c') + rnorm(1000,0,2)
##D x3 <- rnorm(1000)
##D y  <- x2 + 1*(x1=='c') + .2*x3 + rnorm(1000,0,2)
##D orig.x1 <- x1[1:250]
##D orig.x2 <- x2[251:350]
##D x1[1:250] <- NA
##D x2[251:350] <- NA
##D d <- data.frame(x1, x2, x3, y)
##D 
##D ## Original function to interface
##D # Find value of nk that yields best validating imputation models
##D # tlinear=FALSE means to not force the target variable to be linear
##D f <- aregImpute(~y + x1 + x2 + x3, nk=c(0,3:5), tlinear=FALSE,
##D                 data=d, B=10) # normally B=75
##D plot(f)
##D ## The interface puts data as first parameter
##D f <- ntbt_aregImpute(d, ~y + x1 + x2 + x3, nk=c(0,3:5), tlinear=FALSE, B=10)
##D plot(f)
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_aregImpute(~y + x1 + x2 + x3, nk=c(0,3:5), tlinear=FALSE, B=10) %>%
##D   plot()
##D 
##D 
##D ## biVar
##D ## NOTE: not seen any working example.
##D ## I am too lazy (ignorant, really...) to produce one.
##D ## Please contribute.
##D 
##D ## Original function to interface
##D ## The interface puts data as first parameter
##D ## so it can be used easily in a pipeline.
##D 
##D 
##D ## ntbt_bpplotM
##D set.seed(1)
##D n <- 800
##D d <- data.frame(treatment = sample(c('a','b'), n, TRUE),
##D                 sex = sample(c('female','male'), n, TRUE),
##D                 age = rnorm(n, 40, 10),
##D                 bp = rnorm(n, 120, 12),
##D                 wt = rnorm(n, 190, 30))
##D label(d$bp) <- 'Systolic Blood Pressure'
##D units(d$bp) <- 'mmHg'
##D 
##D ## Original function to interface
##D bpplotM(age + bp + wt ~ treatment * sex, data=d, violin = TRUE,
##D         violin.opts = list(col = adjustcolor('blue', alpha.f = .15),
##D                            border = FALSE))
##D 
##D ## The interface puts data as first parameter
##D ntbt_bpplotM(d, age + bp + wt ~ treatment * sex, violin = TRUE,
##D              violin.opts = list(col = adjustcolor('blue', alpha.f= .15),
##D                                 border = FALSE))
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_bpplotM(age + bp + wt ~ treatment * sex, violin = TRUE,
##D                violin.opts = list(col = adjustcolor('blue', alpha.f= .15),
##D                                   border = FALSE))
##D 
##D 
##D ## dataRep
##D set.seed(13)
##D num.symptoms <- sample(1:4, 1000,TRUE)
##D sex <- factor(sample(c('female','male'), 1000,TRUE))
##D x    <- runif(1000)
##D x[1] <- NA
##D table(num.symptoms, sex, .25*round(x/.25))
##D data <- data.frame(num.symptoms, sex, x)
##D 
##D ## Original function to interface
##D d <- dataRep(~ num.symptoms + sex + roundN(x, .25), data)
##D print(d, long = TRUE)
##D 
##D ## The interface puts data as first parameter
##D d <- ntbt_dataRep(data, ~ num.symptoms + sex + roundN(x, .25))
##D print(d, long = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_dataRep(~ num.symptoms + sex + roundN(x, .25)) %>%
##D   print(long = TRUE)
##D 
##D 
##D ## ntbt_describe
##D ## Original function to interface
##D describe(~ conc + Type, data = CO2)
##D 
##D ## The interface puts data as first parameter
##D ntbt_describe(CO2, ~ conc + Type)
##D 
##D ## so it can be used easily in a pipeline.
##D CO2 %>%
##D   ntbt_describe(~ conc + Type)
##D 
##D 
##D ## ntbt_Dotplot
##D set.seed(111)
##D dfr <- expand.grid(month=1:12, year=c(1997,1998), reps=1:100)
##D month <- dfr$month; year <- dfr$year
##D y <- abs(month-6.5) + 2*runif(length(month)) + year-1997
##D s <- summarize(y, llist(month,year), smedian.hilow, conf.int=.5) 
##D 
##D ## Original function to interface
##D Dotplot(month ~ Cbind(y, Lower, Upper) | year, data = s) 
##D 
##D ## The interface puts data as first parameter
##D ntbt_Dotplot(s, month ~ Cbind(y, Lower, Upper) | year) 
##D 
##D ## so it can be used easily in a pipeline.
##D s %>%
##D   ntbt_Dotplot(month ~ Cbind(y, Lower, Upper) | year) 
##D 
##D 
##D ## ntbt_Ecdf
##D set.seed(135)
##D m <- data.frame(ch = rnorm(1000, 200, 40),
##D                 pre.test = rnorm(100,50,10),
##D                 post.test = rnorm(100,55,10),
##D                 sex = sample(c('male','female'),100,TRUE),
##D                 region = factor(sample(c('Europe','USA','Australia'),100,TRUE)),
##D                 year = factor(sample(2001:2002,1000,TRUE)))
##D 
##D ## Original function to interface
##D Ecdf(~ ch | region * year, groups = sex, m)
##D 
##D ## The interface puts data as first parameter
##D ntbt_Ecdf(m, ~ ch | region * year, groups = sex)
##D 
##D ## so it can be used easily in a pipeline.
##D m %>%
##D   ntbt_Ecdf(~ ch | region * year, groups = sex)
##D 
##D 
##D ## ntbt_nobsY
##D d <- expand.grid(sex=c('female', 'male', NA),
##D                  country=c('US', 'Romania'),
##D                  reps=1:2)
##D d$subject.id <- c(0, 0, 3:12)
##D dm <- addMarginal(d, sex, country)
##D 
##D ## Original function to interface
##D nobsY(sex + country ~ id(subject.id) + reps, group = 'reps', data = d)
##D 
##D ## The interface puts data as first parameter
##D ntbt_nobsY(d, sex + country ~ id(subject.id) + reps, group = 'reps')
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_nobsY(sex + country ~ id(subject.id) + reps, group = 'reps')
##D 
##D 
##D ## ntbt_rcorrcens
##D set.seed(1)
##D x <- round(rnorm(200))
##D y <- rnorm(200)
##D rcorr.cens(x, y, outx=TRUE)   # can correlate non-censored variables
##D library(survival)
##D age <- rnorm(400, 50, 10)
##D bp  <- rnorm(400,120, 15)
##D bp[1]  <- NA
##D d.time <- rexp(400)
##D cens   <- runif(400,.5,2)
##D death  <- d.time <= cens
##D d.time <- pmin(d.time, cens)
##D data <- data.frame(d.time, death, age, bp)
##D 
##D ## Original function to interface
##D r <- rcorrcens(Surv(d.time, death) ~ age + bp, data = data)
##D plot(r)
##D 
##D ## The interface puts data as first parameter
##D r <- ntbt_rcorrcens(data, Surv(d.time, death) ~ age + bp)
##D plot(r)
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_rcorrcens(Surv(d.time, death) ~ age + bp) %>%
##D   plot()
##D 
##D 
##D ## ntbt_redun
##D set.seed(1)
##D n <- 100
##D x1 <- runif(n)
##D x2 <- runif(n)
##D x3 <- x1 + x2 + runif(n) / 10
##D x4 <- x1 + x2 + x3 + runif(n) / 10
##D x5 <- factor(sample(c('a','b','c'), n, replace = TRUE))
##D x6 <- 1 * (x5 == 'a' | x5 == 'c')
##D data <- data.frame(x1, x2, x3, x4, x5, x6)
##D   
##D ## Original function to interface
##D redun(~ x1 + x2 + x3 + x4 + x5 + x6, data, r2 = .8, allcat = TRUE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_redun(data, ~ x1 + x2 + x3 + x4 + x5 + x6, r2 = .8, allcat = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_redun(~ x1 + x2 + x3 + x4 + x5 + x6, r2 = .8, allcat = TRUE)
##D 
##D 
##D ## ntbt_summary
##D options(digits=3)
##D set.seed(173)
##D sex <- factor(sample(c("m","f"), 500, rep=TRUE))
##D age <- rnorm(500, 50, 5)
##D treatment <- factor(sample(c("Drug","Placebo"), 500, rep=TRUE))
##D # Generate a 3-choice variable; each of 3 variables has 5 possible levels
##D symp <- c('Headache', 'Stomach Ache', 'Hangnail',
##D           'Muscle Ache', 'Depressed')
##D symptom1 <- sample(symp, 500,TRUE)
##D symptom2 <- sample(symp, 500,TRUE)
##D symptom3 <- sample(symp, 500,TRUE)
##D Symptoms <- mChoice(symptom1, symptom2, symptom3, label='Primary Symptoms')
##D data <- data.frame(sex, age, treatment, Symptoms)
##D 
##D ## Original function to interface
##D summary(sex ~ treatment + Symptoms, data, fun = table)
##D summary(age ~ sex + treatment + Symptoms, data)
##D 
##D ## The interface puts data as first parameter
##D ntbt_summary(data, sex ~ treatment + Symptoms, fun = table)
##D ntbt_summary(data, age ~ sex + treatment + Symptoms)
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_summary(sex ~ treatment + Symptoms, fun = table)
##D data %>%
##D   ntbt_summary(age ~ sex + treatment + Symptoms)
##D 
##D 
##D ## ntbt_summaryD
##D set.seed(135)
##D maj <- factor(c(rep('North',13),rep('South',13)))
##D g <- paste('Category',rep(letters[1:13],2))
##D y1 <- runif(26)
##D data <- data.frame(maj, g, y1)
##D 
##D ## Original function to interface
##D summaryD(y1 ~ maj + g, xlab='Mean', data)
##D 
##D ## The interface puts data as first parameter
##D ntbt_summaryD(data, y1 ~ maj + g, xlab='Mean')
##D 
##D ## so it can be used easily in a pipeline.
##D par(mfrow=c(1,1))
##D data %>%
##D   ntbt_summaryD(y1 ~ maj + g, xlab='Mean')
##D 
##D 
##D ## ntbt_summaryM
##D options(digits=3)
##D set.seed(173)
##D sex <- factor(sample(c("m","f"), 500, rep=TRUE))
##D country <- factor(sample(c('US', 'Canada'), 500, rep=TRUE))
##D age <- rnorm(500, 50, 5)
##D sbp <- rnorm(500, 120, 12)
##D label(sbp) <- 'Systolic BP'
##D units(sbp) <- 'mmHg'
##D treatment <- factor(sample(c("Drug","Placebo"), 500, rep=TRUE))
##D treatment[1]
##D sbp[1] <- NA
##D 
##D # Generate a 3-choice variable; each of 3 variables has 5 possible levels
##D symp <- c('Headache','Stomach Ache','Hangnail',
##D           'Muscle Ache','Depressed')
##D symptom1 <- sample(symp, 500,TRUE)
##D symptom2 <- sample(symp, 500,TRUE)
##D symptom3 <- sample(symp, 500,TRUE)
##D Symptoms <- mChoice(symptom1, symptom2, symptom3, label='Primary Symptoms')
##D data <- data.frame(age, sex, sbp, Symptoms, treatment)
##D # Note: In this example, some subjects have the same symptom checked
##D # multiple times; in practice these redundant selections would be NAs
##D # mChoice will ignore these redundant selections
##D 
##D ## Original function to interface
##D f <- summaryM(age + sex + sbp + Symptoms ~ treatment, data = data, test = TRUE)
##D print(f, long = TRUE)
##D 
##D ## The interface puts data as first parameter
##D f <- ntbt_summaryM(data, age + sex + sbp + Symptoms ~ treatment, test = TRUE)
##D print(f, long = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_summaryM(age + sex + sbp + Symptoms ~ treatment, test = TRUE) %>%
##D   print(long = TRUE)
##D 
##D 
##D ## ntbt_summaryP
##D n <- 100
##D f <- function(na=FALSE) {
##D   x <- sample(c('N', 'Y'), n, TRUE)
##D   if(na) x[runif(100) < .1] <- NA
##D   x
##D }
##D set.seed(1)
##D d <- data.frame(x1=f(), x2=f(), x3=f(), x4=f(), x5=f(), x6=f(), x7=f(TRUE),
##D                 age=rnorm(n, 50, 10),
##D                 race=sample(c('Asian', 'Black/AA', 'White'), n, TRUE),
##D                 sex=sample(c('Female', 'Male'), n, TRUE),
##D                 treat=sample(c('A', 'B'), n, TRUE),
##D                 region=sample(c('North America','Europe'), n, TRUE))
##D d <- upData(d, labels=c(x1='MI', x2='Stroke', x3='AKI', x4='Migraines',
##D                  x5='Pregnant', x6='Other event', x7='MD withdrawal',
##D                  race='Race', sex='Sex'))
##D 
##D ## Original function to interface
##D s <- summaryP(race + sex + ynbind(x1, x2, x3, x4, x5, x6, x7, label = 'Exclusions') ~
##D                 region + treat, data=d)
##D plot(s, groups = 'treat')
##D 
##D ## The interface puts data as first parameter
##D s <- ntbt_summaryP(d, race + sex + ynbind(x1, x2, x3, x4, x5, x6, x7, label = 'Exclusions') ~
##D                      region + treat)
##D plot(s, groups = 'treat')
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_summaryP(race + sex + ynbind(x1, x2, x3, x4, x5, x6, x7, label = 'Exclusions') ~
##D                   region + treat) %>%
##D   plot(groups = 'treat')
##D 
##D 
##D ## ntbt_summaryRc
##D options(digits=3)
##D set.seed(177)
##D sex <- factor(sample(c("m","f"), 500, rep=TRUE))
##D age <- rnorm(500, 50, 5)
##D bp  <- rnorm(500, 120, 7)
##D units(age) <- 'Years'; units(bp) <- 'mmHg'
##D label(bp) <- 'Systolic Blood Pressure'
##D L <- .5*(sex == 'm') + 0.1 * (age - 50)
##D y <- rbinom(500, 1, plogis(L))
##D data <- data.frame(y, age, bp, sex)
##D par(mfrow=c(1,2))
##D 
##D ## Original function to interface
##D summaryRc(y ~ age + bp + stratify(sex), data,
##D           label.curves = list(keys = 'lines'), nloc = list(x = .1, y = .05))
##D 
##D ## The interface puts data as first parameter
##D ntbt_summaryRc(data, y ~ age + bp + stratify(sex),
##D                label.curves = list(keys = 'lines'), nloc = list(x = .1, y = .05))
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_summaryRc(y ~ age + bp + stratify(sex),
##D                  label.curves = list(keys = 'lines'), nloc = list(x = .1, y = .05))
##D 
##D 
##D ## ntbt_summaryS
##D set.seed(1)
##D d <- data.frame(sbp=rnorm(n, 120, 10),
##D                 dbp=rnorm(n, 80, 10),
##D                 age=rnorm(n, 50, 10),
##D                 days=sample(1:n, n, TRUE),
##D                 S1=Surv(2*runif(n)), S2=Surv(runif(n)),
##D                 race=sample(c('Asian', 'Black/AA', 'White'), n, TRUE),
##D                 sex=sample(c('Female', 'Male'), n, TRUE),
##D                 treat=sample(c('A', 'B'), n, TRUE),
##D                 region=sample(c('North America','Europe'), n, TRUE),
##D                 meda=sample(0:1, n, TRUE), medb=sample(0:1, n, TRUE))
##D 
##D d <- upData(d, labels=c(sbp='Systolic BP', dbp='Diastolic BP',
##D             race='Race', sex='Sex', treat='Treatment',
##D             days='Time Since Randomization',
##D             S1='Hospitalization', S2='Re-Operation',
##D             meda='Medication A', medb='Medication B'),
##D             units=c(sbp='mmHg', dbp='mmHg', age='Year', days='Days'))
##D 
##D ## Original function to interface
##D s <- summaryS(age + sbp + dbp ~ days + region + treat,  data = d)
##D plot(s, groups = 'treat', panel = panel.loess, key = list(space = 'bottom', columns = 2),
##D      datadensity = TRUE, scat1d.opts = list(lwd = .5))
##D 
##D ## The interface puts data as first parameter
##D s <- ntbt_summaryS(d, age + sbp + dbp ~ days + region + treat)
##D plot(s, groups = 'treat', panel = panel.loess, key = list(space = 'bottom', columns = 2),
##D      datadensity = TRUE, scat1d.opts = list(lwd = .5))
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_summaryS(age + sbp + dbp ~ days + region + treat) %>%
##D   plot(groups = 'treat', panel = panel.loess, key = list(space = 'bottom', columns = 2),
##D        datadensity = TRUE, scat1d.opts = list(lwd = .5))
##D 
##D 
##D ## ntbt_transcan, ntbt_fit.mult.impute
##D set.seed(1)
##D x1 <- factor(sample(c('a','b','c'),100,TRUE))
##D x2 <- (x1=='b') + 3*(x1=='c') + rnorm(100)
##D y  <- x2 + 1*(x1=='c') + rnorm(100)
##D x1[1:20] <- NA
##D x2[18:23] <- NA
##D d4 <- data.frame(x1,x2,y)
##D 
##D options(digits = 3)
##D 
##D ## Original function to interface
##D f  <- transcan(~y + x1 + x2, n.impute = 10, shrink = TRUE, data = d4)
##D summary(f)
##D h <- fit.mult.impute(y ~ x1 + x2, lm, f, data = d4)
##D summary(h)
##D 
##D ## The interface puts data as first parameter
##D f  <- ntbt_transcan(d4, ~y + x1 + x2, n.impute = 10, shrink = TRUE)
##D summary(f)
##D h <- ntbt_fit.mult.impute(d4, y ~ x1 + x2, lm, f)
##D summary(h)
##D 
##D ## so it can be used easily in a pipeline.
##D d4 %>%
##D   ntbt_transcan(~y + x1 + x2, n.impute = 10, shrink = TRUE) %>%
##D   summary()
##D 
##D d4 %>%
##D   ntbt_fit.mult.impute(y ~ x1 + x2, lm, f) %>%
##D   summary()
##D 
##D 
##D ## ntbt_varclus
##D set.seed(1)
##D x1 <- rnorm(200)
##D x2 <- rnorm(200)
##D x3 <- x1 + x2 + rnorm(200)
##D x4 <- x2 + rnorm(200)
##D data <- data.frame(x1, x2, x3, x4)
##D 
##D par(mfrow = c(1,1))
##D 
##D ## Original function to interface
##D v <- varclus(~ x1 + x2 + x3 + x4, similarity = "spearman", data = data )
##D plot(v)
##D 
##D ## The interface puts data as first parameter
##D v <- ntbt_varclus(data, ~ x1 + x2 + x3 + x4, similarity = "spearman")
##D plot(v)
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_varclus(~ x1 + x2 + x3 + x4, similarity = "spearman") %>%
##D   plot()
##D 
##D 
##D ## ntbt_xYplot
##D d <- expand.grid(x = seq(0, 2 * pi, length=150), p = 1:3, shift = c(0, pi)) 
##D 
##D ## Original function to interface
##D xYplot(sin(x + shift)^p ~ x | shift, groups = p, data = d, type = 'l')
##D 
##D ## The interface puts data as first parameter
##D ntbt_xYplot(d, sin(x + shift)^p ~ x | shift, groups = p, type = 'l')
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_xYplot(sin(x + shift)^p ~ x | shift, groups = p, type = 'l')
## End(Not run)



