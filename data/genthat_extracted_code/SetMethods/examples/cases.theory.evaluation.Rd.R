library(SetMethods)


### Name: cases.theory.evaluation
### Title: Names of cases in the intersections between theory and the
###   empirical solution.
### Aliases: cases.theory.evaluation
### Keywords: QCA

### ** Examples

# Import your data. For example:

data(SCHF)

# Get the intermediate solution:

sol_yi <- minimize(SCHF, outcome = "EXPORT",
                conditions = c("EMP","BARGAIN","UNI","OCCUP","STOCK", "MA"),
                incl.cut = .9, 
                include = "?", 					   
                details = TRUE, show.cases = TRUE, dir.exp = c(0,0,0,0,0,0))
                
# Specify the theory. Let's assume the theory says that the 
# absence of EMP and the presence of MA is sufficient for EXPORT:

t<-"~EMP*MA"


# Get the names of cases in the intersections between theory and the empirical solution:

cases.theory.evaluation(theory = t, empirics = sol_yi, outcome = "EXPORT", sol = 2, use.tilde=FALSE)




