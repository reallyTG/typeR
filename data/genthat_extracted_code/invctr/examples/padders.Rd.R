library(invctr)


### Name: padders
### Title: Padd vector by index
### Aliases: padders %[+% %+]% %[+]%

### ** Examples


x <- rnorm(100)

# Pad front with 10 zeros
x%[+%10
# Same as
x%[+%c(10,0)

# Pad rear with zeros
x%+]%10
# Same as
x%+]%c(10,0)

# Pad front + rear with NA
x%[+]%c(NA,10)

# Pad front + rear of a character vector
"yes"%[+]%c(2,"no")
"yes"%[+]%c(1,"no")
"yes"%[+]%c(0,"no")




