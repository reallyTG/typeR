## ---- eval=FALSE---------------------------------------------------------
#  # save the api key in the .Renviron file
#  set_api_key(api_key = "xxx",
#              path = "~/.Renviron")

## ---- eval=FALSE---------------------------------------------------------
#  # fetch articles up to 1000 rows
#  tatort_articles <- get_content(query = "Tatort",
#                                 begin_date = "20180101",
#                                 end_date = "20180131")
#  
#  # fetch ALL articles
#  tatort_articles <- get_content(query = "Tatort",
#                                 timeout = 2)

## ---- eval=FALSE---------------------------------------------------------
#  tatort_content <- get_article_text(url = tatort_articles$content$href,
#                                     timeout = 1)

## ---- eval=FALSE---------------------------------------------------------
#  tatort_comments <- get_article_comments(url = tatort_articles$content$href[1],
#                                          timeout = 1)

## ---- eval=FALSE---------------------------------------------------------
#  tatort_images <- get_article_images(url = tatort_articles$content$href,
#                                      timeout = 1,
#                                      download = "~/Documents/tatort-img/")

