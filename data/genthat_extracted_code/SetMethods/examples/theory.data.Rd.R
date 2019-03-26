library(SetMethods)


### Name: theory.data
### Title: Membership of cases in the intersections between theory and the
###   empirical solution.
### Aliases: theory.data
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

# Get membership of cases in the intersections between theory and 
# the second intermediate solution:

theory.data(theory = t, empirics = sol_yi, outcome = "EXPORT", sol = 2)




