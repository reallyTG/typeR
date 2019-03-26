library(lifelogr)


### Name: Person
### Title: A 'Person' object is a complete view of an individual over a
###   certain time period, as seen through data from multiple sources
### Aliases: Person
### Keywords: datasets

### ** Examples

library("lifelogr")
 
group_months <- data.frame("month" = c("Jan", "Feb", "Mar", "Apr", "May",
                                       "Jun", "Jul", "Aug",
                                       "Sep", "Oct", "Nov", "Dec"),
                                       "group" = c(0, 0, 0, 1, 1, 1, 1, 1, 
                                                   1, 0, 0, 0))
ash <- Person$new(user_info = list("name" = "Ash", "age" = 26,
                    "gender" = "female"), 
                    target_steps = 20000,
                    group_assignments = list("group_months" = group_months),
                    start_date = "2017-03-11",
                    end_date = "2017-03-12")

## Not run: 
##D                 
##D bailey <- Person$new(fitbit_user_email = "bailey@gmail.com",
##D                  fitbit_user_pw = "baileypw",
##D                  #apple_data_file = "apple.csv",
##D                  start_date = "2017-03-11",
##D                  end_date = "2017-03-12")
## End(Not run)
                 



