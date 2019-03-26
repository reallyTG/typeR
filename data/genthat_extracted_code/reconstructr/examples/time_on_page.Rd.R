library(reconstructr)


### Name: time_on_page
### Title: Calculate time-on-page metrics
### Aliases: time_on_page

### ** Examples

#Load and sessionise the dataset
data("session_dataset")
sessions <- sessionise(session_dataset, timestamp, uuid)

# Calculate overall time on page
top <- time_on_page(sessions)

# Calculate time-on-page on a per_session basis
per_session <- time_on_page(sessions, by_session = TRUE)

# Use median instead of mean
top_med <- time_on_page(sessions, median = TRUE)




