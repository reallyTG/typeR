library(expss)


### Name: sheet
### Title: Make data.frame without conversion to factors and without fixing
###   names
### Aliases: sheet as.sheet .sheet

### ** Examples


# see the difference
df1 = data.frame(a = letters[1:3], "This is my long name" = 1:3)
df2 = sheet(a = letters[1:3], "This is my long name" = 1:3)

str(df1)
str(df2)


data(iris)
default_dataset(iris)

.sheet(Sepal.Width,  Sepal.Length)




