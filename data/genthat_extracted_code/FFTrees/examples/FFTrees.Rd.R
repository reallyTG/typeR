library(FFTrees)


### Name: FFTrees
### Title: Creates a fast-and-frugal trees (FFTrees) object.
### Aliases: FFTrees

### ** Examples


 # Create fast-and-frugal trees for heart disease
 heart.fft <- FFTrees(formula = diagnosis ~.,
                      data = heart.train,
                      data.test = heart.test,
                      main = "Heart Disease",
                      decision.labels = c("Healthy", "Diseased"))

 # Print the result for summary info
 heart.fft

 # Plot the tree applied to training data
 plot(heart.fft, stats = FALSE)
 plot(heart.fft)
 plot(heart.fft, data = "test")  # Now for testing data
 plot(heart.fft, data = "test", tree = 2) # Look at tree number 2


 ## Predict classes and probabilities for new data

 predict(heart.fft, newdata = heartdisease)
 predict(heart.fft, newdata = heartdisease, type = "prob")

 ### Create your own custom tree with my.tree

 custom.fft <- FFTrees(formula = diagnosis ~ .,
                       data = heartdisease,
                       my.tree = 'If chol > 300, predict True.
                                  If sex = {m}, predict False,
                                  If age > 70, predict True, otherwise predict False'
                                  )

 # Plot the custom tree (it's pretty terrible)
 plot(custom.fft)






