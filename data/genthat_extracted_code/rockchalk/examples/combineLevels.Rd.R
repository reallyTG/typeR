library(rockchalk)


### Name: combineLevels
### Title: recode a factor by "combining" levels
### Aliases: combineLevels

### ** Examples

x <- c("M","A","B","C","A","B","A","M")
x <- factor(x)
levels(x)
x2a <- combineLevels(x, levs = c("M","A"), newLabel = "M_or_A")
addmargins(table(x2a, x, exclude=NULL))
x2b <- combineLevels(x, c(1,4), "M_or_A")
addmargins(table(x2b, x, exclude=NULL))
x3 <- combineLevels(x, levs = c("M","A","C"), newLabel = "MAC")
addmargins(table(x3, x, exclude=NULL))
## Now an ordinal factor
z <- c("M","A","B","C","A","B","A","M")
z <- ordered(z)
levels(z)
table(z, exclude=NULL)
z2a <-  combineLevels(z, levs = c(1,2), "Good")
addmargins(table(z2a, z, exclude = NULL))
z2b <- combineLevels(z, levs = c("A","B"), "AorB")
addmargins(table(z2b, z, exclude = NULL))




