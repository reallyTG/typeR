library(kerasformula)


### Name: confusion
### Title: confusion
### Aliases: confusion

### ** Examples

mtcars$make <- unlist(lapply(strsplit(rownames(mtcars), " "), function(tokens) tokens[1]))
company <- if(is_keras_available()){
               kms(make ~ ., mtcars, Nepochs=1, verbose=0)
           }else{
                 list(y_test = mtcars$make[1:5], 
                 predictions = sample(mtcars$make, 5))
                 }
confusion(company)     # same as above confusion$company if is_keras_available() == TRUE
confusion(company, return_xtab = FALSE) # focus on pCorrect, most common errors



