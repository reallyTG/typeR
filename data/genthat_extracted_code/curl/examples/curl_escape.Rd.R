library(curl)


### Name: curl_escape
### Title: URL encoding
### Aliases: curl_escape curl_unescape

### ** Examples

# Escape strings
out <- curl_escape("foo = bar + 5")
curl_unescape(out)

# All non-ascii characters are encoded
mu <- "\u00b5"
curl_escape(mu)
curl_unescape(curl_escape(mu))



