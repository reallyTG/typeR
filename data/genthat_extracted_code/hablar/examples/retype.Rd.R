library(hablar)


### Name: retype
### Title: Return simple data types
### Aliases: retype retype.default retype.logical retype.integer
###   retype.Date retype.POSIXct retype.numeric retype.list
###   retype.data.frame

### ** Examples

# Dates
dte <- as.Date(c("2018-01-01", "2016-03-21", "1970-01-05"))
retype(dte)
retype(dte)

# Factors
fct <- as.factor(c("good", "bad", "average"))
retype(dte)

# Character that only contains numeric elements
num_chr <- c("3","4.0", "3,5")
retype(num_chr)

# Logical
lgl <- c(TRUE, FALSE, TRUE)
retype(lgl)

# Data frame with all the above vectors
df <- data.frame(dte = dte, 
                 fct = fct, 
                 num_chr = num_chr, 
                 lgl = lgl, 
                 stringsAsFactos = FALSE)
df
retype(df)




