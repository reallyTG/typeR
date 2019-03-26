library(np)


### Name: npconmode
### Title: Kernel Modal Regression with Mixed Data Types
### Aliases: npconmode npconmode.call npconmode.default npconmode.formula
###   npconmode.conbandwidth
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we use the
##D # birthweight data taken from the MASS library, and compute a parametric
##D # logit model and a nonparametric conditional mode model. We then
##D # compare their confusion matrices and summary measures of
##D # classification ability.
##D 
##D library("MASS")
##D data("birthwt")
##D attach(birthwt)
##D 
##D # Fit a parametric logit model with low (0/1) as the dependent
##D # variable and age, lwt, and smoke (0/1) as the covariates
##D 
##D # From ?birthwt
##D # 'low' indicator of birth weight less than 2.5kg
##D # 'smoke' smoking status during pregnancy
##D # 'race' mother's race ('1' = white, '2' = black, '3' = other)
##D # 'ht' history of hypertension
##D # 'ui' presence of uterine irritability
##D # 'ftv' number of physician visits during the first trimester
##D # 'age' mother's age in years
##D # 'lwt' mother's weight in pounds at last menstrual period
##D 
##D model.logit <- glm(low~factor(smoke)+
##D                    factor(race)+
##D                    factor(ht)+
##D                    factor(ui)+
##D                    ordered(ftv)+
##D                    age+
##D                    lwt, 
##D                    family=binomial(link=logit))
##D 
##D # Generate the confusion matrix and correct classification ratio
##D 
##D cm <- table(low, ifelse(fitted(model.logit)>0.5, 1, 0))
##D ccr <- sum(diag(cm))/sum(cm)
##D 
##D # Now do the same with a nonparametric model.  Note - this may take a
##D # few minutes depending on the speed of your computer... 
##D 
##D bw <- npcdensbw(formula=factor(low)~factor(smoke)+
##D                 factor(race)+
##D                 factor(ht)+
##D                 factor(ui)+
##D                 ordered(ftv)+
##D                 age+
##D                 lwt)
##D 
##D model.np <- npconmode(bws=bw)
##D 
##D # Compare confusion matrices from the logit and nonparametric model
##D 
##D # Logit
##D 
##D cm
##D ccr
##D 
##D # Nonparametric
##D summary(model.np)
##D 
##D detach(birthwt)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): For this example, we use the
##D # birthweight data taken from the MASS library, and compute a parametric
##D # logit model and a nonparametric conditional mode model. We then
##D # compare their confusion matrices and summary measures of
##D # classification ability.
##D 
##D library("MASS")
##D data("birthwt")
##D attach(birthwt)
##D 
##D # Fit a parametric logit model with low (0/1) as the dependent
##D # variable and age, lwt, and smoke (0/1) as the covariates
##D 
##D # From ?birthwt
##D # 'low' indicator of birth weight less than 2.5kg
##D # 'smoke' smoking status during pregnancy
##D # 'race' mother's race ('1' = white, '2' = black, '3' = other)
##D # 'ht' history of hypertension
##D # 'ui' presence of uterine irritability
##D # 'ftv' number of physician visits during the first trimester
##D # 'age' mother's age in years
##D # 'lwt' mother's weight in pounds at last menstrual period
##D 
##D model.logit <- glm(low~factor(smoke)+
##D                    factor(race)+
##D                    factor(ht)+
##D                    factor(ui)+
##D                    ordered(ftv)+
##D                    age+
##D                    lwt, 
##D                    family=binomial(link=logit))
##D 
##D # Generate the confusion matrix and correct classification ratio
##D 
##D cm <- table(low, ifelse(fitted(model.logit)>0.5, 1, 0))
##D ccr <- sum(diag(cm))/sum(cm)
##D 
##D # Now do the same with a nonparametric model...
##D 
##D X <- data.frame(factor(smoke), 
##D                 factor(race), 
##D                 factor(ht), 
##D                 factor(ui), 
##D                 ordered(ftv), 
##D                 age, 
##D                 lwt)
##D 
##D y <- factor(low)
##D 
##D # Note - this may take a few minutes depending on the speed of your
##D # computer... 
##D 
##D bw <- npcdensbw(xdat=X, ydat=y)
##D 
##D model.np <- npconmode(bws=bw)
##D 
##D # Compare confusion matrices from the logit and nonparametric model
##D 
##D # Logit
##D 
##D cm
##D ccr
##D 
##D # Nonparametric
##D summary(model.np)
##D 
##D detach(birthwt)
## End(Not run) 



