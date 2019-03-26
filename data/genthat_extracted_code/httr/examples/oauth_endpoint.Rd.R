library(httr)


### Name: oauth_endpoint
### Title: Describe an OAuth endpoint.
### Aliases: oauth_endpoint

### ** Examples

linkedin <- oauth_endpoint("requestToken", "authorize", "accessToken",
  base_url = "https://api.linkedin.com/uas/oauth"
)
github <- oauth_endpoint(NULL, "authorize", "access_token",
  base_url = "https://github.com/login/oauth"
)
facebook <- oauth_endpoint(
  authorize = "https://www.facebook.com/dialog/oauth",
  access = "https://graph.facebook.com/oauth/access_token"
)

oauth_endpoints



