## ------------------------------------------------------------------------
library(wikilake)

## ----category url, eval = FALSE------------------------------------------
#  res <- WikipediR::page_info("en", "wikipedia",
#          page = "Category:Lakes of Michigan")

## ----scrape names, eval = FALSE------------------------------------------
#  res <- xml2::read_html(res$query$pages[[1]]$canonicalurl)
#  res <- rvest::html_nodes(res, "#mw-pages .mw-category")
#  res <- rvest::html_nodes(res, "li")
#  res <- rvest::html_nodes(res, "a")
#  res <- rvest::html_attr(res, "title")

## ----remove junk names, eval = FALSE-------------------------------------
#  res <- res[!(seq_len(length(res)) %in% grep("List", res))]
#  res <- res[!(seq_len(length(res)) %in% grep("Watershed", res))]
#  res <- res[!(seq_len(length(res)) %in% grep("lakes", res))]
#  res <- res[!(seq_len(length(res)) %in% grep("Mud Lake", res))]

## ----scrape tables, eval = FALSE-----------------------------------------
#  res <- lapply(res, lake_wiki)
#  
#  # remove lakes with missing metadata
#  res <- res[unlist(lapply(res, function(x) !is.null(x)))]
#  
#  # remove missing coordinates
#  res <- res[unlist(lapply(res, function(x) !is.na(x[,"Lat"])))]

## ----collapse list to data.frame, eval = FALSE---------------------------
#  res_df_names <- unique(unlist(lapply(res, names)))
#  res_df <- data.frame(matrix(NA, nrow = length(res),
#                                  ncol = length(res_df_names)))
#  names(res_df) <- res_df_names
#  for(i in seq_len(length(res))){
#    dt_pad <- data.frame(matrix(NA, nrow = 1,
#                ncol = length(res_df_names) - ncol(res[[i]])))
#    names(dt_pad) <- res_df_names[!(res_df_names %in% names(res[[i]]))]
#    dt <- cbind(res[[i]], dt_pad)
#    dt <- dt[,res_df_names]
#    res_df[i,] <- dt
#  }
#  

## ----echo=FALSE, eval=FALSE----------------------------------------------
#  good_cols <- data.frame(as.numeric(as.character(apply(milakes,
#                                              2, function(x) sum(!is.na(x))))))
#  good_cols <- cbind(good_cols, names(milakes))
#  good_cols <- good_cols[good_cols[,1] > 20 ,2]
#  good_cols <- as.character(good_cols)
#  
#  milakes <- res_df[,good_cols]

## ----echo = FALSE--------------------------------------------------------
data(milakes)
res_df <- milakes

## ----map lakes, fig.height=6,fig.align="center"--------------------------
library(sp)

coordinates(res_df) <- ~Lon + Lat
map("state", region = "michigan", mar = c(0,0,0,0))
points(res_df, col = "red", pch = 19)

## ----lake depth distribution, eval=FALSE, echo=FALSE---------------------
#  hist(log(as.numeric(res_df$`Max. depth`)))

