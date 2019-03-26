library(IMP)


### Name: interConfMatrix
### Title: Interactive confusion matrix
### Aliases: interConfMatrix

### ** Examples

# Without interactive model development
model_1 <- glm(Species ~ Sepal.Length,data=iris,family=binomial)
model_2 <- glm(Species ~ Sepal.Width, data=iris, family = binomial)
df1 <- data.frame(model_1$y,fitted(model_1))
df2 <- data.frame(model_2$y,fitted(model_2))
## Not run: 
##D #This will launch a Shiny App
##D interConfMatrix(list_models = list(df1,df2))
## End(Not run)

# With interactive model development
glm_model <- function(formula) {
   glm_model <- glm(formula, data = iris, family = "binomial")
   out <- data.frame(glm_model$y, fitted(glm_model))
   out }
 ## Not run: 
##D  #This will launch a Shiny App
##D  interConfMatrix(model_function=glm_model,data=iris,y="Species")
## End(Not run)




