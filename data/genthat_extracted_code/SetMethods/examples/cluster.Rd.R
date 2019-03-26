library(SetMethods)


### Name: cluster
### Title: Diagnostic tool for clustered data
### Aliases: cluster
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

cluster(SCHLF, sol_yi, "EXPORT", unit_id = "COUNTRY", 
              cluster_id = "YEAR", sol = 2)
              
# or:

cluster(SCHLF, sol_yi, "EXPORT", unit_id = "COUNTRY", 
              cluster_id = "YEAR", sol = "c1p1i2")

# Get pooled, within, and between consistencies for EMP as necessary for EXPORT:

cluster(SCHLF, results="EMP", outcome="EXPORT", unit_id = "COUNTRY", 
              cluster_id = "YEAR", necessity=TRUE)
# or:

cluster(results=SCHLF$EMP, outcome=SCHLF$EXPORT, unit_id = SCHLF$COUNTRY, 
              cluster_id = SCHLF$YEAR, necessity=TRUE)
              
# Get pooled, within, and between consistencies for ~EMP as necessary for EXPORT:

cluster(SCHLF, results="~EMP", outcome="EXPORT", unit_id = "COUNTRY", 
              cluster_id = "YEAR", necessity=TRUE)
# or:

cluster(results=1-SCHLF$EMP, outcome=SCHLF$EXPORT, unit_id = SCHLF$COUNTRY, 
              cluster_id = SCHLF$YEAR, necessity=TRUE)                  
              
# Get pooled, within, and between consistencies for EMP*~MA*STOCK as sufficient for EXPORT:

cluster(SCHLF, "EMP*~MA*STOCK", "EXPORT", unit_id = "COUNTRY", 
              cluster_id = "YEAR") 
              
# Get pooled, within, and between consistencies for EMP*MA + ~STOCK as sufficient for ~EXPORT:

cluster(SCHLF, "EMP*MA + ~STOCK", "~EXPORT", unit_id = "COUNTRY", 
              cluster_id = "YEAR")              



