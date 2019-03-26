library(kerasformula)


### Name: predict.kms_fit
### Title: predict.kms_fit
### Aliases: predict.kms_fit

### ** Examples

if(is_keras_available()){

 mtcars$make <- unlist(lapply(strsplit(rownames(mtcars), " "), function(tokens) tokens[1]))
 company <- kms(make ~ ., mtcars[3:32, ], Nepochs = 2, verbose=0)
 forecast <- predict(company, mtcars[1:2, ])
 forecast$confusion
 
 # example where y_test is unavailable
 
 trained <- kms(log(mpg) ~ ., mtcars[4:32,], Nepochs=1, verbose=0)
 X_test <- subset(mtcars[1:3,], select = -mpg)  
 predictions <- predict(trained, X_test)
 
}else{
   cat("Please run install_keras() before using kms(). ?install_keras for options like gpu.")
}



