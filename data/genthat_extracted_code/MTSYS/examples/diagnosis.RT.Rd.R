library(MTSYS)


### Name: diagnosis.RT
### Title: Diagnosis method for the Recognition-Taguchi (RT) method
### Aliases: diagnosis.RT

### ** Examples

# 40 data for versicolor in the iris dataset
iris_versicolor <- iris[61:100, -5]

unit_space_RT <- RT(unit_space_data = iris_versicolor,
                    includes_transformed_data = TRUE)

# 10 data for each kind (setosa, versicolor, virginica) in the iris dataset
iris_test <- iris[c(1:10, 51:60, 101:111), -5]

diagnosis_RT <- diagnosis(unit_space = unit_space_RT,
                          newdata = iris_test,
                          threshold = 0.2,
                          includes_transformed_newdata = TRUE)

(diagnosis_RT$distance)
(diagnosis_RT$le_threshold)




