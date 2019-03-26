library(pifpaf)


### Name: counterfactual.plot
### Title: Plot exposure's distribution under counterfactual scenario
### Aliases: counterfactual.plot

### ** Examples


#Example 1: Bivariate exposure
#--------------------------------------------------------
set.seed(2783569)
X   <- data.frame(Exposure = 
           sample(c("Exposed","Unexposed"), 100, replace = TRUE, 
           prob = c(0.3, 0.7)))
cft <- function(X){

     #Find which indivuals are exposed
     exposed    <- which(X[,"Exposure"] == "Exposed")
     
     #Change 1/3 of exposed to unexposed
     reduced               <- sample(exposed, length(exposed)/3)
     X[reduced,"Exposure"] <- "Unexposed"
     
     return(X)
}  
counterfactual.plot(X, cft)
  
## Not run: 
##D    
##D #Example 2: Multivariate discrete
##D #--------------------------------------------------------
##D set.seed(2783569)
##D X   <- data.frame(Exposure = 
##D          sample(c("Underweight","Normal","Overweight","Obese"), 1000, 
##D                 replace = TRUE, prob = c(0.05, 0.3, 0.25, 0.4)))
##D                
##D #Complex counterfactual of changing half of underweights to normal,
##D #1/2 of overweights to normal, 1/3 of obese to normal and 
##D #1/3 of obese to overweight
##D cft <- function(X){
##D 
##D      #Classify the individuals
##D      underweights    <- which(X[,"Exposure"] == "Underweight")
##D      overweights     <- which(X[,"Exposure"] == "Overweight")
##D      obese           <- which(X[,"Exposure"] == "Obese")
##D      
##D      #Sample 1/2 underweights and overweights and 2/3 of obese
##D      changed_under    <- sample(underweights, length(underweights)/2)
##D      changed_over     <- sample(overweights,  length(overweights)/2)
##D      changed_obese    <- sample(obese,        2*length(obese)/3)
##D      
##D      #Assign those obese that go to normal and those that go to overweight
##D      obese_to_normal  <- sample(changed_obese, length(changed_obese)/2)
##D      obese_to_over    <- which(!(changed_obese %in% obese_to_normal))
##D      
##D      #Change the individuals to normal and overweight
##D      X[changed_under,"Exposure"]   <- "Normal"
##D      X[changed_over,"Exposure"]    <- "Normal"
##D      X[obese_to_normal,"Exposure"] <- "Normal"
##D      X[obese_to_over,"Exposure"]   <- "Overweight"
##D      
##D      return(X)
##D }  
##D 
##D #Create plot of counterfactual distribution
##D cftplot <- counterfactual.plot(X, cft, 
##D                x_axis_order = c("Underweight","Normal","Obese","Overweight")) 
##D cftplot 
##D 
##D #Objects returned are ggplot objects and you can play with them
##D #require(ggplot2)
##D #cftplot + coord_flip() + theme_grey()
##D 
##D 
##D #Example 3: Normal distribution and linear counterfactual
##D #--------------------------------------------------------
##D set.seed(2783569)
##D X   <- data.frame(Exposure = rnorm(1000, 150, 15))
##D cft <- function(X){0.35*X + 75}  
##D counterfactual.plot(X, cft, xlab = "Usual SBP (mmHg)", 
##D ylab = "Relative risk of ischemic heart disease",
##D dnames = c("Current distribution", "Theoretical Minimum Risk Distribution"),
##D title = paste0("Effect of a non-linear hazard function and choice", 
##D                "\nof baseline on total population risk", 
##D                "\n(Fig 25 from Vander Hoorn et al)"))
##D   
##D #Example 4: Counterfactual of BMI reduction only for those 
##D #with excess-weight (BMI > 25)
##D #--------------------------------------------------------
##D set.seed(2783569)
##D X <- data.frame(Exposure = rlnorm(1000, 3, 0.2))
##D cft <- function(X){
##D 
##D      #Find individuals with excess weight
##D      excess_weight <- which(X[,"Exposure"] > 25)
##D      
##D      #Set those with excess weight to BMI of 25
##D      X[excess_weight, "Exposure"] <- 25
##D      
##D      return(X)
##D }     
##D 
##D counterfactual.plot(X, cft, ktype = "epanechnikov")   
##D 
##D #Change bandwidth method to reduce noise
##D counterfactual.plot(X, cft, ktype = "epanechnikov", bw = "nrd0")   
## End(Not run) 
  



