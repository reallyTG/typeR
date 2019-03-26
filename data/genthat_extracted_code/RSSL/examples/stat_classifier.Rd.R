library(RSSL)


### Name: stat_classifier
### Title: Plot RSSL classifier boundaries
### Aliases: stat_classifier

### ** Examples

library(RSSL)
library(ggplot2)
library(dplyr)

df <- generateCrescentMoon(200)

# This takes a couple of seconds to run
## Not run: 
##D g_svm <- SVM(Class~.,df,kernel = kernlab::rbfdot(sigma = 1))
##D g_ls <- LeastSquaresClassifier(Class~.,df)
##D g_nm <- NearestMeanClassifier(Class~.,df)
##D 
##D 
##D df %>% 
##D   ggplot(aes(x=X1,y=X2,color=Class,shape=Class)) +
##D   geom_point(size=3) +
##D   coord_equal() +
##D   scale_x_continuous(limits=c(-20,20), expand=c(0,0)) +
##D   scale_y_continuous(limits=c(-20,20), expand=c(0,0)) +
##D   stat_classifier(aes(linetype=..classifier..),
##D                   color="black", precision=50,
##D                   classifiers=list("SVM"=g_svm,"NM"=g_nm,"LS"=g_ls)
##D   )
## End(Not run)   



