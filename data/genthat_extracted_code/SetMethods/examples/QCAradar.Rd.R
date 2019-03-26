library(SetMethods)


### Name: QCAradar
### Title: Function for displaying a radar chart.
### Aliases: QCAradar
### Keywords: QCA

### ** Examples


# Import data. 
# For example:

data(SCHF)

# Get the intermediate solution:

sol_yi <- minimize(SCHF, outcome = "EXPORT",
                conditions = c("EMP","BARGAIN","UNI","OCCUP","STOCK", "MA"),
                incl.cut = .9, 
                include = "?", 					   
                details = TRUE, show.cases = TRUE, dir.exp = c(0,0,0,0,0,0))

# Display radar chart for the second intermediate solution:

QCAradar(results = sol_yi, outcome = "EXPORT", fit=TRUE, sol = 2)

# Show a radar chart for the following boolean expression "A + ~B*Z*~C"

QCAradar(results = "A + ~B*Z*~C")




