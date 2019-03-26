library(VarBundle)


### Name: varbundle
### Title: Create bundle of variables.
### Aliases: varbundle

### ** Examples

# Access via $
sales <- varbundle(list(min = 1, max = 10))
sales$min

# Access via name
my_var <- field_names(sales)[1]
sales[[my_var]]

# Create data.frame
df <- sales$as.data.frame()

# Create VarBundle from data.frame
corp_sales <- varbundle(df)
class(corp_sales)




