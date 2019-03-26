library(texteffect)


### Name: sibp_amce
### Title: Infer Treatments on the Test Set
### Aliases: sibp_amce sibp_amce_plot

### ** Examples

##Load the sample of Wikipedia biography data
data(BioSample)

# Divide into training and test sets
Y <- BioSample[,1]
X <- BioSample[,-1]
set.seed(1)
train.ind <- sample(1:nrow(X), size = 0.5*nrow(X), replace = FALSE)

# Fit an sIBP on the training data
sibp.fit <- sibp(X, Y, K = 2, alpha = 4, sigmasq.n = 0.8, 
				 train.ind = train.ind)
				 
sibp.amce <- sibp_amce(sibp.fit, X, Y)
sibp_amce_plot(sibp.amce)



