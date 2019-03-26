library(MTSYS)


### Name: generates_unit_space
### Title: Wrapper function to generate a unit space for a family of
###   Mahalanobis-Taguchi (MT) methods
### Aliases: generates_unit_space

### ** Examples

# 40 data for versicolor in the iris dataset
iris_versicolor <- iris[61:100, -5]

# 10 data for each kind (setosa, versicolor, virginica) in the iris dataset
iris_test <- iris[c(1:10, 51:60, 101:111), -5]

# MT method
unit_space_MT <- generates_unit_space(unit_space_data = iris_versicolor,
                                      method = "MT")

diagnosis_MT <- diagnosis(unit_space = unit_space_MT,
                          newdata = iris_test,
                          threshold = 4)

(diagnosis_MT$distance)
(diagnosis_MT$le_threshold)

# MTA method
unit_space_MTA <- generates_unit_space(unit_space_data = iris_versicolor,
                                       method = "MTA")

diagnosis_MTA <- diagnosis(unit_space = unit_space_MTA,
                           newdata = iris_test,
                           threshold = 0.5)

(diagnosis_MTA$distance)
(diagnosis_MTA$le_threshold)

# RT method
unit_space_RT <- generates_unit_space(unit_space_data = iris_versicolor,
                                      method = "RT")

diagnosis_RT <- diagnosis(unit_space = unit_space_RT,
                          newdata = iris_test,
                          threshold = 0.2)

(diagnosis_RT$distance)
(diagnosis_RT$le_threshold)




