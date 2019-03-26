library(hansard)


### Name: lords_attendance_session
### Title: House of Lords attendance by session
### Aliases: lords_attendance_session hansard_lords_attendance_session

### ** Examples

## Not run: 
##D x <- lords_attendance_session(session_id = 706178)
##D 
##D #Returns a list of data frames with details of
##D attendance for each day of a given vector of sessions.
##D u <- lords_sessions(start_date='2017-01-01')
##D m <- lapply(u$about, lords_attendance_session)
##D 
## End(Not run)



