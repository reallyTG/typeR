library(SetMethods)


### Name: cluster.minimize
### Title: Diagnostic tool for clustered data
### Aliases: cluster.minimize
### Keywords: QCA

### ** Examples


# Import your clustered data in the long format. 
# For example:

data(SCHLF)

# Get the intermediate solution:

sol_yi <- minimize(SCHLF, outcome = "EXPORT",
                conditions = c("EMP","BARGAIN","UNI","OCCUP","STOCK", "MA"),
                incl.cut = .9, 
                include = "?", 					   
                details = TRUE, show.cases = TRUE, dir.exp = c(0,0,0,0,0,0))

# Get pooled, within, and between consistencies for the second intermediate solution:

cluster.minimize(results = sol_yi, data = SCHLF, outcome = "EXPORT", unit_id = "COUNTRY", 
              cluster_id = "YEAR", sol = 2)



