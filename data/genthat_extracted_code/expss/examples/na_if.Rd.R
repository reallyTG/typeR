library(expss)


### Name: na_if
### Title: Replace certain values with NA
### Aliases: na_if na_if<- %na_if% mis_val mis_val<- %mis_val%

### ** Examples

a = c(1:5, 99)

# 99 to NA
na_if(a, 99)    # c(1:5, NA)

a %na_if% 99    # same result

# values which greater than 5 to NA
na_if(a, gt(5)) # c(1:5, NA)

set.seed(123)
dfs = data.frame(
      a = c("bad value", "bad value", "good value", "good value", "good value"),
      b = runif(5)
)

# rows with 'bad value' will be filled with NA
# logical argument and recycling by columns
na_if(dfs, dfs$a=="bad value")

a = rnorm(50)
# values greater than 1 or less than -1 will be set to NA
# special functions usage
na_if(a, lt(-1) | gt(1))

# values inside [-1, 1] to NA
na_if(a, -1 %thru% 1)



