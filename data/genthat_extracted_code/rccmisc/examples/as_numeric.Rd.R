library(rccmisc)


### Name: as_numeric
### Title: Test object for, or coerce to, numeric
### Aliases: as_numeric is_numeric

### ** Examples

df <- data.frame(v = c("46513", "45"))
class(df$v) # factor

# Note that
as.numeric(df$v) # 2 1
# but
as_numeric(df$v) # 46513    45

is_numeric(1) # TRUE
is_numeric("1") # TRUE
is_numeric(as.factor(1)) # TRUE
is_numeric(as.factor("khb")) # FALSE



