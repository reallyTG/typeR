library(lessR)


### Name: Merge
### Title: Merge Two Data Frames Horizontally or Vertically
### Aliases: Merge mrg
### Keywords: merge

### ** Examples

# Horizontal
#-----------
d <- Read("Employee", in.lessR=TRUE, quiet=TRUE)
Emp1a <- Subset(1:4, columns = c("Years", "Gender", "Dept", "Salary"))
Emp1b <- Subset(1:4, columns = c("JobSat", "Plan"))
# horizontal merge
d <- Merge(Emp1a, Emp1b, by="row.names")
# suppress output to console
d <- Merge(Emp1a, Emp1b, by="row.names", quiet=TRUE)

# Vertical
#---------
d <- Read("Employee", in.lessR=TRUE, quiet=TRUE)
Emp2a <- Subset(1:4)
Emp2b <- Subset(7:10)
# vertical merge
d <- Merge(Emp2a, Emp2b)





