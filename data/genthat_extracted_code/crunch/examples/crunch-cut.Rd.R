library(crunch)


### Name: crunch-cut
### Title: Cut a numeric Crunch variable
### Aliases: crunch-cut cut,NumericVariable-method

### ** Examples

## Not run: 
##D ds <- loadDataset("mtcars")
##D ds$cat_var <- cut(ds$mpg, breaks = c(10, 15, 20),
##D     labels = c("small", "medium"), name = "Fuel efficiency")
##D ds$age <- sample(1:100, 32)
##D ds$age4 <- cut(df$age, c(0, 30, 45, 65, 200),
##D            c("Youth", "Adult", "Middle-aged", "Elderly"),
##D            name = "Age (4 category)")
## End(Not run)



