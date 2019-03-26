library(SetMethods)


### Name: cases.suf.typ.fct
### Title: List cases typical with regards to sufficiency for each focal
###   conjunct.
### Aliases: cases.suf.typ.fct
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


# Return typical cases for sufficiency for the parsimonious solution:

cases.suf.typ.fct(results = sol_yp, outcome = "EXPORT")

# Return typical cases for sufficiency for the intermediate solution:

cases.suf.typ.fct(results = sol_yi, outcome = "EXPORT")

# Get the parsimonious solution for the absence of the outcome:

sol_nyp <- minimize(SCHF, outcome = "EXPORT", neg.out = TRUE,
                conditions = c("EMP","BARGAIN","UNI","OCCUP","STOCK", "MA"),
                incl.cut = .9, 
                include = "?", 					   
                details = TRUE, show.cases = TRUE)

# Return typical cases for sufficiency for the second parsimonious solution 
# for the absence of the outcome:

cases.suf.typ.fct(results = sol_nyp, outcome = "EXPORT", neg.out = TRUE, sol = 2)



