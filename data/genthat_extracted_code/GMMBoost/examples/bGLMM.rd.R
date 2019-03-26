library(GMMBoost)


### Name: bGLMM
### Title: Fit Generalized Mixed-Effects Models
### Aliases: bGLMM
### Keywords: models methods

### ** Examples
    

data("soccer")
## linear mixed models
lm1 <- bGLMM(points ~ transfer.spendings + I(transfer.spendings^2)
       + ave.unfair.score + transfer.receits + ball.possession
       + tackles + ave.attend + sold.out, rnd = list(team=~1), data = soccer)
      
lm2 <- bGLMM(points~transfer.spendings + I(transfer.spendings^2)
       + ave.unfair.score + transfer.receits + ball.possession
       + tackles + ave.attend + sold.out, rnd = list(team=~1 + ave.attend), 
       data = soccer, control = list(steps=10, lin=c("(Intercept)","ave.attend"), 
       method="REML", nue=1, sel.method="bic"))

## linear mixed models with categorical covariates
lm3 <- bGLMM(points ~ transfer.spendings + I(transfer.spendings^2)
       + as.factor(red.card) + as.factor(yellow.red.card) 
       + transfer.receits + ball.possession + tackles + ave.attend
       + sold.out, rnd = list(team=~1), data = soccer, control = list(steps=10))


## generalized linear mixed model
glm1 <- bGLMM(points~transfer.spendings  + I(transfer.spendings^2)
        + ave.unfair.score + transfer.receits + ball.possession
        + tackles + ave.attend + sold.out, rnd = list(team=~1),  
        family = poisson(link = log), data = soccer, 
        control = list(start=c(5,rep(0,31))))

   


