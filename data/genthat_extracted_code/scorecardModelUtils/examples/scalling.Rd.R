library(scorecardModelUtils)


### Name: scalling
### Title: Converting coefficients of logistic regression into scores for
###   scorecard building
### Aliases: scalling

### ** Examples

data <- iris
set.seed(11)
data$Y <- sample(0:1,size=nrow(data),replace=TRUE)
x <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
iv_table_list <- iv_table(base = data,target = "Y",num_var_name = x,cat_var_name = "Species")
num_cat <- num_to_cat(base = data,num_woe_table = iv_table_list$num_woe_table)
log_model <- glm(Y ~ ., data = num_cat, family = "binomial")
scaling_tab <- scalling(base = num_cat,target = "Y",model = log_model)



