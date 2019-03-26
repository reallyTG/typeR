library(superml)


### Name: kFoldMean
### Title: kFoldMean Calculator
### Aliases: kFoldMean

### ** Examples

train <- data.frame(region=c('del','csk','rcb','del','csk','pune','guj','del'),
                    win = c(0,1,1,0,0,0,0,1))
test <- data.frame(region=c('rcb','csk','rcb','del','guj','pune','csk','kol'))
train_result <- kFoldMean(train_df = train,
                          test_df = test,
                          colname = 'region',
                          target = 'win',
                          seed = 1220)$train

test_result <- kFoldMean(train_df = train,
                         test_df = test,
                         colname = 'region',
                         target = 'win',
                         seed = 1220)$test



