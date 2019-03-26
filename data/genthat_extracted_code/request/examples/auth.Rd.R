library(request)


### Name: auth
### Title: Authentication configuration/setup
### Aliases: api_oauth1 api_oauth2 api_simple_auth auth

### ** Examples

## Not run: 
##D # simple authentication (user/password)
##D api('https://httpbin.org/basic-auth/user/passwd') %>%
##D  api_simple_auth(user = "user", pwd = "passwd")
##D ## different auth type
##D # api('https://httpbin.org/basic-auth/user/passwd') %>%
##D #  api_simple_auth(user = "user", pwd = "passwd", type = "gssnegotiate")
##D 
##D # OAuth setup
##D ## using a token
##D ### fill in your own token
##D # api('https://api.github.com/') %>%
##D #   api_oauth2(token = "<token>")
##D 
##D # OAuth2
##D ## using a app name, key, and secret combination
##D ### uses a OAuth app set up by Hadley Wickham, which you'll auth against
##D # api('https://api.github.com/') %>%
##D #   api_oauth2(app_name = "github", key = "56b637a5baffac62cad9",
##D #       secret = "8e107541ae1791259e9987d544ca568633da2ebf",
##D #       base_url = "https://github.com/login/oauth",
##D #       authorize = "authorize", access = "access_token")
##D 
##D # OAuth1
##D # api('https://api.twitter.com/1.1/statuses/home_timeline.json') %>%
##D #  api_oauth1(app_name = "twitter", key = "TYrWFPkFAkn4G5BbkWINYw",
##D #      secret = "qjOkmKYU9kWfUFWmekJuu5tztE9aEfLbt26WlhZL8",
##D #      base_url = "https://api.twitter.com/oauth/",
##D #      request = "request_token", authorize = "authenticate", access = "access_token")
##D 
##D # Request some data with oauth2 via Github
##D ## put in your username and password
##D # api('https://api.github.com/') %>%
##D #  api_simple_auth(user = "<foo>", pwd = "<bar>")
## End(Not run)



