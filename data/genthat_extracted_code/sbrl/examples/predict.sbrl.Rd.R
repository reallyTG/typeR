library(sbrl)


### Name: predict.sbrl
### Title: PREDICT THE POSITIVE PROBABILITY FOR THE OBSERVATIONS
### Aliases: predict predict.sbrl
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Let us use the titactoe dataset
data(tictactoe)
for (name in names(tictactoe)) {tictactoe[name] <- as.factor(tictactoe[,name])}

# Train on two-thirds of the data
b = round(2*nrow(tictactoe)/3, digit=0)
data_train <- tictactoe[1:b, ]
# Test on the remaining one third of the data
data_test <- tictactoe[(b+1):nrow(tictactoe), ]
# data_train, data_test are dataframes with factor columns
# The class column is "label"

# Run the sbrl algorithm on the training set
  sbrl_model <- sbrl(data_train, iters=20000, pos_sign="1",
   neg_sign="0", rule_minlen=1, rule_maxlen=3, 
   minsupport_pos=0.10, minsupport_neg=0.10, 
   lambda=10.0, eta=1.0, nchain=25)
  print(sbrl_model)

# Make predictions on the test set
  yhat <- predict(sbrl_model, data_test)
# yhat will be a list of predicted negative and positive probabilities for the test data. 



