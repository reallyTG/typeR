library(numform)


### Name: f_num
### Title: Format Digits
### Aliases: f_num ff_num

### ** Examples

f_num(c(0.0, 0, .2, -00.02, 1.122222, pi))
f_num(rnorm(10))
f_num(rnorm(20, 100, 200), 0)
f_num(c("-0.23", "0", ".23"))

## Percents
f_num(c(30, 33.45, .1), 3, s="%")

## Money
f_num(c(30, 33.45, .1), 2, p="$")

## Units
f_num(c(30, 33.45, .1), 2, s=" in.<sup>2</sup>")
f_num(c(30, 33.45, .1), 2, p="&Chi;<sup>2</sup>=")

## Not run: 
##D library(dplyr)
##D is.int <- function(x) !all(x %% 1 == 0)
##D 
##D mtcars %>%
##D     mutate_if(.funs = f_num, is.int)
##D 
##D df <- data.frame(x = -10:10, y = (-10:10)/10)
##D 
##D ggplot(df, aes(x, y))+
##D     geom_point() +
##D     scale_y_continuous(labels = ff_num(zero = 0))
## End(Not run)



