library(SetMethods)


### Name: matches.suf.typiir
### Title: Match typical cases and individually irrelevant cases for each
###   conjunct in a sufficient term.
### Aliases: matches.suf.typiir
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


# Match typical cases and individually irrelevant cases for each conjunct 
# for the first term (default) of the parsimonious solution and return only the best 3 pairs:

matches.suf.typiir(results = sol_yp, outcome = "EXPORT", max_pairs=2)

# Get the parsimonious solution for the absence of the outcome:

sol_nyp <- minimize(SCHF, outcome = "EXPORT", neg.out = TRUE,
                conditions = c("EMP","BARGAIN","UNI","OCCUP","STOCK", "MA"),
                incl.cut = .9, 
                include = "?", 					   
                details = TRUE, show.cases = TRUE)

# Match typical cases and individually irrelevant cases for each conjunct for 
# the first term of the second parsimonious solution for the absence of the outcome:

matches.suf.typiir(results = sol_nyp, outcome = "EXPORT", neg.out = TRUE, term = 1, sol = 2)

# since it has only one condition, it cannot find pairs based on the INUS principle!




