library(zoocat)


### Name: rela_year
### Title: Get the relative years for a 'gmon' object
### Aliases: rela_year

### ** Examples

num.mon <- -12 : 3
gm <- gmon(num.mon)
ry <- rela_year(gm)
df <- data.frame(num.mon, ry, as.character(gm))
print(df)




