library(linear.tools)


### Name: get_valid_rows
### Title: identify missing rows for model/formula.
### Aliases: get_valid_rows

### ** Examples


model = lm(price ~ carat, head(ggplot2::diamonds,1000))
data = head(ggplot2::diamonds,10)

# so observation 1, 4, 7 will be not valid rows
data[c(1,4,7),"price"] = NA
data
get_valid_rows(model,data)

# error message as no "price" is found in the data
data[,"price"] = NULL
tryCatch(get_valid_rows(model,data),
         error = function(x){
           print(x)
         })




