library(MatrixEQTL)


### Name: SlicedData-class
### Title: Class 'SlicedData' for storing large matrices
### Aliases: SlicedData SlicedData-class [[,SlicedData-method
###   [[<-,SlicedData-method colnames,SlicedData-method
###   colnames<-,SlicedData-method dim,SlicedData-method
###   length,SlicedData-method ncol,SlicedData-method
###   NCOL,SlicedData-method nrow,SlicedData-method NROW,SlicedData-method
###   rownames,SlicedData-method rownames<-,SlicedData-method
###   show,SlicedData-method as.matrix,SlicedData-method
###   rowMeans,SlicedData-method rowSums,SlicedData-method
###   colMeans,SlicedData-method colSums,SlicedData-method
###   summary.SlicedData
### Keywords: classes

### ** Examples

# Create a SlicedData variable
sd = SlicedData$new()    

# Show the details of the empty object
show(sd)    

# Create a matrix of values and assign to sd
mat = matrix(1:12, 3, 4)    
rownames(mat) = c("row1", "row2", "row3")    
colnames(mat) = c("col1", "col2", "col3", "col4")    
sd$CreateFromMatrix( mat )    

# Show the detail of the object (one slice)
show(sd)    

# Slice it in pieces of 2 rows
sd$ResliceCombined(sliceSize = 2L)    

# Show the number of slices (equivalent function calls)
sd$nSlices()
length(sd)

# Is it all in one slice? (No)
sd$IsCombined()

# Show the column names (equivalent function calls)
sd$columnNames
colnames(sd)

# Show row name slices
sd$rowNameSlices

# Show all row names (equivalent function calls)
sd$GetAllRowNames()
rownames(sd)

# Print the second slice
print(sd[[2]])

# Reorder and subset columns
sd$ColumnSubsample( c(1,3,4) )    

# Reorder and subset rows
sd$RowReorder( c(3,1) )    

# Show the detail of the object (one slice again)
show(sd)    

# Is it all in one slice? (Yes)
sd$IsCombined()

# Find the row with name "row1" (it is second in the first slice)
sd$FindRow("row1")    




