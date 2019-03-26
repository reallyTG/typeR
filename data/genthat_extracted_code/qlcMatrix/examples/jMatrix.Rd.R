library(qlcMatrix)


### Name: jMatrix
### Title: Harmonize ('join') sparse matrices
### Aliases: jMatrix jcrossprod tjcrossprod

### ** Examples

# example about INNER JOIN from wikipedia
# http://en.wikipedia.org/wiki/Sql_join#Inner_join
# this might look complex, but it is maximally efficient on large sparse matrices

# Employee table as sparse Matrix
Employee.LastName <- c("Rafferty","Jones","Heisenberg","Robinson","Smith","John")
Employee.DepartmentID <- c(31,33,33,34,34,NA)
E.LN <- ttMatrix(Employee.LastName, simplify = TRUE)
E.DID <- ttMatrix(Employee.DepartmentID, simplify = TRUE)

( Employees <- tcrossprod(E.LN, E.DID) )

# Department table as sparse Matrix
Department.DepartmentID <- c(31,33,34,35)
Department.DepartmentName <- c("Sales","Engineering","Clerical","Marketing")
D.DID <- ttMatrix(Department.DepartmentID, simplify = TRUE)
D.DN <- ttMatrix(Department.DepartmentName, simplify = TRUE)

( Departments <- tcrossprod(D.DN, D.DID) )

# INNER JOIN on DepartmentID (i.e. on the columns of these two matrices)
# result is a sparse matrix linking Employee.LastName to Department.DepartmentName, 
# internally having used the DepartmentID for the linking

( JOIN <- tjcrossprod(Employees, Departments) )

# Note that in this example it is much easier to directly use jMatrix on the DepartmentIDs
# instead of first making sparse matrices from the data
# and then using tjcrossprod on the matrices to get the INNER JOIN
# (only the ordering is different in this direct approach)

J <- jMatrix(Employee.DepartmentID, Department.DepartmentID)
JOIN <- crossprod(J$M1, J$M2)
rownames(JOIN) <- Employee.LastName
colnames(JOIN) <- Department.DepartmentName
JOIN



