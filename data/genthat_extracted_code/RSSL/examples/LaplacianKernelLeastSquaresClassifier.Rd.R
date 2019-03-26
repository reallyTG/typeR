library(RSSL)


### Name: LaplacianKernelLeastSquaresClassifier
### Title: Laplacian Regularized Least Squares Classifier
### Aliases: LaplacianKernelLeastSquaresClassifier

### ** Examples

library(RSSL)
library(ggplot2)
library(dplyr)

## Example 1: Half moons

# Generate a dataset
set.seed(2)
df_orig <- generateCrescentMoon(100,sigma = 0.3) 
df <- df_orig %>% 
  add_missinglabels_mar(Class~.,0.98)

lambda <- 0.01
gamma <- 10000
rbf_param <- 0.125

# Train classifiers
## Not run: 
##D class_sup <- KernelLeastSquaresClassifier(
##D                 Class~.,df,
##D                 kernel=kernlab::rbfdot(rbf_param),
##D                 lambda=lambda,scale=FALSE)
##D 
##D class_lap <- LaplacianKernelLeastSquaresClassifier(
##D                     Class~.,df,
##D                     kernel=kernlab::rbfdot(rbf_param),
##D                     lambda=lambda,gamma=gamma,
##D                     normalized_laplacian = TRUE,
##D                     scale=FALSE)
##D 
##D classifiers <- list("Lap"=class_lap,"Sup"=class_sup)
##D 
##D # Plot classifiers (can take a couple of seconds)
##D 
##D df %>% 
##D   ggplot(aes(x=X1,y=X2,color=Class)) +
##D   geom_point() +
##D   coord_equal() +
##D   stat_classifier(aes(linetype=..classifier..),
##D                   classifiers = classifiers ,
##D                   color="black")
##D 
##D 
##D # Calculate the loss
##D lapply(classifiers,function(c) mean(loss(c,df_orig)))
## End(Not run)

## Example 2: Two circles
set.seed(1)
df_orig <- generateTwoCircles(1000,noise=0.05)
df <- df_orig %>% 
  add_missinglabels_mar(Class~.,0.994)

lambda <- 10e-12
gamma <- 100
rbf_param <- 0.1

# Train classifiers
## Not run: 
##D class_sup <- KernelLeastSquaresClassifier(
##D   Class~.,df,
##D   kernel=kernlab::rbfdot(rbf_param),
##D   lambda=lambda,scale=TRUE)
##D 
##D class_lap <- LaplacianKernelLeastSquaresClassifier(
##D   Class~.,df,
##D   kernel=kernlab::rbfdot(rbf_param),
##D   adjacency_k = 30,
##D   lambda=lambda,gamma=gamma,
##D   normalized_laplacian = TRUE,
##D   scale=TRUE)
##D 
##D classifiers <- list("Lap"=class_lap,"Sup"=class_sup)
##D 
##D # Plot classifiers (Can take a couple of seconds)
##D df %>% 
##D   ggplot(aes(x=X1,y=X2,color=Class,size=Class)) +
##D   scale_size_manual(values=c("1"=3,"2"=3),na.value=1) +
##D   geom_point() +
##D   coord_equal() +
##D   stat_classifier(aes(linetype=..classifier..),
##D                   classifiers = classifiers ,
##D                   color="black",size=1)
## End(Not run)



