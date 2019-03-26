library(visdat)


### Name: vis_expect
### Title: Visualise whether a value is in a data frame
### Aliases: vis_expect

### ** Examples


dat_test <- tibble::tribble(
            ~x, ~y,
            -1,  "A",
            0,  "B",
            1,  "C",
            NA, NA
            )

vis_expect(dat_test, ~.x == -1)

## Not run: 
##D vis_expect(airquality, ~.x == 5.1)
##D 
##D # explore some common NA strings
##D 
##D common_nas <- c(
##D "NA",
##D "N A",
##D "N/A",
##D "na",
##D "n a",
##D "n/a"
##D )
##D 
##D dat_ms <- tibble::tribble(~x,  ~y,    ~z,
##D                          1,   "A",   -100,
##D                          3,   "N/A", -99,
##D                          NA,  NA,    -98,
##D                          "N A", "E",   -101,
##D                          "na", "F",   -1)
##D 
##D vis_expect(dat_ms, ~.x %in% common_nas)
##D 
## End(Not run)




