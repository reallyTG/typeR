library(rerddap)


### Name: eurl
### Title: Default ERDDAP server URL
### Aliases: eurl

### ** Examples

eurl()
Sys.setenv(RERDDAP_DEFAULT_URL = "https://google.com")
Sys.getenv("RERDDAP_DEFAULT_URL")
eurl()
Sys.unsetenv("RERDDAP_DEFAULT_URL")
eurl()



