library(anchors)


### Name: convert
### Title: Convert factor or character variables into integers
### Aliases: convert
### Keywords: manip

### ** Examples


set.seed(391)
a <- sample(c("net gain", "little effect",  "modest loss", "major loss"),
            20, replace=TRUE)

dta <- as.data.frame( list(ncost=a) , stringsAsFactors  = FALSE)
print(dta)

newdat <- convert("ncost", data = dta, 
                  order = c("net gain", "little effect",  "modest loss", "major loss"))

print(newdat)




