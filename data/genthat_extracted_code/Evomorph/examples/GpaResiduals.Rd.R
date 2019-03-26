library(Evomorph)


### Name: GpaResiduals
### Title: Generalized Procrustes residuals calculation
### Aliases: GpaResiduals

### ** Examples


data("aegla_landmarks")
result<-GpaResiduals(lands = aegla_landmarks)

#GPA consensus (matrix)
result$consens

#GPA consensus (vector)
result$cvectorized

#GPA residual matrix
result$resid



