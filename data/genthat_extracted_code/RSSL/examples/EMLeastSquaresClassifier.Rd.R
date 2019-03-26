library(RSSL)


### Name: EMLeastSquaresClassifier
### Title: An Expectation Maximization like approach to Semi-Supervised
###   Least Squares Classification
### Aliases: EMLeastSquaresClassifier

### ** Examples

library(dplyr)
library(ggplot2)

set.seed(1)

df <- generate2ClassGaussian(200,d=2,var=0.2) %>% 
 add_missinglabels_mar(Class~.,prob = 0.96)

# Soft-label vs. hard-label self-learning
classifiers <- list(
 "Supervised"=LeastSquaresClassifier(Class~.,df),
 "EM-Soft"=EMLeastSquaresClassifier(Class~.,df,objective="label"),
 "EM-Hard"=EMLeastSquaresClassifier(Class~.,df,objective="responsibility")
)

df %>% 
 ggplot(aes(x=X1,y=X2,color=Class)) +
 geom_point() +
 coord_equal() +
 scale_y_continuous(limits=c(-2,2)) +
 stat_classifier(aes(linetype=..classifier..),
                 classifiers=classifiers)
                 



