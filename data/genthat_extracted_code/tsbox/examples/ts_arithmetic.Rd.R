library(tsbox)


### Name: ts_arithmetic
### Title: Arithmetic Operators for ts-boxable objects
### Aliases: ts_arithmetic %ts+% ts_arithmetic %ts-% ts_arithmetic %ts*%
###   ts_arithmetic %ts/%

### ** Examples

head(fdeaths - mdeaths)
head(fdeaths %ts-% mdeaths)
head(ts_df(fdeaths) %ts-% mdeaths)



