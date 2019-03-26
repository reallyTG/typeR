library(DescTools)


### Name: Zodiac
### Title: Calculate the Zodiac of a Date
### Aliases: Zodiac
### Keywords: chron

### ** Examples

Zodiac(as.Date(c("1937-07-28", "1936-06-01", "1966-02-25",
                 "1964-11-17", "1972-04-25")), lang="deu")

d <- sample(seq(as.Date("2015-01-01"), as.Date("2015-12-31"), 1), 120)
z <- Zodiac(d)
Desc(z)



