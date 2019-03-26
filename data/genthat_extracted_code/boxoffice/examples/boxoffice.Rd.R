library(boxoffice)


### Name: boxoffice
### Title: Download Information on Box Office Results for Movies
### Aliases: boxoffice

### ** Examples

# Uses the-numbers.com website.
boxoffice(dates = as.Date("2017-12-25"))

# Uses boxofficemojo.com website.
boxoffice(dates = as.Date("2017-12-25"), site = "mojo")

# Returns only top 10 (daily) grossing movies
boxoffice(dates = as.Date("2017-12-25"), top_n = 10)
# Uses the dates of Christmas and New Years Eve 2017
boxoffice(dates = as.Date(c("2017-12-25", "2017-12-31")))




