library(dataframes2xls)


### Name: write.xls
### Title: WRITE XLS DATA FILES
### Aliases: write.xls
### Keywords: file

### ** Examples

# Create some simple data frames:

df1 = as.data.frame (c(1,2))
df1$col1 = (c(1,2))
df1$col2 = (c(3,4))
df1$col3 = (c(5,6))
df1[1] = NULL 

df2 = as.data.frame (c(1,2))
df2$col1 = (c(10.10101010101,20))
df2$col2 = (c(30.25,40))
df2$col3 = (c(50E2,60))
df2[1] = NULL 

# Create a format string: 

fmts = "0:0::1:0%:::0:general::1:0.0"

# Note this format string might also have been written as: 
#
# fmts = "0:0::1:0%,0:general::1:0.0"

# The first column (column number 0) of Sheet1 will have "0" 
# as its format (i.e. it will presented as an integer). 
#
# The second column (column number 1) of Sheet1 will have "0%" 
# as its format (i.e. it will be presented as a percentage). 

# The first column (column number 0) of Sheet2 will have 
# "general" as its format (i.e. it will be presented as provided 
# in the data frame).
# 
# The second column (column number 1) of Sheet2 will have "0.0" 
# as its format (i.e. it will be presented as a float with 
# one digit). 

# Let us specify some xls file names: 

ofn1 = paste(tempdir(),"/tenure_rownames_false.xls",sep="")
ofn2 = paste(tempdir(),"/tenure_rownames_default.xls",sep="")
ofn3 = paste(tempdir(),"/tenure_rownames_true.xls",sep="")

# Now write the dataframes with the format string being applied 
# per column: 

write.xls(c(df1,df2), ofn1, formats=fmts)  

# the data frames may also be written with the format string 
# being applied per row: 

t.fmts = "true:::true"

# Note that this t.formats string might also have been 
# written as: 
#
# t.fmts = "true,true"
# 
# or: 
#
# t.fmts = "true"
#
# or as:  
#
# t.fmts = TRUE

write.xls(c(df1,df2), ofn2, formats=fmts, t.formats=t.fmts) 

# Now we write the data frames with row names but without column 
# names 

rownames = c("first row","second row")

row.names(df1) = rownames 

mat1 = as.matrix(df1)
mat2 = as.matrix(df2)

write.xls(c(mat1,mat2), ofn3, row.names="true", col.names="false") 

# You may now inspect the xls files 

keypressed = readline()

# until we clean them up: 

system (paste("rm ",ofn1, sep = ""))
system (paste("rm ",ofn2, sep = ""))
system (paste("rm ",ofn3, sep = ""))



