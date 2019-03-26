library(texteffect)


### Name: infer_Z
### Title: Infer Treatments on the Test Set
### Aliases: infer_Z

### ** Examples

##Load the Wikipedia biography data
data(BioSample)

# Divide into training and test sets
Y <- BioSample[,1]
X <- BioSample[,-1]
set.seed(1)
train.ind <- sample(1:nrow(X), size = 0.5*nrow(X), replace = FALSE)

# Fit an sIBP on the training data
sibp.fit <- sibp(X, Y, K = 2, alpha = 4, sigmasq.n = 0.8, 
				 train.ind = train.ind)

# Infer the latent treatments in the test set
infer_Z(sibp.fit, X)



