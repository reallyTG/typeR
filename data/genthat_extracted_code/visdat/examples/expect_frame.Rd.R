library(visdat)


### Name: expect_frame
### Title: Create a dataframe to help visualise 'expected' values
### Aliases: expect_frame

### ** Examples


## Not run: 
##D dat_test <- tibble::tribble(
##D             ~x, ~y,
##D             -1,  "A",
##D             0,  "B",
##D             1,  "C"
##D             )
##D 
##D expect_frame(dat_test,
##D              ~ .x == -1)
## End(Not run)



