library(LMest)


### Name: decoding
### Title: Perform local and global decoding
### Aliases: decoding

### ** Examples

# example for the output from est_lm_basic
data(data_drug)
data_drug = as.matrix(data_drug)
S = data_drug[,1:5]-1
yv = data_drug[,6]
n = sum(yv)
# fit the Basic LM model
k = 3
est = est_lm_basic(S,yv,k,mod=1)
# decoding for a single sequence
out1 = decoding(est,S[1,])
# decoding for all sequences
out2 = decoding(est,S)


# example for the output from est_lm_cov_latent with difflogit parametrization
data(data_SRHS_long)
dataSRHS = data_SRHS_long[1:1600,]

TT = 8 
head(dataSRHS)
res = long2matrices(dataSRHS$id,X=cbind(dataSRHS$gender-1, 
dataSRHS$race==2| dataSRHS$race==3, dataSRHS$education==4, 
dataSRHS$education==5, dataSRHS$age-50,(dataSRHS$age-50)^2/100),
Y= dataSRHS$srhs)

# matrix of responses (with ordered categories from 0 to 4)
S = 5-res$YY

# matrix of covariates (for the first and the following occasions)
# colums are: gender,race,educational level (2 columns),age,age^2)
X1 =res$XX[,1,]
X2 =res$XX[,2:TT,]

# estimate the model
est = est_lm_cov_latent(S,X1,X2,k=2,output=TRUE,param="difflogit")
# decoding for a single sequence
out1 = decoding(est,S[1,,],X1[1,],X2[1,,])
# decoding for all sequences
out2 = decoding(est,S,X1,X2)



