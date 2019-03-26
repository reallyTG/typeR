library(kerasformula)


### Name: kms
### Title: kms
### Aliases: kms

### ** Examples

if(is_keras_available()){

 mtcars$make <- unlist(lapply(strsplit(rownames(mtcars), " "), function(tokens) tokens[1]))
 company <- kms(make ~ ., mtcars, Nepochs = 1, verbose=0)
 # out of sample accuracy
 pCorrect <- mean(company$y_test == company$predictions)
 pCorrect
 company$confusion
 # plot(history$company) # helps pick Nepochs
 # below
 # find the default settings for layers
 company <- kms(make ~ ., mtcars,
                units = c(256, 128), 
                activation = c("relu", "relu", "softmax"),
                dropout = 0.4,
                use_bias = TRUE,
                kernel_initializer = NULL,
                kernel_regularizer = "regularizer_l1",
                bias_regularizer = "regularizer_l1",
                activity_regularizer = "regularizer_l1",
                Nepochs = 1, verbose=0
                )
 # ?predict.kms_fit to see how to predict on newdata
}else{
   cat("Please run install_keras() before using kms(). ?install_keras for options like gpu.")
}
 



