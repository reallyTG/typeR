library(broom)


### Name: tidy.confusionMatrix
### Title: Tidy a(n) confusionMatrix object
### Aliases: tidy.confusionMatrix caret_tidiers confusionMatrix_tidiers

### ** Examples


if (requireNamespace("caret", quietly = TRUE)) {

  set.seed(27)
  
  two_class_sample1 <- as.factor(sample(letters[1:2], 100, TRUE))
  two_class_sample2 <- as.factor(sample(letters[1:2], 100, TRUE))
  
  two_class_cm <- caret::confusionMatrix(
    two_class_sample1,
    two_class_sample2
  )
  
  tidy(two_class_cm)
  tidy(two_class_cm, by_class = FALSE)
  
  # multiclass example
  
  six_class_sample1 <- as.factor(sample(letters[1:6], 100, TRUE))
  six_class_sample2 <- as.factor(sample(letters[1:6], 100, TRUE))
  
  six_class_cm <- caret::confusionMatrix(
    six_class_sample1,
    six_class_sample2
  )
  
  tidy(six_class_cm)
  tidy(six_class_cm, by_class = FALSE)
}




