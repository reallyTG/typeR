library(descr)


### Name: freq
### Title: Frequency table
### Aliases: freq

### ** Examples

x <- c(rep(1, 100), rep(2, 120), rep(3, 10), rep(NA, 12))
w <- c(rep(1.1, 122), rep(0.9, 120))
x <- factor(x, levels = c(1, 2, 3),
            labels = c("No", "Yes", "No answer"))
attr(x, "label") <- "Do you agree?"

freq(x, y.axis = "percent")
f <- freq(x, w, user.missing = "No answer", plot = FALSE)
f
plot(f)

# If the decimal separator in your country is a comma:
# options(OutDec = ",")
library(xtable)
print(xtable(f))



