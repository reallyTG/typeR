## ----eval=FALSE----------------------------------------------------------
#  (apple <- render_har(url = "https://apple.com/", response_body = TRUE))
#  ## --------HAR VERSION--------
#  ## HAR specification version: 1.2
#  ## --------HAR CREATOR--------
#  ## Created by: Splash
#  ## version: 3.3.1
#  ## --------HAR BROWSER--------
#  ## Browser: QWebKit
#  ## version: 602.1
#  ## --------HAR PAGES--------
#  ## Page id: 1 , Page title: Apple
#  ## --------HAR ENTRIES--------
#  ## Number of entries: 84
#  ## REQUESTS:
#  ## Page: 1
#  ## Number of entries: 84
#  ##   -  https://apple.com/
#  ##   -  https://www.apple.com/
#  ##   -  https://www.apple.com/ac/globalnav/4/en_US/styles/ac-globalnav.built.css
#  ##   -  https://www.apple.com/ac/localnav/4/styles/ac-localnav.built.css
#  ##   -  https://www.apple.com/ac/globalfooter/4/en_US/styles/ac-globalfooter.built.css
#  ##      ........
#  ##   -  https://www.apple.com/v/home/ea/images/heroes/iphone-xs/iphone_xs_0afef_mediumtall.jpg
#  ##   -  https://www.apple.com/v/home/ea/images/heroes/iphone-xr/iphone_xr_5e40f_mediumtall.jpg
#  ##   -  https://www.apple.com/v/home/ea/images/heroes/iphone-xs/iphone_xs_0afef_mediumtall.jpg
#  ##   -  https://www.apple.com/v/home/ea/images/heroes/macbook-air/macbook_air_mediumtall.jpg
#  ##   -  https://www.apple.com/v/home/ea/images/heroes/macbook-air/macbook_air_mediumtall.jpg

## ----eval=FALSE----------------------------------------------------------
#  har_entries(apple) %>%
#    purrr::map_chr(get_content_type) %>%
#    table(dnn = "content_type") %>%
#    broom::tidy() %>%
#    dplyr::arrange(desc(n))
#  ## # A tibble: 9 x 2
#  ##   content_type                 n
#  ##   <chr>                    <int>
#  ## 1 font/woff2                  27
#  ## 2 application/x-javascript    15
#  ## 3 image/svg+xml               10
#  ## 4 text/css                     9
#  ## 5 image/jpeg                   7
#  ## 6 image/png                    6
#  ## 7 application/font-woff        4
#  ## 8 text/html                    3
#  ## 9 application/json             2

## ----eval=FALSE----------------------------------------------------------
#  har_entries(apple) %>%
#    purrr::map_chr(get_response_url) %>%
#    purrr::map_chr(urltools::domain) %>%
#    unique()
#  ## [1] "apple.com"               "www.apple.com"           "securemetrics.apple.com"

## ----eval=FALSE----------------------------------------------------------
#  har_entries(apple) %>%
#    purrr::keep(is_json) %>%
#    purrr::map(get_response_body, "text") %>%
#    purrr::map(jsonlite::fromJSON) %>%
#    str(3)
#  ## List of 2
#  ##  $ :List of 2
#  ##   ..$ locale        :List of 3
#  ##   .. ..$ country      : chr "us"
#  ##   .. ..$ attr         : chr "en-US"
#  ##   .. ..$ textDirection: chr "ltr"
#  ##   ..$ localeswitcher:List of 7
#  ##   .. ..$ name        : chr "localeswitcher"
#  ##   .. ..$ metadata    : Named list()
#  ##   .. ..$ displayIndex: int 1
#  ##   .. ..$ copy        :List of 5
#  ##   .. ..$ continue    :List of 5
#  ##   .. ..$ exit        :List of 5
#  ##   .. ..$ select      :List of 5
#  ##  $ :List of 2
#  ##   ..$ id     : chr "ad6ca319-1ef1-20da-c4e0-5185088996cb"
#  ##   ..$ results:'data.frame': 2 obs. of  2 variables:
#  ##   .. ..$ sectionName   : chr [1:2] "quickLinks" "suggestions"
#  ##   .. ..$ sectionResults:List of 2

## ----eval=FALSE----------------------------------------------------------
#  har_entries(apple) %>%
#    purrr::map_dbl(get_body_size)
#  ##  [1]      0  54521  95644  98069  43183   8689  19035 794210  66487 133730 311054  13850 199928 161859  90322 343189  19035
#  ## [18] 794210  66487 133730    554    802   1002   1160   1694    264   1082   1661    390    416 108468 108828 100064 109728
#  ## [35] 109412  99196 108856 109360 108048   8868  10648  10380  10476    137 311054  13850   3192   3253   4130   2027   1247
#  ## [52]   1748    582 199928 109628 107832 109068 100632 108928  97812 108312 108716 107028  65220  73628  72188  72600  70400
#  ## [69]  73928  72164  73012  71080   1185 161859  90322 343189      0    491  60166  58509  60166  58509  53281  53281

## ----eval=FALSE----------------------------------------------------------
#  ca <- render_har(url = "https://www.ca.gov/", response_body = TRUE)
#  
#  har_entries(ca) %>%
#    purrr::map_chr(~.x$response$url %>% urltools::domain()) %>%
#    unique()
#  ##  [1] "www.ca.gov"                      "fonts.googleapis.com"            "california.azureedge.net"
#  ##  [4] "portal-california.azureedge.net" "az416426.vo.msecnd.net"          "fonts.gstatic.com"
#  ##  [7] "ssl.google-analytics.com"        "cse.google.com"                  "translate.google.com"
#  ## [10] "api.stateentityprofile.ca.gov"   "translate.googleapis.com"        "www.google.com"
#  ## [13] "clients1.google.com"             "www.gstatic.com"                 "platform.twitter.com"
#  ## [16] "dc.services.visualstudio.com"

## ----eval=FALSE----------------------------------------------------------
#  ## # A tibble: 8 x 2
#  ##   dom                      type
#  ##   <chr>                    <chr>
#  ## 1 california.azureedge.net application/javascript
#  ## 2 california.azureedge.net application/x-javascript
#  ## 3 az416426.vo.msecnd.net   application/x-javascript
#  ## 4 cse.google.com           text/javascript
#  ## 5 translate.google.com     text/javascript
#  ## 6 translate.googleapis.com text/javascript
#  ## 7 www.google.com           text/javascript
#  ## 8 platform.twitter.com     application/javascript

## ----eval=FALSE----------------------------------------------------------
#  har_entries(ca) %>%
#    purrr::map_df(get_headers) %>%
#    dplyr::count(name, sort=TRUE) %>%
#    print(n=50)
#  ## # A tibble: 42 x 2
#  ##    name                              n
#  ##    <chr>                         <int>
#  ##  1 date                            149
#  ##  2 server                          148
#  ##  3 content-type                    142
#  ##  4 last-modified                   126
#  ##  5 etag                            104
#  ##  6 content-encoding                 83
#  ##  7 access-control-allow-origin      78
#  ##  8 accept-ranges                    74
#  ##  9 vary                             69
#  ## 10 content-length                   66
#  ## 11 x-ms-ref                         57
#  ## 12 x-ms-ref-originshield            57
#  ## 13 access-control-expose-headers    56
#  ## 14 content-md5                      51
#  ## 15 x-ms-blob-type                   51
#  ## 16 x-ms-lease-status                51
#  ## 17 x-ms-request-id                  51
#  ## 18 x-ms-version                     51
#  ## 19 cache-control                    37
#  ## 20 expires                          34
#  ## 21 alt-svc                          30
#  ## 22 x-xss-protection                 29
#  ## 23 x-content-type-options           27
#  ## 24 age                              22
#  ## 25 transfer-encoding                20
#  ## 26 timing-allow-origin              14
#  ## 27 x-powered-by                     14
#  ## 28 access-control-allow-headers      7
#  ## 29 pragma                            6
#  ## 30 request-context                   5
#  ## 31 x-aspnet-version                  5
#  ## 32 x-frame-options                   4
#  ## 33 content-disposition               3
#  ## 34 access-control-max-age            2
#  ## 35 content-language                  2
#  ## 36 p3p                               2
#  ## 37 x-cache                           2
#  ## 38 access-control-allow-methods      1
#  ## 39 location                          1
#  ## 40 set-cookie                        1
#  ## 41 strict-transport-security         1
#  ## 42 x-ms-session-id                   1

## ----eval=FALSE----------------------------------------------------------
#  har_entries(ca) %>%
#    purrr::map_chr(get_header_val, "server") %>%
#    table(dnn = "server") %>%
#    broom::tidy() %>%
#    dplyr::arrange(desc(n))
#  ## # A tibble: 14 x 2
#  ##    server                                           n
#  ##    <chr>                                        <int>
#  ##  1 Apache                                          55
#  ##  2 Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0    50
#  ##  3 sffe                                            23
#  ##  4 Microsoft-IIS/10.0                               7
#  ##  5 ESF                                              3
#  ##  6 HTTP server (unknown)                            2
#  ##  7 ECAcc (bsa/EAD2)                                 1
#  ##  8 ECD (sjc/16E0)                                   1
#  ##  9 ECD (sjc/16EA)                                   1
#  ## 10 ECD (sjc/16F4)                                   1
#  ## 11 ECD (sjc/4E95)                                   1
#  ## 12 ECD (sjc/4E9F)                                   1
#  ## 13 ECS (bsa/EB1F)                                   1
#  ## 14 gws                                              1

## ----eval=FALSE----------------------------------------------------------
#  URL <- "https://httpbin.org/user-agent"
#  
#  splash_local %>%
#    splash_response_body(TRUE) %>%
#    splash_user_agent(ua_macos_chrome) %>%
#    splash_go(URL) %>%
#    splash_html() %>%
#    xml2::xml_text("body") %>%
#    jsonlite::fromJSON()
#  
#  ## $`user-agent`
#  ## [1] "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36"

## ----eval=FALSE----------------------------------------------------------
#  spi <- start_splash()
#  
#  # ... scraping tasks ...
#  
#  stop_splash(spi)

