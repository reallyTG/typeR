library(FAMILY)


### Name: coef.FAMILY
### Title: coef.FAMILY
### Aliases: coef.FAMILY

### ** Examples

library(FAMILY)
library(pROC)
library(pheatmap)

#####################################################################################
#####################################################################################
############################# EXAMPLE - CONTINUOUS RESPONSE #########################
#####################################################################################
#####################################################################################

############################## GENERATE DATA ########################################

#Generate training set of covariates X and Z
set.seed(1)
X.tr<- matrix(rnorm(10*100),ncol = 10, nrow = 100)
Z.tr<- matrix(rnorm(15*100),ncol = 15, nrow = 100)


#Generate test set of covariates X and Z
X.te<- matrix(rnorm(10*100),ncol = 10, nrow = 100)
Z.te<- matrix(rnorm(15*100),ncol = 15, nrow = 100)

#Scale appropiately
meanX<- apply(X.tr,2,mean)
meanY<- apply(Z.tr,2,mean)

X.tr<- scale(X.tr, scale = FALSE)
Z.tr<- scale(Z.tr, scale = FALSE)
X.te<- scale(X.te,center = meanX,scale = FALSE)
Z.te<- scale(Z.te,center = meanY,scale = FALSE)

#Generate full matrix of Covariates
w.tr<- c()
w.te<- c()
X1<- cbind(1,X.tr)
Z1<- cbind(1,Z.tr)
X2<- cbind(1,X.te)
Z2<- cbind(1,Z.te)

for(i in 1:16){
  for(j in 1:11){
    w.tr<- cbind(w.tr,X1[,j]*Z1[,i])
    w.te<- cbind(w.te, X2[,j]*Z2[,i])
  }
}

#Generate response variables with signal from 
#First 5 X features and 5 Z features.

#We construct the coefficient matrix B.
#B[1,1] contains the intercept
#B[-1,1] contains the main effects for X.
# For instance, B[2,1] is the main effect for the first feature in X.
#B[1,-1] contains the main effects for Z.
# For instance, B[1,10] is the coefficient for the 10th feature in Z.
#B[i+1,j+1] is the coefficient of X_i Z_j
B<- matrix(0,ncol = 16,nrow = 11)
rownames(B)<- c("inter" , paste("X",1:(nrow(B)-1),sep = ""))
colnames(B)<- c("inter" , paste("Z",1:(ncol(B)-1),sep = ""))

# First, we simulate data as follows:
# The first five features in X, and the first five features in Z, are non-zero.
# And given the non-zero main effects, all possible interactions are involved.
# We call this "high strong heredity"
B_high_SH<- B
B_high_SH[1:6,1:6]<- 1
#View true coefficient matrix
pheatmap(as.matrix(B_high_SH), scale="none", 
         cluster_rows=FALSE, cluster_cols=FALSE)

Y_high_SH <- as.vector(w.tr%*%as.vector(B_high_SH))+rnorm(100,sd = 2)
Y_high_SH.te <- as.vector(w.te%*%as.vector(B_high_SH))+rnorm(100,sd = 2)

# Now a new setting:
# Again, the first five features in X, and the first five features in Z, are involved. 
# But this time, only a subset of the possible interactions are involved.
# Strong heredity is still maintained. 
# We call this "low strong heredity"
B_low_SH<- B_high_SH
B_low_SH[2:6,2:6]<-0
B_low_SH[3:4,3:5]<- 1
#View true coefficient matrix
pheatmap(as.matrix(B_low_SH), scale="none", 
         cluster_rows=FALSE, cluster_cols=FALSE)
Y_low_SH <- as.vector(w.tr%*%as.vector(B_low_SH))+rnorm(100,sd = 1.5)
Y_low_SH.te <- as.vector(w.te%*%as.vector(B_low_SH))+rnorm(100,sd = 1.5)


############################## FIT SOME MODELS ########################################

#Define alphas and lambdas
#Define 3 different alpha values
#Low alpha values penalize groups more
#High alpha values penalize individual Interactions more
alphas<- c(0.01,0.5,0.99)
lambdas<- seq(0.1,1,length = 50)

#high Strong heredity with l2 norm
fit_high_SH<- FAMILY(X.tr, Z.tr, Y_high_SH, lambdas , 
                     alphas, quad = TRUE,iter=500, verbose = TRUE )
yhat_hSH<- predict(fit_high_SH, X.te, Z.te)
mse_hSH <-apply(yhat_hSH,c(2,3), "-" ,Y_high_SH.te)
mse_hSH<- apply(mse_hSH^2,c(2,3),sum)

#Find optimal model and plot matrix
im<- which(mse_hSH==min(mse_hSH),TRUE)
plot(fit_high_SH$Estimate[[im[2] ]][[im[1]]])


#Plot some matrices for different alpha values
#Low alpha, higher penalty on groups
plot(fit_high_SH$Estimate[[ 1 ]][[ 25 ]])
#Medium alpha, equal penalty on groups and individual interactions
plot(fit_high_SH$Estimate[[ 2 ]][[ 25  ]])
#High alpha, more penalty on individual interactions
plot(fit_high_SH$Estimate[[ 3 ]][[ 40 ]])


#View Coefficients
coef(fit_high_SH)[[im[2]]][[im[1]]]

############################## Uncomment code for EXAMPLE ###########################
# #high Strong heredity with l_infinity norm norm
# fit_high_SH<- FAMILY(X.tr, Z.tr, Y_high_SH, lambdas , 
#                      alphas, quad = TRUE,iter=500, verbose = TRUE,
#                      norm = "l_inf")
# yhat_hSH<- predict(fit_high_SH, X.te, Z.te)
# mse_hSH <-apply(yhat_hSH,c(2,3), "-" ,Y_high_SH.te)
# mse_hSH<- apply(mse_hSH^2,c(2,3),sum)
# 
# #Find optimal model and plot matrix
# im<- which(mse_hSH==min(mse_hSH),TRUE)
# plot(fit_high_SH$Estimate[[im[2] ]][[im[1]]])
# 
# 
# #Plot some matrices for different alpha values
# #Low alpha, higher penalty on groups
# plot(fit_high_SH$Estimate[[ 1 ]][[ 30 ]])
# #Medium alpha, equal penalty on groups and individual interactions
# plot(fit_high_SH$Estimate[[ 2 ]][[ 10 ]])
# #High alpha, more penalty on individual interactions
# plot(fit_high_SH$Estimate[[ 3 ]][[ 20 ]])
# 
# 
# #View Coefficients
# coef(fit_high_SH)[[im[2]]][[im[1]]]


############################## Uncomment code for EXAMPLE ###########################
# #Redefine lambdas
# lambdas<- seq(0.1,0.5,length = 50)
# 
# #low Strong heredity with l_2 norm
# fit_low_SH<- FAMILY(X.tr, Z.tr, Y_low_SH, lambdas , 
#                      alphas, quad = TRUE,iter=500, verbose = TRUE )
# yhat_lSH<- predict(fit_low_SH, X.te, Z.te)
# mse_lSH <-apply(yhat_lSH,c(2,3), "-" ,Y_low_SH.te)
# mse_lSH<- apply(mse_lSH^2,c(2,3),sum)
# 
# #Find optimal model and plot matrix
# im<- which(mse_lSH==min(mse_lSH),TRUE)
# plot(fit_low_SH$Estimate[[im[2] ]][[im[1]]])
# 
# 
# #Plot some matrices for different alpha values
# #Low alpha, higher penalty on groups
# plot(fit_low_SH$Estimate[[ 1 ]][[ 25 ]])
# #Medium alpha, equal penalty on groups and individual interactions
# plot(fit_low_SH$Estimate[[ 2 ]][[ 10 ]])
# #High alpha, more penalty on individual interactions
# plot(fit_low_SH$Estimate[[ 3 ]][[ 10 ]])
# 
# 
# #View Coefficients
# coef(fit_low_SH)[[im[2]]][[im[1]]]


#####################################################################################
#####################################################################################
############################### EXAMPLE - BINARY RESPONSE ###########################
#####################################################################################
#####################################################################################

############################## GENERATE DATA ########################################

#Generate data for logistic regression
Yp_high_SH<- as.vector((w.tr)%*%as.vector(B_high_SH))
Yp_high_SH.te<- as.vector((w.te)%*%as.vector(B_high_SH))

Yprobs_high_SH<- 1/(1+exp(-Yp_high_SH))
Yprobs_high_SH.te<- 1/(1+exp(-Yp_high_SH.te))

Yp_high_SH<- rbinom(100, size = 1, prob = Yprobs_high_SH)
Yp_high_SH.te<- rbinom(100, size = 1, prob = Yprobs_high_SH.te)

lambdas<- seq(0.01,0.15,length = 50)

############################## FIT SOME MODELS ########################################

#Fit glm via l_2 norm
fit_high_SH<- FAMILY(X.tr, Z.tr, Yp_high_SH, lambdas , 
                    alphas, quad = TRUE,iter=500, verbose = TRUE,
                    family = "binomial")
yhp_hSH<- predict(fit_high_SH, X.te, Z.te)
mse_high_SH <-apply(yhp_hSH,c(2,3), "-" ,Yp_high_SH.te)
mse_hSH<- apply(mse_high_SH^2,c(2,3),sum)
im<- which(mse_hSH==min(mse_hSH),TRUE)
plot(fit_high_SH$Estimate[[im[2] ]][[im[1]]])
roc( Yp_high_SH.te,yhp_hSH[,im[1],im[2]],plot = TRUE)

#View Coefficients
coef(fit_high_SH)[[im[2]]][[im[1]]]

############################## Uncomment code for EXAMPLE ###########################
# #Fit glm via l_infinity norm
# fit_high_SH<- FAMILY(X.tr, Z.tr, Yp_high_SH, lambdas , norm = "l_inf",
#                      alphas, quad = TRUE,iter=500, verbose = TRUE,
#                      family = "binomial")
# yhp_hSH<- predict(fit_high_SH, X.te, Z.te)
# mse_high_SH <-apply(yhp_hSH,c(2,3), "-" ,Yp_high_SH.te)
# mse_hSH<- apply(mse_high_SH^2,c(2,3),sum)
# im<- which(mse_hSH==min(mse_hSH),TRUE)
# plot(fit_high_SH$Estimate[[im[2] ]][[im[1]]])
# roc( Yp_high_SH.te,yhp_hSH[,im[1],im[2]],plot = TRUE)
# 
# #View Coefficients
# coef(fit_high_SH)[[im[2]]][[im[1]]]

#####################################################################################
#####################################################################################
############################## EXAMPLE WHERE X=Z #################################### 
######################## Uncomment Code for EXAMPLE #################################
#####################################################################################

############################## GENERATE DATA ########################################
# #Redefine Lambdas
# lambdas<- seq(0.01,0.3,length = 50)
# 
# 
# #We consider the case X=Z now
# w.tr<- c()
# w.te<- c()
# X1<- cbind(1,X.tr)
# X2<- cbind(1,X.te)
# 
# for(i in 1:11){
#   for(j in 1:11){
#     w.tr<- cbind(w.tr,X1[,j]*X1[,i])
#     w.te<- cbind(w.te, X2[,j]*X2[,i])
#   }
# }
# 
# B<- matrix(0,ncol = 11,nrow = 11)
# rownames(B)<- c("inter" , paste("X",1:(nrow(B)-1),sep = ""))
# colnames(B)<- c("inter" , paste("X",1:(ncol(B)-1),sep = ""))
# 
# 
# B_high_SH<- B
# B_high_SH[1:6,1:6]<- 1
# #We exclude quadratic terms in this example
# diag(B_high_SH)[-1]<-0
# #View true coefficient matrix
# pheatmap(as.matrix(B_high_SH), scale="none", 
#          cluster_rows=FALSE, cluster_cols=FALSE)
# 
# #With high Strong heredity: all possible interactions
# Y_high_SH <- as.vector(w.tr%*%as.vector(B_high_SH))+rnorm(100)
# Y_high_SH.te <- as.vector(w.te%*%as.vector(B_high_SH))+rnorm(100)
# 
# ############################## FIT SOME MODELS ########################################
# 
# #high Strong heredity with l_2 norm
# fit_high_SH<- FAMILY(X.tr, X.tr, Y_high_SH, lambdas , 
#                      alphas, quad = FALSE,iter=500, verbose = TRUE )
# yhat_hSH<- predict(fit_high_SH, X.te, X.te)
# mse_hSH <-apply(yhat_hSH,c(2,3), "-" ,Y_high_SH.te)
# mse_hSH<- apply(mse_hSH^2,c(2,3),sum)
# 
# #Find optimal model and plot matrix
# im<- which(mse_hSH==min(mse_hSH),TRUE)
# plot(fit_high_SH$Estimate[[im[2] ]][[im[1]]])
# 
# 
# #Plot some matrices for different alpha values
# #Low alpha, higher penalty on groups
# plot(fit_high_SH$Estimate[[ 1 ]][[ 50 ]])
# #Medium alpha, equal penalty on groups and individual interactions
# plot(fit_high_SH$Estimate[[ 2 ]][[ 50 ]])
# #High alpha, more penalty on individual interactions
# plot(fit_high_SH$Estimate[[ 3 ]][[ 50 ]])
# 
# 
# #View Coefficients
# coef(fit_high_SH,XequalZ = TRUE)[[im[2]]][[im[1]]]



