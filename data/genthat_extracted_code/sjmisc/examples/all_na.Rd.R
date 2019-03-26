library(sjmisc)


### Name: all_na
### Title: Check if vector only has NA values
### Aliases: all_na

### ** Examples

x <- c(NA, NA, NA)
y <- c(1, NA, NA)

all_na(x)
all_na(y)
all_na(data.frame(x, y))
all_na(list(x, y))





