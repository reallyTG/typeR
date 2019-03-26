library(gdata)


### Name: trim
### Title: Remove leading and trailing spaces from character strings
### Aliases: trim
### Keywords: manip character

### ** Examples

s <- "    this is an example string    "
trim(s)

f <- factor(c(s, s, " A", " B ", "  C ", "D "))
levels(f)

trim(f)
levels(trim(f))

trim(f, recode.factor=FALSE)
levels(trim(f, recode.factor=FALSE))

l <- list(s=rep(s, times=6), f=f, i=1:6)
trim(l)

df <- as.data.frame(l)
trim(df)



