library(glmmLasso)


### Name: glmmLasso
### Title: Variable Selection for Generalized Linear Mixed Models by
###   L1-Penalized Estimation.
### Aliases: glmmLasso
### Keywords: Lasso, Shrinkage, Variable selection, Generalized linear
###   mixed model

### ** Examples

## Not run: 
##D data("soccer")
##D 
##D soccer[,c(4,5,9:16)]<-scale(soccer[,c(4,5,9:16)],center=TRUE,scale=TRUE)
##D soccer<-data.frame(soccer)
##D 
##D ## linear mixed model
##D lm1 <- glmmLasso(points ~ transfer.spendings + ave.unfair.score 
##D        + ball.possession + tackles 
##D        + ave.attend + sold.out, rnd = list(team=~1), 
##D        lambda=10, data = soccer)
##D       
##D summary(lm1)
##D 
##D ## similar linear model without random effects
##D lm1b <- glmmLasso(points ~ transfer.spendings + ave.unfair.score 
##D        + ball.possession + tackles 
##D        + ave.attend + sold.out, rnd = NULL, 
##D        lambda=10, data = soccer)
##D       
##D summary(lm1b)
##D 
##D 
##D ## linear mixed model with slope on ave.attend;  
##D ## the coefficient of ave.attend is not penalized;
##D lm2 <- glmmLasso(points~transfer.spendings + ave.unfair.score 
##D       + ball.possession + tackles + ave.attend 
##D        + sold.out, rnd = list(team=~1 + ave.attend), lambda=10, 
##D        data = soccer, control = list(index=c(1,2,3,4,NA,5), 
##D        method="REML",print.iter=TRUE))
##D 
##D summary(lm2)
##D 
##D ## linear mixed model with categorical covariates
##D ## and final Fisher scoring re-estimation step
##D lm3 <- glmmLasso(points ~ transfer.spendings + as.factor(red.card)  
##D        + as.factor(yellow.red.card) + ball.possession 
##D        + tackles + ave.attend + sold.out, rnd = list(team=~1), 
##D        data = soccer, lambda=100, final.re=TRUE,
##D        control = list(print.iter=TRUE,print.iter.final=TRUE))
##D 
##D summary(lm3)
##D 
##D ## generalized linear mixed model
##D ## with starting values
##D glm1 <- glmmLasso(points~transfer.spendings  
##D         + ave.unfair.score + sold.out 
##D         + tackles + ave.attend + ball.possession, rnd = list(team=~1),  
##D         family = poisson(link = log), data = soccer, lambda=100, 
##D         control = list(print.iter=TRUE,start=c(1,rep(0,29)),q.start=0.7)) 
##D 
##D summary(glm1)
##D 
##D ## generalized linear mixed model with a smooth term
##D glm2 <- glmmLasso(points~ + ave.unfair.score + ave.attend 
##D         + ball.possession + tackles  + sold.out, 
##D         rnd = list(team=~1),  family = poisson(link = log), 
##D         data = soccer, lambda=100, control = list(smooth=
##D         list(formula=~-1 + transfer.spendings, nbasis=7, 
##D         spline.degree=3, diff.ord=2, penal=5), 
##D         print.iter=TRUE)) 
##D  
##D summary(glm2)
##D  
##D plot(glm2,plot.data=FALSE)        
##D 
##D #####################
##D #####################
##D #####################
##D 
##D data(knee)
##D 
##D knee[,c(2,4:6)]<-scale(knee[,c(2,4:6)],center=TRUE,scale=TRUE)
##D knee<-data.frame(knee)
##D 
##D ## fit cumulative model
##D glm3 <- glmmLasso(pain ~ time + th + age + sex, rnd = NULL,  
##D         family = cumulative(), data = knee, lambda=10,
##D         switch.NR=TRUE, control=list(print.iter=TRUE)) 
##D 
##D summary(glm3)
##D 
##D ## fit adjacent category model
##D glm4 <- glmmLasso(pain ~ time + th + age + sex, rnd = NULL,  
##D         family = acat(), data = knee, lambda=10,
##D         switch.NR=TRUE, control=list(print.iter=TRUE)) 
##D 
##D summary(glm4)
##D 
##D 
##D # see also demo("glmmLasso-soccer")
## End(Not run)


