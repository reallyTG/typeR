## ---- eval=FALSE, install------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("cloudyr/aws.alexa", build_vignettes = TRUE)

## ---- eval=FALSE, setapp-------------------------------------------------
#  set_secret_key(key="key", secret="secret")

## ---- eval=FALSE, url_info-----------------------------------------------
#  res <- url_info("http://www.google.com")
#  res <- do.call(cbind, lapply(res[[2]][[1]][[2]], as.data.frame))
#  dimnames(res) <- list(1:nrow(res),  c("url", "attribute", "title", "description", "online_since"))
#  return(res)

## ---- eval=FALSE, traffic_hist-------------------------------------------
#  traffic <- traffic_history("http://www.google.com")
#  head(traffic)

## ---- eval=FALSE, browse_cats--------------------------------------------
#  browse_categories(path="Top/Arts")

## ---- eval=FALSE, cat_list-----------------------------------------------
#  cat_list <- category_listing(path="Top/Arts")
#  head(cat_list)

## ---- eval=FALSE, in_links-----------------------------------------------
#  res_links <- in_links(url="google.com")
#  head(res_links)

