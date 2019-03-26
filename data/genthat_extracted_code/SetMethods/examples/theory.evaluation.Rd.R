library(SetMethods)


### Name: theory.evaluation
### Title: Performs theory evaluation.
### Aliases: theory.evaluation
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


# Perform theory evaluation (get only the names of the cases and the Boolean intersections):

TH <- theory.evaluation(theory = t, empirics = sol_yi, outcome = "EXPORT", sol = 2, 
                  print.data=FALSE, print.fit=FALSE)
TH

# Get only the case names:

TH$cases

# Or only the parameters of fit:

TH$fit




