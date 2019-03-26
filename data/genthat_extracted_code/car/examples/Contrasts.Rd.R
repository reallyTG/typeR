library(car)


### Name: Contrasts
### Title: Functions to Construct Contrasts
### Aliases: Contrasts contr.Treatment contr.Sum contr.Helmert
### Keywords: models regression

### ** Examples

# contr.Treatment vs. contr.treatment in the base package:

lm(prestige ~ (income + education)*type, data=Prestige, 
    contrasts=list(type="contr.Treatment"))

##  Call:
##  lm(formula = prestige ~ (income + education) * type, data = Prestige,
##      contrasts = list(type = "contr.Treatment"))
##  
##  Coefficients:
##          (Intercept)                  income               education  
##              2.275753                0.003522                1.713275  
##          type[T.prof]              type[T.wc]     income:type[T.prof]  
##              15.351896              -33.536652               -0.002903  
##      income:type[T.wc]  education:type[T.prof]    education:type[T.wc]  
##              -0.002072                1.387809                4.290875  

lm(prestige ~ (income + education)*type, data=Prestige, 
    contrasts=list(type="contr.treatment"))    

##  Call:
##  lm(formula = prestige ~ (income + education) * type, data = Prestige,
##      contrasts = list(type = "contr.treatment"))
##  
##  Coefficients:
##      (Intercept)              income           education  
##          2.275753            0.003522            1.713275  
##          typeprof              typewc     income:typeprof  
##          15.351896          -33.536652           -0.002903  
##      income:typewc  education:typeprof    education:typewc  
##          -0.002072            1.387809            4.290875      



