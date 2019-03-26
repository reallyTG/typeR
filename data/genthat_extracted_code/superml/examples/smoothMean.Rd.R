library(superml)


### Name: smoothMean
### Title: smoothMean Calculator
### Aliases: smoothMean

### ** Examples

train <- data.frame(region=c('del','csk','rcb','del','csk','pune','guj','del'),
                    win = c(0,1,1,0,0,1,0,1))
test <- data.frame(region=c('rcb','csk','rcb','del','guj','pune','csk','kol'))

# calculate encodings
all_means <- smoothMean(train_df = train,
                         test_df = test,
                         colname = 'region',
                         target = 'win')
train_mean <- all_means$train
test_mean <- all_means$test



