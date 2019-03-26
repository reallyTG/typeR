library(reconstructr)


### Name: session_length
### Title: Calculate session length
### Aliases: session_length

### ** Examples

#Load and sessionise the dataset
data("session_dataset")
sessions <- sessionise(session_dataset, timestamp, uuid)

# Calculate session length
len <- session_length(sessions)




