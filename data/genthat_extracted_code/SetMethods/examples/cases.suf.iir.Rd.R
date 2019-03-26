library(SetMethods)


### Name: cases.suf.iir
### Title: List individually irrelevant cases for sufficiency.
### Aliases: cases.suf.iir
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

# Get the intermediate solution:

sol_yi <- minimize(SCHF, outcome = "EXPORT",
                conditions = c("EMP","BARGAIN","UNI","OCCUP","STOCK", "MA"),
                incl.cut = .9, 
                include = "?", 					   
                details = TRUE, show.cases = TRUE, dir.exp = c(0,0,0,0,0,0))
                


# Return individually irrelevant cases for sufficiency for the parsimonious solution:

cases.suf.iir(results = sol_yp, outcome = "EXPORT")

# Return individually irrelevant cases cases for sufficiency for the intermediate solution:

cases.suf.iir(results = sol_yi, outcome = "EXPORT")

# Get the parsimonious solution for the absence of the outcome:

sol_nyp <- minimize(SCHF, outcome = "EXPORT", neg.out = TRUE,
                conditions = c("EMP","BARGAIN","UNI","OCCUP","STOCK", "MA"),
                incl.cut = .9, 
                include = "?", 					   
                details = TRUE, show.cases = TRUE)

# Return individually irrelevant cases for sufficiency for the second parsimonious solution 
# for the absence of the outcome:

cases.suf.iir(results = sol_nyp, outcome = "EXPORT", neg.out = TRUE, sol = 2)



