library(splashr)


### Name: splash_user_agent
### Title: Overwrite the User-Agent header for all further requests.
### Aliases: splash_user_agent ua_splashr ua_win10_chrome ua_win10_firefox
###   ua_win10_ie11 ua_win7_chrome ua_win7_firefox ua_win7_ie11
###   ua_macos_chrome ua_macos_safari ua_linux_chrome ua_linux_firefox
###   ua_ios_safari ua_android_samsung ua_kindle ua_ps4 ua_apple_tv
###   ua_chromecast
### Keywords: datasets

### ** Examples

## Not run: 
##D library(rvest)
##D 
##D URL <- "https://httpbin.org/user-agent"
##D 
##D splash_local %>%
##D   splash_response_body(TRUE) %>%
##D   splash_user_agent(ua_macos_chrome) %>%
##D   splash_go(URL) %>%
##D   splash_html() %>%
##D   html_text("body") %>%
##D   jsonlite::fromJSON()
## End(Not run)



