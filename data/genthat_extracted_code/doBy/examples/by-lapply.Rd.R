library(doBy)


### Name: by-lapply
### Title: Formula based version of lapply.
### Aliases: by-lapply lapplyBy
### Keywords: utilities

### ** Examples

data(dietox)

## Calculate weekwise feed efficiency = weight gain / feed intake
dietox <- orderBy(~Pig + Time, data=dietox)
v <- lapplyBy(~Pig, data=dietox,
              function(d) c(NA, diff(d$Weight) / diff(d$Feed)))
dietox$FE <- unlist(v)

## Technically this is the same as 
dietox <- orderBy(~Pig + Time, data=dietox)
wdata <- splitBy(~Pig, data=dietox)
v <- lapply(wdata, function(d) c(NA, diff(d$Weight)/diff(d$Feed)))
dietox$FE <- unlist(v)




