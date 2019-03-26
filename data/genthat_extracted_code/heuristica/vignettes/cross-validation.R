## ------------------------------------------------------------------------
library(heuristica)

## ------------------------------------------------------------------------
# Use this seed to exactly replicate my tables and graphs below.
#set.seed(3)
# Remove it to see a new sampling-- and whether the overall conclusions still
# hold.

## ------------------------------------------------------------------------
vec_of_models <-c(ttbModel, unitWeightModel, regModel, minModel)

## ------------------------------------------------------------------------
crossV <- function(vec_of_models, criterion_col, cols_to_fit, data, reps,training_proportion){
  fitting <- vector()
  prediction <- vector()
  for(i in 1:reps){
    
    #randomly sample training and test row indexes
    train <- sample(1:nrow(data), nrow(data)*training_proportion)
    test <- setdiff(1:nrow(data), train)
   
    #create training and test set
    training_set <- data[train,]
    test_set <- data[test,]
    
    # If a regression is overdetermined (e.g. has too many columns(), it will
    # drop the right-most columns.  To instead make it drop random columns,
    # we shuffle the column order.
    shuffled_cols_to_fit <- sample(cols_to_fit)

    models<-list()
    y <- 0
    for (mod in vec_of_models) { #fit the models to the training_set
      y <- y+1
      models[[y]] <- mod(training_set, criterion_col, shuffled_cols_to_fit)
    }

    #calculate percentage of correct predictions
    fittingAccuracy <- percentCorrectList(training_set, models)
    predictionAccuracy <- percentCorrectList(test_set, models)
    fitting <- rbind(fitting,fittingAccuracy)
    prediction <- rbind(prediction,predictionAccuracy)
  }

  return (rbind(colMeans(fitting),colMeans(prediction)))
} 

## ------------------------------------------------------------------------
data("city_population")
data_set <- city_population
criterion_col <- 3
cols_to_fit <- 4:ncol(data_set)

## ------------------------------------------------------------------------
reps <- 100
training_proportion <- 0.5
results <- crossV(vec_of_models, criterion_col, cols_to_fit, data_set, reps,training_proportion)

## ----fig.width=7, fig.height=5-------------------------------------------
library(ggplot2)
library(reshape)
rownames(results) <- c("Fitting","Prediction")
p <- melt(results)
colnames(p) <- c("condition","model","value")
ggplot(p, aes(x=condition, y=value, colour=model,group=model)) +
  geom_line() + 
  geom_point() + 
  xlab("Condition") + ylab("Proportion correct")

## ----fig.width=7, fig.height=5-------------------------------------------
data(highschool_dropout)
data_set <- na.omit(highschool_dropout)
criterion_col <- 4
cols_to_fit <- 6:ncol(data_set)

reps <- 100
training_proportion <- 0.5
results <- crossV(vec_of_models, criterion_col, cols_to_fit, data_set, reps,training_proportion) 

rownames(results) <- c("Fitting","Prediction")
p <- melt(results)
colnames(p) <- c("condition","model","value")
ggplot(p, aes(x=condition, y=value, colour=model,group=model)) +
  geom_line() + 
  geom_point() + 
  xlab("Condition") + ylab("Proportion correct")



