library(MTSYS)


### Name: diagnosis.MT
### Title: Diagnosis method for the Mahalanobis-Taguchi (MT) method
### Aliases: diagnosis.MT

### ** Examples

# 40 data for versicolor in the iris dataset
iris_versicolor <- iris[61:100, -5]

unit_space_MT <- MT(unit_space_data = iris_versicolor,
                    includes_transformed_data = TRUE)

# 10 data for each kind (setosa, versicolor, virginica) in the iris dataset
iris_test <- iris[c(1:10, 51:60, 101:111), -5]

diagnosis_MT <- diagnosis(unit_space = unit_space_MT,
                          newdata = iris_test,
                          threshold = 4,
                          includes_transformed_newdata = TRUE)

(diagnosis_MT$distance)
(diagnosis_MT$le_threshold)




