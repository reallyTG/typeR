library(kerasformula)


### Name: plot_confusion
### Title: plot_confusion
### Aliases: plot_confusion

### ** Examples


if(is_keras_available()){

   model_tanh <- kms(Species ~ ., iris, 
                     activation = "tanh", Nepochs=5, 
                     units=4, seed=1, verbose=0)
   model_softmax <- kms(Species ~ ., iris, 
                        activation = "softmax", Nepochs=5, 
                        units=4, seed=1, verbose=0)
   model_relu <- kms(Species ~ ., iris, 
                     activation = "relu", Nepochs=5, 
                     units=4, seed=1, verbose=0)
                     
   plot_confusion(model_tanh, model_softmax, model_relu, 
                  title="Species", 
                  subtitle="Activation Function Comparison")
   
}



