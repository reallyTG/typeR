library(deducorrect)


### Name: status
### Title: Create empty status vector
### Aliases: status

### ** Examples


# create statusvector

status <- deducorrect:::status(5)
status[1:5] <- c("invalid",NA,"corrected","valid","partial")

# 
which(status < "valid")



