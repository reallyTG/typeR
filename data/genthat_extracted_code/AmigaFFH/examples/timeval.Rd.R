library(AmigaFFH)


### Name: timeval
### Title: Get an Amiga timeval struct value from raw data
### Aliases: timeval

### ** Examples

## First four raw values represent seconds, the latter four microseconds:
temp <- timeval(as.raw(c(0, 0, 0, 1, 0, 0, 0, 1)))
print(temp)

## You can use 'as.raw' to get the original raw data again:
as.raw(temp)



