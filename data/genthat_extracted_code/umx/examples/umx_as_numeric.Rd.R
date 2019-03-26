library(umx)


### Name: umx_as_numeric
### Title: umx_as_numeric
### Aliases: umx_as_numeric

### ** Examples

df = mtcars
# make mpg into string
df$mpg = as.character(df$mpg)
df$cyl = factor(df$cyl)
df = umx_as_numeric(df); str(df)
df = umx_as_numeric(df, force=TRUE); str(df)
# Make one variable alpha
df$mpg = c(letters,letters[1:6]); str(df)
df = umx_as_numeric(df, force=TRUE); str(df)



