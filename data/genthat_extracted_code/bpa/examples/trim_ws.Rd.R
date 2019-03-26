library(bpa)


### Name: trim_ws
### Title: Remove Leading/Trailing Whitespace
### Aliases: trim_ws

### ** Examples

# Toy example
d <- data.frame(x = c(" a ", "b ", "c"),
                y = c("   1 ", "2", " 3"),
                z = c(4, 5, 6))
print(d)  # print data as is
trim_ws(d)  # print data with whitespace trimmed off
sapply(trim_ws(d), class)  # check that column types are preserved



