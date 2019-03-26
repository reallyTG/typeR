library(mstrio)


### Name: create_dataset
### Title: Create an in-memory MicroStrategy dataset
### Aliases: create_dataset create_dataset,connection-method

### ** Examples

## No test: 
df <- iris

# Create a primary key
df$ID <- as.character(row.names(df))

# Remove periods and other special characters due to their
# special role in MicroStrategy. But, "_" is ok.
names(df) <- c("Sepal_Length", "Sepal_Width", "Petal_Length", "Petal_Width", "Species", "ID")

# Create the dataset
mydf <- create_dataset(connection = conn,
                       data_frame = df,
                       dataset_name = "IRIS",
                       table_name = "IRIS")

# You can specify special treatment for columns within the data frame.
# This will convert the character-formatted row ID's to a MicroStrategy metric
mydf <- create_dataset(connection = conn,
                       data_frame = df,
                       dataset_name = "IRIS",
                       table_name = "IRIS",
                       to_metric = c("ID"))

# This will convert 'Sepal_Length' and 'Sepal_Width' to attributes
mydf <- create_dataset(connection = conn,
                       data_frame = df,
                       dataset_name = "IRIS",
                       table_name = "IRIS",
                       to_attribute = c("Sepal_Length", "Sepal_Width"))
## End(No test)



