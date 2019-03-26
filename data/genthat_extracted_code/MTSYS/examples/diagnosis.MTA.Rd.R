library(MTSYS)


### Name: diagnosis.MTA
### Title: Diagnosis method for the Mahalanobis-Taguchi Adjoint (MTA)
###   method
### Aliases: diagnosis.MTA

### ** Examples

# 40 data for versicolor in the iris dataset
iris_versicolor <- iris[61:100, -5]

unit_space_MTA <- MTA(unit_space_data = iris_versicolor,
                      includes_transformed_data = TRUE)

# 10 data for each kind (setosa, versicolor, virginica) in the iris dataset
iris_test <- iris[c(1:10, 51:60, 101:111), -5]

diagnosis_MTA <- diagnosis(unit_space = unit_space_MTA,
                           newdata = iris_test,
                           threshold = 0.5,
                           includes_transformed_newdata = TRUE)

(diagnosis_MTA$distance)
(diagnosis_MTA$le_threshold)




