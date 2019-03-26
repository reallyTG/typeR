library(reconstructr)


### Name: bounce_rate
### Title: calculate the bounce rate within a session dataset
### Aliases: bounce_rate

### ** Examples

#Load and sessionise the dataset
data("session_dataset")
sessions <- sessionise(session_dataset, timestamp, uuid)

# Calculate overall bounce rate
rate <- bounce_rate(sessions)

# Calculate bounce rate on a per-user basis
per_user <- bounce_rate(sessions, user_id = uuid)




