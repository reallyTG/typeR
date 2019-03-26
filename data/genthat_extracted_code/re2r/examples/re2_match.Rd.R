library(re2r)


### Name: re2_match
### Title: Find matched groups from strings.
### Aliases: re2_match re2_match_all

### ** Examples


strings <- c("Gym: 627-112-1433", "Apple x2",
             "888 888 8888", "This is a test.",
             "627-112-1433 223-343-2232")
phone <- "([2-9][0-9]{2})[- .](?P<second>[0-9]{3})[- .]([0-9]{4})"
re2_extract(strings, phone)
re2_match(strings, phone)

re2_extract_all(strings, phone)
re2_match_all(strings, phone)

regexp = re2("test",case_sensitive = FALSE)
re2_match("TEST", regexp)

# differences from stringi

# This kind of repeating capturing group works differently.
re2_match("aasd", "(a*)+")
stringi::stri_match("aasd", regex = "(a*)+")

# In stringi, "" empty search patterns return NA.
# In re2r, empty search patterns will match
# empty string.

re2_match("abc", "")
stringi::stri_match("abc", regex = "")

dates <- c("2008-08-08", "2020", "a string",
           "12-12-72", "1989-06-30", "2115-11-21 09:21")
pattern <- "([0-9]{4})-([0-1][0-9])-([0-3][0-9])"
re2_match(dates, pattern)

pattern <- "(?P<y>[0-9]{4})-(?P<m>[0-1][0-9])-(?P<d>[0-3][0-9])"
(res = re2_match(dates, pattern))
res$y
res$m
res$d

pattern <- paste0(
"(?P<first>[A-Z][a-z]+) ",
"(?P<last>[A-Z][a-z]+)"
)
texts <- c(
    "  Taylor Swift and Lady Gaga",
    "One Direction hit the road agains"
)
re2_match_all(texts, pattern)

texts = c("pi is 3.14529..",
          "-15.34 F",
          "128 days",
          "1.9e10",
          "123,340.00$",
          "only texts")
(number_pattern = re2(".*?(?P<number>-?\\d+(,\\d+)*(\\d+(e\\d+)?)?).*?"))

(res = re2_match(texts, number_pattern))
res$number

# show_regex(number_pattern)



