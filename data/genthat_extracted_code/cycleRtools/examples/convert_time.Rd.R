library(cycleRtools)


### Name: convert_time
### Title: Reformat time.
### Aliases: convert_from_time convert_time convert_to_time

### ** Examples

x <- c("00:21:05", "25:51", NA, "00:26:01.1", "01:05:02.0")
x <- convert_from_time(x)
print(x)
x <- convert_to_time(x)
print(x)




