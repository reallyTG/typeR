library(reconstructr)


### Name: session_count
### Title: Count the number of sessions in a sessionised dataset
### Aliases: session_count

### ** Examples

#Load and sessionise the dataset
data("session_dataset")
sessions <- sessionise(session_dataset, timestamp, uuid)

# Calculate overall bounce rate
count <- session_count(sessions)

# Calculate session count on a per-user basis
per_user <- session_count(sessions, user_id = uuid)




