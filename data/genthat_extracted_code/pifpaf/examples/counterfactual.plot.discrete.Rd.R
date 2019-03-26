library(pifpaf)


### Name: counterfactual.plot.discrete
### Title: Create a plot of the distribution of exposure under
###   counterfactual scenario for discrete exposure.
### Aliases: counterfactual.plot.discrete
### Keywords: internal

### ** Examples


#Example 1: Bivariate exposure
#--------------------------------------------------------
set.seed(2783569)
X   <- data.frame(Exposure = 
                   sample(c("Exposed","Unexposed"), 100, 
                   replace = TRUE, prob = c(0.3, 0.7)))
cft <- function(X){

     #Find which indivuals are exposed
     exposed      <- which(X[,"Exposure"] == "Exposed")
     
     #Change 1/3 of exposed to unexposed
     reduced                 <- sample(exposed, length(exposed)/3)
     X[reduced,"Exposure"]   <- "Unexposed"
     
     return(X)
}  
counterfactual.plot.discrete(X, cft)
  
#Example 2: Multivariate exposure
#--------------------------------------------------------
set.seed(2783569)
X   <- data.frame(
         Exposure = sample(c("Underweight","Normal","Overweight","Obese"), 
         1000, replace = TRUE, prob = c(0.05, 0.3, 0.25, 0.4)))
               
#Complex counterfactual of changing half of underweights to normal,
#1/2 of overweights to normal, 1/3 of obese to normal and 
#1/3 of obese to overweight
cft <- function(X){

     #Classify the individuals
     underweights    <- which(X[,"Exposure"] == "Underweight")
     overweights     <- which(X[,"Exposure"] == "Overweight")
     obese           <- which(X[,"Exposure"] == "Obese")
     
     #Sample 1/2 underweights and overweights and 2/3 of obese
     changed_under    <- sample(underweights, length(underweights)/2)
     changed_over     <- sample(overweights,  length(overweights)/2)
     changed_obese    <- sample(obese,        2*length(obese)/3)
     
     #Assign those obese that go to normal and those that go to overweight
     obese_to_normal  <- sample(changed_obese, length(changed_obese)/2)
     obese_to_over    <- which(!(changed_obese %in% obese_to_normal))
     
     #Change the individuals to normal and overweight
     X[changed_under,"Exposure"]   <- "Normal"
     X[changed_over,"Exposure"]    <- "Normal"
     X[obese_to_normal,"Exposure"] <- "Normal"
     X[obese_to_over,"Exposure"]   <- "Overweight"
     
     return(X)
}  

#Create plot of counterfactual distribution
counterfactual.plot.discrete(X, cft, x_axis_order = c("Underweight","Normal","Obese","Overweight")) 




