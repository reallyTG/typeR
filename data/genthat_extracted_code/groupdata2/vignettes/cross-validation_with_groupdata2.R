## ----include=FALSE-------------------------------------------------------

knitr::opts_chunk$set(collapse = T, comment = "#>", fig.align='center')
options(tibble.print_min = 4L, tibble.print_max = 4L)


## ----warning=FALSE,message=FALSE-----------------------------------------
# Attach some packages
library(groupdata2)
library(dplyr)
library(ggplot2)
library(knitr) # kable()
library(lmerTest) #lmer()
library(broom) #tidy()
library(hydroGOF) # rmse()


# Create dataframe
df <- data.frame("participant" = factor(as.integer(
                                        rep(c('1','2', '3', '4', '5', 
                                        '6', '7', '8', '9', '10'), 3))),
                "age" = rep(c(20,23,27,21,32,31,43,21,34,32), 3),
                "diagnosis" = rep(c('a', 'b', 'a', 'b', 'b', 
                                    'a', 'a', 'a', 'b', 'b'), 3),
                "score" = c(10,24,15,35,24,14,11,16,33,29,  # for 1st session
                            24,40,30,50,54,25,35,32,53,55,  # for 2nd session
                            45,67,40,78,62,30,41,44,66,81)) # for 3rd session

# Order by participant
df <- df[order(df$participant),] 

# Remove index
rownames(df) <- NULL

# Add session info
df$session <- as.integer(rep(c('1','2', '3'), 10))

# Show the dataframe
kable(df, align = 'c')


## ------------------------------------------------------------------------

set.seed(1) # For reproducibility

# Split data in 20/80 (percentage)
partition(df, p = 0.2, id_col = "participant") %>% 
  .[1] %>% # See only the test set 
  kable()  # Pretty tables :) 


## ------------------------------------------------------------------------

set.seed(1) # For reproducibility

# Split data in 20/80 (percentage)
parts <- partition(df, p = 0.2, id_col = "participant", cat_col = 'diagnosis')

test_set <- parts[[1]]
train_set <- parts[[2]]

# Show test_set
test_set %>% kable()


## ------------------------------------------------------------------------
train_set %>% 
  count(diagnosis) %>% 
  kable(align='c')

## ------------------------------------------------------------------------
train_set %>% 
  count(participant) %>% 
  kable(align='c')

## ------------------------------------------------------------------------
set.seed(1) # For reproducibility

train_set <- fold(train_set, k = 4, cat_col = 'diagnosis', id_col = 'participant')

# Order by .folds
train_set <- train_set[order(train_set$.folds),]

train_set %>% kable()

## ------------------------------------------------------------------------
train_set %>% 
  count(participant, diagnosis) %>% 
  kable(align='c')

## ------------------------------------------------------------------------
crossvalidate <- function(data, k, model, dependent, random = FALSE){
  # data is the training set with the ".folds" column
  # k is the number of folds we have
  # model is a string describing a linear regression model formula
  # dependent is a string with the name of the score column we want to predict
  # random is a logical; do we have random effects in the model?
  
  # Initialize empty list for recording performances
  performances <- c()
  
  # One iteration per fold
  for (fold in 1:k){
    
    # Create training set for this iteration
    # Subset all the datapoints where .folds does not match the current fold
    training_set <- data[data$.folds != fold,]
    
    # Create test set for this iteration
    # Subset all the datapoints where .folds matches the current fold
    testing_set <- data[data$.folds == fold,]
    
    ## Train model

    # If there is a random effect,
    # use lmer() to train model
    # else use lm()

    if (isTRUE(random)){

      # Train linear mixed effects model on training set
      model <-  lmer(model, training_set, REML=FALSE)

    } else {

      # Train linear model on training set
      model <-  lm(model, training_set)

    }

    ## Test model

    # Predict the dependent variable in the testing_set with the trained model
    predicted <- predict(model, testing_set, allow.new.levels=TRUE)

    # Get the Root Mean Square Error between the predicted and the observed
    RMSE <- rmse(predicted, testing_set[[dependent]])

    # Add the RMSE to the performance list
    performances[fold] <- RMSE


  }

  # Return the mean of the recorded RMSEs
  return(c('RMSE' = mean(performances)))

}


## ------------------------------------------------------------------------
lm(score~diagnosis, df) %>%
  summary() %>%
  tidy()

## ------------------------------------------------------------------------
m0 <- 'score~1+(1|participant)'
m1 <- 'score~diagnosis+(1|participant)'
m2 <- 'score~diagnosis+age+(1|participant)'
m3 <- 'score~diagnosis+session+(1|participant)'
m4 <- 'score~diagnosis*session+(1|participant)'
m5 <- 'score~diagnosis*session+age+(1|participant)'


## ------------------------------------------------------------------------
m0
crossvalidate(train_set, k=4, model=m0, dependent='score', random=TRUE)

m1
crossvalidate(train_set, k=4, model=m1, dependent='score', random=TRUE)

m2
crossvalidate(train_set, k=4, model=m2, dependent='score', random=TRUE)

m3
crossvalidate(train_set, k=4, model=m3, dependent='score', random=TRUE)

m4
crossvalidate(train_set, k=4, model=m4, dependent='score', random=TRUE)

m5
crossvalidate(train_set, k=4, model=m5, dependent='score', random=TRUE)


## ------------------------------------------------------------------------
# Creating the model for the full training set
model_m4 <- lmer(m4, train_set, REML = FALSE)

# Predict the dependent variable in the test_set with the trained model
predicted <- predict(model_m4, test_set, allow.new.levels=TRUE)

# Get the Root Mean Square Error between the predicted and the observed
RMSE <- rmse(predicted, test_set[['score']])
RMSE

## ------------------------------------------------------------------------
model_m4 %>%
  summary()

