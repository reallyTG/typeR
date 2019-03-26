library(TSDT)


### Name: get_y
### Title: get_y
### Aliases: get_y

### ** Examples

## Create an example data.frame
df <- data.frame( y <- 1:5 )
names( df ) <- "y"
df$time <- 10:14
df$time2 <- 20:24
df$event <- sample( c(0:1), size = 5, replace = TRUE )
df$trt <- sample( c("Control","Treatment"), size = 5, replace = TRUE )
df$x1 <- runif( n = 5 )
df$x2 <- LETTERS[1:5]

## Select the y variable by name
get_y( df, scoring_function_parameters = list( y_var = 'y' ) )

## Select the y variable by column index
get_y( df, scoring_function_parameters = list( y_col = 1 ) )

## The default behavior works for this example because the y variable in df
## is actually called y.
get_y( df )

## If the user's data does not contain a variable called
## 'y' the default behavior will fail. In this case the user must explicitly
## identify the 'y' variable via one of the two previous methods.
names( df )[which(names(df) == "y")] <- "response" # rename the 'y' variable to 'response'

get_y( df )  # now default behavior fails (i.e. returns NULL)

get_y( df, scoring_function_parameters = list( y_var = 'response' ) ) # this works



