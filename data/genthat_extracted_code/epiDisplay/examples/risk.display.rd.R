library(epiDisplay)


### Name: Risk.display
### Title: Tables for multivariate odds ratio, incidence density etc
### Aliases: logistic.display clogistic.display cox.display regress.display
###   idr.display mlogit.display ordinal.or.display tableGlm print.display
### Keywords: database

### ** Examples

     model0 <- glm(case ~ induced + spontaneous, family=binomial, data=infert)
     summary(model0)
     logistic.display(model0)

     data(ANCdata)
     glm1 <- glm(death ~ anc + clinic, family=binomial, data=ANCdata)
     logistic.display(glm1)
     logistic.display(glm1, simplified=TRUE)

     library(MASS) # necessary for negative binomial regression
     data(DHF99); .data <- DHF99
     attach(.data)
     model.poisson <- glm(containers ~ education + viltype, 
         family=poisson, data=DHF99)
     
     model.nb <- glm.nb(containers ~ education + viltype, 
         data=.data)
     idr.display(model.poisson)  -> poiss
     print(poiss) # or print.display(poiss) or poiss
     idr.display(model.nb) 
     detach(.data) 
      
     data(VC1to6)
     .data <- VC1to6
     .data$fsmoke <- factor(.data$smoking)
     levels(.data$fsmoke) <- list("no"=0, "yes"=1)
     clr1 <- clogit(case ~ alcohol + fsmoke + strata(matset), data=.data)
     clogistic.display(clr1)
     rm(list=ls())
      
     data(BP)
     .data <- BP
     attach(.data)
     age <- as.numeric(as.Date("2000-01-01") - birthdate)/365.25
     agegr <- pyramid(age,sex, bin=20)$ageGroup
     .data$hypertension <- sbp >= 140 | dbp >=90
     detach(.data)
     model1 <- glm(hypertension ~ sex + agegr + saltadd, family=binomial, 
               data=.data)
     logistic.display(model1) -> table3
     attributes(table3)
     table3
     table3$table
     # You may want to save table3 into a spreadsheet
     write.csv(table3$table, file="table3.csv") # Note $table
     ## Have a look at this file in Excel, or similar spreadsheet program
     
     file.remove(file="table3.csv")
     model2 <- glm(hypertension ~ sex * age + sex * saltadd, family=binomial, 
               data=.data)
     logistic.display(model2) 
     # More than 1 interaction term so 'simplified turned to TRUE

     reg1 <- lm(sbp ~ sex + agegr + saltadd, data=.data)
     regress.display(reg1)

     reg2 <- glm(sbp ~ sex + agegr + saltadd, family=gaussian, data=.data)
     regress.display(reg2)
     
     data(Compaq)
     cox1 <- coxph(Surv(year, status) ~ hospital + stage * ses, data=Compaq)
     cox.display(cox1, crude.p.value=TRUE)

     # Ordinal logistic regression
     library(nnet)
     options(contrasts = c("contr.treatment", "contr.poly"))
     house.plr <- polr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
     house.plr
     ordinal.or.display(house.plr)

     # Polytomous or multinomial logistic regression
     house.multinom <- multinom(Sat ~ Infl + Type + Cont, weights = Freq, 
             data = housing)
     summary(house.multinom)
     mlogit.display(house.multinom, alpha=.01) # with 99% confidence limits.




