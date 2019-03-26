library(invctr)


### Name: trimmers
### Title: Trim vector by index
### Aliases: trimmers %[-% %-]% %[-]%

### ** Examples


x <- rnorm(100)

# Trim front
x%[-%5

# Trim rear
x%-]%5

# Trim front + rear
x%[-]%c(2,10)

x%[-]%7




