library(intubate)


### Name: nlme
### Title: Interfaces for nlme package for data science pipelines.
### Aliases: ntbt_gls ntbt_lme ntbt_lmList ntbt_nlme ntbt_nlsList
### Keywords: intubate magrittr gls lme lmList nlme nlsList

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(nlme)
##D 
##D ## gls
##D ## Original function to interface
##D fm1 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary,
##D            correlation = corAR1(form = ~ 1 | Mare))
##D summary(fm1)
##D 
##D ## The interface reverses the order of data and formula
##D fm1 <- ntbt_gls(Ovary, follicles ~ sin(2*pi*Time) + cos(2*pi*Time),
##D                 correlation = corAR1(form = ~ 1 | Mare))
##D summary(fm1)
##D 
##D ## so it can be used easily in a pipeline.
##D Ovary %>%
##D   ntbt_gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time),
##D                 correlation = corAR1(form = ~ 1 | Mare))  %>%
##D   summary()
##D   
##D ## nlme
##D ## Original function to interface
##D lme(distance ~ age, data = Orthodont) # random is ~ age
##D lme(distance ~ age + Sex, data = Orthodont, random = ~ 1)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_lme(data = Orthodont, distance ~ age) # random is ~ age
##D ntbt_lme(data = Orthodont, distance ~ age + Sex, random = ~ 1)
##D 
##D ## so it can be used easily in a pipeline.
##D Orthodont %>%
##D   ntbt_lme(distance ~ age) # random is ~ age
##D Orthodont %>%
##D   ntbt_lme(distance ~ age + Sex, random = ~ 1)
##D 
##D ## lmList
##D ## Original function to interface
##D lmList(distance ~ age | Subject, Orthodont)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_lmList(Orthodont, distance ~ age | Subject)
##D 
##D ## so it can be used easily in a pipeline.
##D Orthodont %>%
##D   ntbt_lmList(distance ~ age | Subject)
##D   
##D Orthodont %>%
##D   ntbt_lmList(distance ~ age | Subject) %>%
##D   summary()
##D 
##D ## nlme
##D ## Original function to interface
##D fm1 <- nlme(height ~ SSasymp(age, Asym, R0, lrc),
##D             data = Loblolly,
##D             fixed = Asym + R0 + lrc ~ 1,
##D             random = Asym ~ 1,
##D             start = c(Asym = 103, R0 = -8.5, lrc = -3.3))
##D summary(fm1)
##D 
##D ## The interface reverses the order of data and formula
##D fm1 <- ntbt_nlme(data = Loblolly,
##D                  height ~ SSasymp(age, Asym, R0, lrc),
##D                  fixed = Asym + R0 + lrc ~ 1,
##D                  random = Asym ~ 1,
##D                  start = c(Asym = 103, R0 = -8.5, lrc = -3.3))
##D summary(fm1)
##D 
##D ## so it can be used easily in a pipeline.
##D Loblolly %>%
##D   ntbt_nlme(height ~ SSasymp(age, Asym, R0, lrc),
##D             fixed = Asym + R0 + lrc ~ 1,
##D             random = Asym ~ 1,
##D             start = c(Asym = 103, R0 = -8.5, lrc = -3.3)) %>%
##D   summary()
## End(Not run)



