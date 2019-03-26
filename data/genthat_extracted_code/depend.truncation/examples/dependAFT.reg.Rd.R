library(depend.truncation)


### Name: dependAFT.reg
### Title: Semiparametric Inference for the AFT regression Model with
###   Dependent Truncation
### Aliases: dependAFT.reg
### Keywords: Regression Semiparametric method

### ** Examples


y.trunc=c(
  -0.52,  0.22, -1.42,  0.05,  0.32, -1.02, -0.47,  0.10, -0.38, -0.18,  0.97,  0.04, -0.10,
   0.50,  0.57, -0.80, -0.24,  0.07, -0.04,  0.88, -0.52, -0.28, -0.55,  0.53,  0.99, -0.52,
  -0.59, -0.48, -0.07,  0.20, -0.34,  1.00, -0.52)
t.trunc=c(
  -2.05, -0.25, -2.43, -0.32, -0.27, -1.06, -0.95, -0.82, -0.66, -0.28, -1.14, -0.32, -1.19,
  -2.18, -0.45, -1.71, -0.84, -1.93, -1.04, -2.58, -1.97, -2.15, -0.59, -0.74, -1.26, -2.57,
  -2.40, -2.22, -1.52, -0.21, -1.50, -1.99, -1.79)

d=c(1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1,
    0, 1, 1,1)

x1.trunc=c(
  0.27, 0.66, 0.77, 0.21, 0.48, 0.11, 0.69, 0.32, 0.33, 0.43, 0.12, 0.60, 0.13, 0.43, 0.99,
  0.21, 0.93, 0.60, 0.45, 0.41, 0.86, 0.90, 0.76, 0.93, 0.27, 0.13, 0.82, 0.17, 0.63, 0.31,
  0.13, 0.48, 0.32)

### Data analysis in Emura & Wang (2016) ###
# dependAFT.reg(t.trunc,y.trunc,d,x1.trunc,alpha=2,LY=TRUE,beta1_low=-5,beta1_up=5)
dependAFT.reg(t.trunc,y.trunc,d,x1.trunc,LY=FALSE,beta1_low=-5,beta1_up=5)

#### Channing hourse data analysis; Section 5 of Emura & Wang (2016) ##### 
# library(KMsurv)
# data(channing)
# y.trunc=log(channing$age)
# t.trunc=log(channing$ageentry)
# d=channing$death
# x1.trunc=as.numeric(channing$gender==1)

# dependAFT.reg(t.trunc,y.trunc,d,x1.trunc,beta1_low=-0.2,beta1_up=0.2)
# dependAFT.reg(t.trunc,y.trunc,d,x1.trunc,LY=TRUE,alpha=2,beta1_low=-0.2,beta1_up=0.2)



