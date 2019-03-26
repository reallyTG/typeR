library(chunkR)


### Name: chunkR-package
### Title: Read Tables in Chunks
### Aliases: chunkR-package chunkR
### Keywords: package

### ** Examples

data(iris)

# write iris as tab delimited file. Note that quote is set to FALSE

tmp_path <- file.path(tempdir(),"iris.txt")
write.table(iris, tmp_path, quote = FALSE)

#----------------------------------------------------------------#
#--- Reading a data frame with automatic column-type detection ---#
#----------------------------------------------------------------#

# create a 'chunker' object passing the path of the input file.
my_chunker_object <- chunker(tmp_path, chunksize = 30)

# read a chunk
next_chunk(my_chunker_object)

# get the chunk
 get_table(my_chunker_object)

# read another chunk
next_chunk(my_chunker_object)

# get the number of lines already read
get_completed(my_chunker_object)


#--- read a csv file ---#

tmp_path_csv <- file.path(tempdir(),"iris.csv")

write.table(iris, tmp_path_csv, quote = FALSE, sep = ",")

# read the csv indicating the value of the sep parameter
my_chunker_object2 <- chunker(tmp_path_csv, chunksize = 30, sep = ",")
# the file can  then be processed as with tab delimiters

# remove temporal file
file.remove(tmp_path_csv)

#-------------------------------------------------------#
#--- Reading a data frame using column types argument ---#
#-------------------------------------------------------#

## Four types can be passed : "character", "numeric" (aka "double"), "integer", "logical"

# create a 'chunker' object passing the path of the input file.
my_chunker_object3 <- chunker(tmp_path, chunksize = 120,
 columns_classes = c("numeric", "numeric", "numeric","numeric", "character"))

# read a chunk
next_chunk(my_chunker_object3)

# get the chunk
get_table(my_chunker_object3)

# read another chunk
next_chunk(my_chunker_object3)

# get the number of lines already read
get_completed(my_chunker_object3)


#-------------------------#
#--- Reading a matrix  ---#
#-------------------------#

my_chunker_object4 <- chunker(tmp_path, chunksize = 30, data_format= "matrix")

# store the chunk as a character matrix in R
this_data <- get_table(my_chunker_object4)


# The package provides a fast generic C++ function for conversion from
# matrix (any R type) to data frame
this_data_as_df2 <- matrix2df(this_data)

# remove temporal file
file.remove(tmp_path)


 ## Not run: 
##D #----------------------------------#
##D #--- Example with a big table -----#
##D #----------------------------------#
##D 
##D ### Example with a data frame
##D 
##D # create a large data frame, and write it in a temporal directory
##D 
##D tmp_path <- file.path(tempdir(),"big_table.txt")
##D 
##D out <- data.frame(numeric_data = runif(1000000),
##D                   character_data = sample(c("a", "t", "c", "g"), 1000000, 
##D                   replace = TRUE),
##D                   integer_data = sample(1000000),
##D                   bool_data = sample(c(TRUE, FALSE), 1000000, replace = TRUE))
##D 
##D 
##D write.table(out, tmp_path, quote = FALSE)
##D 
##D # create a chunker object, reading in chunks of 10000 lines
##D my_chunker_object5 <- chunker(tmp_path, chunksize = 10000)
##D 
##D next_chunk(my_chunker_object5)
##D data <- get_table(my_chunker_object5) 
##D 
##D # check classes
##D lapply(data,typeof)
##D file.remove(tmp_path)
##D 
##D 
##D ### Example with a matrix
##D 
##D # create a large matrix, and write it in a temporal directory
##D 
##D my_table <- tempfile()
##D write.table(matrix(sample(c("a", "t", "c", "g"), 1000000, replace = TRUE), 
##D 100000, 1000), my_table, quote = FALSE)
##D 
##D # create a chunker object, reading in chunks of 10000 lines
##D my_chunker_object6 <- chunker(my_table, chunksize = 10000, data_format= "matrix")
##D 
##D # create a loop to read all the file and make something with it
##D 
##D lines <- 0
##D while(next_chunk(my_chunker_object6))
##D {
##D   data <- get_table(my_chunker_object6) 
##D   
##D   # do something with data, e.g., convert to data frame first
##D   data <- matrix2df(data)
##D   
##D   lines <- lines + nrow(data)
##D   cat("Processed ", lines, "lines\n")
##D }
##D 
##D # remove the temporal file
##D file.remove(my_table)
## End(Not run)



