library(broom)


### Name: tidy.table
### Title: Tidy a(n) table object
### Aliases: tidy.table

### ** Examples


tab <- with(airquality, table(Temp = cut(Temp, quantile(Temp)), Month))
tidy(tab)




