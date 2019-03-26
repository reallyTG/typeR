library(h2o)


### Name: h2o.download_pojo
### Title: Download the Scoring POJO (Plain Old Java Object) of an H2O
###   Model
### Aliases: h2o.download_pojo

### ** Examples

## No test: 
library(h2o)
h <- h2o.init()
fr <- as.h2o(iris)
my_model <- h2o.gbm(x = 1:4, y = 5, training_frame = fr)

h2o.download_pojo(my_model)  # print the model to screen
# h2o.download_pojo(my_model, getwd())  # save the POJO and jar file to the current working
#                                         directory, NOT RUN
# h2o.download_pojo(my_model, getwd(), get_jar = FALSE )  # save only the POJO to the current
#                                                           working directory, NOT RUN
h2o.download_pojo(my_model, getwd())  # save to the current working directory
## End(No test)



