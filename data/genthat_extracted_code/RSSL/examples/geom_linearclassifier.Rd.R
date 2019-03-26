library(RSSL)


### Name: geom_linearclassifier
### Title: Plot linear RSSL classifier boundary
### Aliases: geom_linearclassifier

### ** Examples

library(ggplot2)
library(dplyr)

df <- generate2ClassGaussian(100,d=2,var=0.2) %>% 
 add_missinglabels_mar(Class~., 0.8)

df %>% 
 ggplot(aes(x=X1,y=X2,color=Class)) +
 geom_point() +
 geom_linearclassifier("Supervised"=LinearDiscriminantClassifier(Class~.,df),
                       "EM"=EMLinearDiscriminantClassifier(Class~.,df))



