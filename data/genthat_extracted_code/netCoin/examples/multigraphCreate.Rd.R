library(netCoin)


### Name: multigraphCreate
### Title: Produce interactive multi graphs.
### Aliases: multigraphCreate

### ** Examples

# A character column (with separator)
frame <- data.frame(A = c("Man; Women", "Women; Women",
                        "Man; Man", "Undet.; Women; Man"))
data <- dichotomize(frame, "A", sep = "; ")[2:4]
C <- coin(data) # coincidence matrix
N <- asNodes(C) # node data frame
E <- edgeList(C,c("frequency","expected","haberman")) # edge data frame
bC<- barCoin(N,E) # barCoin object
cC<- cbarCoin(N,E) # barCoin object
nC<- netCoin(N,E) # netCoin object
multigraphCreate("Bar graph" = bC,
                  "Conditional bar graph" = cC, 
                  "Net graph"=nC, 
                  dir="./example", show = FALSE) # See ./example/index.html file



