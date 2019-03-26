library(qdapRegex)


### Name: pastex
### Title: Paste Regular Expressions
### Aliases: pastex %|% %+%
### Keywords: paste regex

### ** Examples

x <- c("There is $5.50 for me.", "that's 45.6% of the pizza",
    "14% is $26 or $25.99", "It's 12:30 pm to 4:00 am")

pastex("@rm_percent", "@rm_dollar")
pastex("@rm_percent", "@time_12_hours")

rm_dollar(x, extract=TRUE, pattern=pastex("@rm_percent", "@rm_dollar"))
rm_dollar(x, extract=TRUE, pattern=pastex("@rm_dollar", "@rm_percent", "@time_12_hours"))

## retrieve regexes from dictionary
pastex("@rm_email")
pastex("@rm_url3")
pastex("@version")

## pipe operator (%|%)
"x" %|% "y"
"@rm_url" %|% "@rm_twitter_url"

## pipe operator (%p%)
"x" %+% "y"
"@rm_time" %+% "\\s[AP]M"

## Remove Twitter Short URL
x <- c("download file from http://example.com", 
         "this is the link to my website http://example.com", 
         "go to http://example.com from more info.",
         "Another url ftp://www.example.com",
         "And https://www.example.net",
         "twitter type: t.co/N1kq0F26tG",
         "still another one https://t.co/N1kq0F26tG :-)")

rm_twitter_url(x)
rm_twitter_url(x, extract=TRUE)

## Combine removing Twitter URLs and standard URLs
rm_twitter_n_url <- rm_(pattern="@rm_twitter_url" %|% "@rm_url")  
rm_twitter_n_url(x)
rm_twitter_n_url(x, extract=TRUE)



