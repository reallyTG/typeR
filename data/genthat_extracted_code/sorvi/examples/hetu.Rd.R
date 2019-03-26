library(sorvi)


### Name: hetu
### Title: Extract information from Finnish personal identification numbers
###   (hetu)
### Aliases: hetu

### ** Examples

hetu("111111-111C")
hetu("111111-111C")$date
hetu("111111-111C")$gender
# Same as previous, but using extract argument
hetu("111111-111C", extract="gender")

# Process a vector of hetu's
hetu(c("010101-0101", "111111-111C"))

# Process a vector of hetu's and extract gender information from each
hetu(c("010101-0101", "111111-111C"), extract="gender")



