library(lvec)


### Name: strlen
### Title: Get and set the maximum string length of a character lvec
### Aliases: strlen strlen<-

### ** Examples

a <- as_lvec('123')
strlen(a)  # = 3
# Strings are truncated to strlen
lset(a, 1, '123456')
print(a)  # '123'
strlen(a) <- 5
lset(a, 1, '123456')
print(a)  # '12345'




