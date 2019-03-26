library(SetMethods)


### Name: pimplot
### Title: Prime implicants, truth table rows, and necessity plots.
### Aliases: pimplot
### Keywords: QCA

### ** Examples

# Import your data. For example:

data(SCHF)

# Get the parsimonious solution:


sol_yp <- minimize(SCHF, outcome = "EXPORT",
                conditions = c("EMP","BARGAIN","UNI","OCCUP","STOCK", "MA"),
                incl.cut = .9, 
                include = "?", 					   
                details = TRUE, show.cases = TRUE)

# Plot the prime implicants of the parsimonious solution:

pimplot(data = SCHF, results = sol_yp, outcome = "EXPORT")

# Plot all truth table rows with a consistency higher than 0.95:

pimplot(data=SCHF, results = sol_yp, incl.tt=0.97, outcome = "EXPORT", sol = 1)

# Plot truth table row "60":

pimplot(data=SCHF, results = sol_yp, ttrows =c("60"), 
        outcome = "EXPORT", sol = 1)

# For plotting results of necessity analyses using superSubset,
# the first stept is to obtain an "sS" object:

SUPSUB <- superSubset(SCHF, outcome="EXPORT", 
                      conditions = c("EMP","BARGAIN","UNI","OCCUP","STOCK", "MA"), 
                      relation = "necessity", incl.cut = 0.996)
SUPSUB

# This can be imputed as result and necessity should be set to \code{TRUE}:

pimplot(data = SCHF, results = SUPSUB, outcome = "EXPORT", necessity = TRUE)




