library(expss)


### Name: if_na
### Title: Replace NA values in vector/data.frame/matrix/list with supplied
###   value
### Aliases: if_na if_na<- %if_na%

### ** Examples

# simple case
a = c(NA, 2, 3, 4, NA)
if_na(a, 99)

# the same result
a %if_na% 99

# the same result
if_na(a) = 99 
a # c(99, 2, 3, 4, 99)


# replacement with values from other variable
a = c(NA, 2, 3, 4, NA)
if_na(a) = 1:5
a # 1:5

# replacement with group means

# make data.frame 
set.seed(123)
group = sample(1:3, 30, replace = TRUE)
param = runif(30)
param[sample(30, 10)] = NA # place 10 NA's
df = data.frame(group, param)

# replace NA's with group means
df = compute(df, {
        if_na(param) = window_fun(param, group, mean_col)
    })

df

# replacement with column means

# make data.frame
set.seed(123)
x1 = runif(30)
x2 = runif(30)
x3 = runif(30)
x1[sample(30, 10)] = NA # place 10 NA's
x2[sample(30, 10)] = NA # place 10 NA's
x3[sample(30, 10)] = NA # place 10 NA's

df = data.frame(x1, x2, x3)

# replace NA's with column means
if_na(df) = t(mean_col(df))

df




