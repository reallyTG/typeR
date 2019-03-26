library(catR)


### Name: checkStopRule
### Title: Checking whether the stopping rule is satisfied
### Aliases: checkStopRule

### ** Examples


# Creation of a 'stop' list with two possible rules
 stop <- list(rule = c("length", "precision"), thr = c(20, 0.3))

# Example of successful 'length' rule
 checkStopRule(th = 0.35, se = 0.41, N = 20, stop = stop)

# Example of successful 'precision' rule
 checkStopRule(th = 0.35, se = 0.29, N = 15, stop = stop)

# Example of jointly successful 'length' and 'precision' rules
 checkStopRule(th = 0.35, se = 0.29, N = 20, stop = stop)

# Example without sucessfull rule
 checkStopRule(th = 0.35, se = 0.31, N = 18, stop = stop) 

# Creation of a short bank of available items under 2PL
 it <- genDichoMatrix(items = 5, model = "2PL", seed = 1)

# Computation of maximum information at ability level 0.35
maxI <- max(Ii(0.35, it)$Ii)

# Creation of a 'stop' list with four possible rules and too large threshold for 'minInfo'
 stop <- list(rule = c("length", "precision", "classification", "minInfo"), 
              thr = c(20, 0.3, 1, maxI-0.01), alpha = 0.05)

# Example with sucessfull 'classification' rule only
 checkStopRule(th = 0.35, se = 0.31, N = 18, it = it, stop = stop) 

# Creation of a 'stop' list with four possible rules and too large threshold for 'minInfo'
 stop <- list(rule = c("length", "precision", "classification", "minInfo"), 
              thr = c(20, 0.3, 1, maxI+0.01), alpha = 0.05)

# Example with sucessfull 'minInfo' rule only
 checkStopRule(th = 0.35, se = 0.55, N = 18, it = it, stop = stop) 




