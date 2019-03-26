library(mstrio)


### Name: update_dataset
### Title: Update a previously created dataset
### Aliases: update_dataset update_dataset,connection-method

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

# Add new rows to the dataset with update policy "add"
df2 <- df[sample(nrow(df), 5), ]
df2[, 'ID'] <- as.character(nrow(df) + seq(1:5))
update_dataset(connection = conn, data_frame = df2,
               dataset_id = mydf$datasetID,
               table_id = mydf$tableID,
               table_name = mydf$name,
               update_policy = 'add')

# Update existing data in the dataset with update policy "update"
df$Sepal_Length <- df$Sepal_Length + runif(nrow(df))
df$Petal_Width <- df$Sepal_Length + rnorm(nrow(df))
update_dataset(connection = conn, data_frame = df,
               dataset_id = mydf$datasetID,
               table_id = mydf$tableID,
               table_name = mydf$name,
               update_policy = 'update')

# Update and add new rows to the dataset with update policy "upsert"
df$Sepal_Length <- df$Sepal_Length + runif(nrow(df))
df$Petal_Width <- df$Sepal_Length + rnorm(nrow(df))
df2 <- df[sample(nrow(df), 5), ]
df2[, 'ID'] <- as.character(nrow(df) + seq(1:5))
df <- rbind(df, df2)
update_dataset(connection = conn,
               data_frame = df,
               dataset_id = mydf$datasetID,
               table_id = mydf$tableID,
               table_name = mydf$name,
               update_policy = 'upsert')

# Truncate and load new data into the dataset with update policy "replace"
df[] <- lapply(df, sample)
update_dataset(connection = conn, data_frame = df,
               dataset_id = mydf$datasetID,
               table_id = mydf$tableID,
               table_name = mydf$name,
               update_policy = 'replace')

# It is possible to update a dataset if it wasn't created in this session or by another client.
# Simply provide the dataset ID and table IDs to this function as characters.
df[] <- lapply(df, sample)  # shuffle contents of the dataframe
update_dataset(connection = conn, data_frame = df,
               dataset_id = "5E2501A411E8756818A50080EF4524C9",
               table_id = "F0DA816816432E448F1105327C119596",
               table_name = "IRIS",
               update_policy = 'replace')
## End(No test)



