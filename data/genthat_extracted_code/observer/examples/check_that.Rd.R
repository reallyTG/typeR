library(observer)


### Name: check_that
### Title: Check your data
### Aliases: check check_that check_that_ ensure ensure_that ensure_that_

### ** Examples

library(magrittr)

observe.mydata <- function(.data, ...) {
  observe_if_(.data, 
              ~ Year > 2010, 
              ~ City %in% c("Paris", "New York"), 
              ~ Population > 0)
}

df <- data.frame(City = c("Paris", "New York", "Amsterdam"), 
                 Year = c(2011, 2015, 2016), 
                 Population = c(2249975, 8550405, 840486))
class(df) <- c("mydata", "data.frame")
observe(df)
observe(df) %>% obs()
check(df)  # FALSE
## Not run: 
##D ensure(df) # throws an error
## End(Not run)




