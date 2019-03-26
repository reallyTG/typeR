library(TSDT)


### Name: get_trt
### Title: get_trt
### Aliases: get_trt

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

## Select the trt variable by name
get_trt( df, scoring_function_parameters = list( trt_var = 'trt' ) )

## Select the trt variable by column index
get_trt( df, scoring_function_parameters = list( trt_col = 5 ) )

## The default behavior works for this example because the trt variable in df
## is actually called trt.
get_trt( df )

## If the user's data does not contain a variable called
## 'y' the default behavior will fail. In this case the user must explicitly
## identify the 'y' variable via one of the two previous methods.
names( df )[which(names(df) == "trt")] <- "treatment" # rename the 'trt' variable to 'treatment'

get_trt( df )  # now default behavior fails (i.e. returns NULL)

get_trt( df, scoring_function_parameters = list( trt_var = 'treatment' ) ) # this works



