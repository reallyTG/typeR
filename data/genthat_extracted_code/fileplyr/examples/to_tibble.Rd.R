library(fileplyr)


### Name: to_tibble
### Title: to_tibble
### Aliases: to_tibble

### ** Examples

# split-apply-combine
write.table(mtcars, "mtcars.csv", row.names = FALSE, sep = ",")
temp <- fileply(file     = "mtcars.csv"
             , groupby = c("carb", "gear")
             , fun     = identity
             , collect = "list"
             , sep     =  ","
             , header  = TRUE
             )
temp
to_tibble(temp)
unlink("mtcars.csv")





