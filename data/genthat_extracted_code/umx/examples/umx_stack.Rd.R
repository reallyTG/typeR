library(umx)


### Name: umx_stack
### Title: Stack data like stack() does, with more control.
### Aliases: umx_stack

### ** Examples


# Base-R stack function
df = stack(mtcars, select = c("disp", "hp"), drop=FALSE)

# umx_stack, with additional variables passed along 
df= umx_stack(mtcars, select= c("disp", "hp"), passalong= "mpg")
str(df) # ind is a factor, with levels select
ggplot2::qplot(x = mpg, y= values, color=ind, data = df)
df= umx_stack(mtcars, select= c("disp", "hp"), passalong= "mpg")
ggplot2::qplot(x = mpg, y= values, group="ind", data = df)



