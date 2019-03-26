library(RSSL)


### Name: LaplacianSVM
### Title: Laplacian SVM classifier
### Aliases: LaplacianSVM

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

lambda <- 0.001
C <- 1/(lambda*2*sum(!is.na(df$Class)))
gamma <- 10000
rbf_param <- 0.125

# Train classifiers
class_sup <- SVM(
  Class~.,df,
  kernel=kernlab::rbfdot(rbf_param),
  C=C,scale=FALSE)

class_lap <- LaplacianSVM(
  Class~.,df,
  kernel=kernlab::rbfdot(rbf_param),
  lambda=lambda,gamma=gamma,
  normalized_laplacian = TRUE,
  scale=FALSE)

classifiers <- list("Lap"=class_lap,"Sup"=class_sup)

# This takes a little longer to run:
# class_tsvm <- TSVM(
#   Class~.,df,
#   kernel=kernlab::rbfdot(rbf_param),
#   C=C,Cstar=10,s=-0.8,
#   scale=FALSE,balancing_constraint=TRUE)
# classifiers <- list("Lap"=class_lap,"Sup"=class_sup,"TSVM"=class_tsvm)

# Plot classifiers (Can take a couple of seconds)
## Not run: 
##D df %>% 
##D   ggplot(aes(x=X1,y=X2,color=Class)) +
##D   geom_point() +
##D   coord_equal() +
##D   stat_classifier(aes(linetype=..classifier..),
##D                   classifiers = classifiers ,
##D                   color="black")
## End(Not run)
  
# Calculate the loss
lapply(classifiers,function(c) mean(loss(c,df_orig)))

## Example 2: Two circles
set.seed(3)
df_orig <- generateTwoCircles(1000,noise=0.05)
df <- df_orig %>% 
  add_missinglabels_mar(Class~.,0.994)

lambda <- 0.000001
C <- 1/(lambda*2*sum(!is.na(df$Class)))
gamma <- 100
rbf_param <- 0.1

# Train classifiers (Takes a couple of seconds)
## Not run: 
##D class_sup <- SVM(
##D   Class~.,df,
##D   kernel=kernlab::rbfdot(rbf_param),
##D   C=C,scale=FALSE)
##D 
##D class_lap <- LaplacianSVM(
##D   Class~.,df,
##D   kernel=kernlab::rbfdot(rbf_param),
##D   adjacency_k=50, lambda=lambda,gamma=gamma,
##D   normalized_laplacian = TRUE,
##D   scale=FALSE)
##D 
##D 
##D classifiers <- list("Lap"=class_lap,"Sup"=class_sup)
## End(Not run)

# Plot classifiers (Can take a couple of seconds)
## Not run: 
##D df %>% 
##D   ggplot(aes(x=X1,y=X2,color=Class,size=Class)) +
##D   scale_size_manual(values=c("1"=3,"2"=3),na.value=1) +
##D   geom_point() +
##D   coord_equal() +
##D   stat_classifier(aes(linetype=..classifier..),
##D                   classifiers = classifiers ,
##D                   color="black",size=1)
## End(Not run)



