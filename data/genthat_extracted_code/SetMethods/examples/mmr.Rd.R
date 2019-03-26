library(SetMethods)


### Name: mmr
### Title: Function for performing set-theoretic multi-method research.
### Aliases: mmr
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

# Get typical cases for each focal conjunct in the third term of the parsimonious solution:

mmr(results = sol_yp, outcome = "EXPORT", match=FALSE, cases=2, term = 3)

# Get matching typical-typical cases for the second term of the parsimonious solution:

mmr(results = sol_yp, outcome = "EXPORT", match=TRUE, cases=1, term = 2)

# Get matching typical-DCN cases:

mmr(results = sol_yp, outcome = "EXPORT", match=TRUE, cases=3)




