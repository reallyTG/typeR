library(rscopus)


### Name: object_retrieval
### Title: ScienceDirect Object Retrieval
### Aliases: object_retrieval process_object_retrieval download_object
###   download_objects

### ** Examples

api_key = get_api_key(NULL, error = FALSE)
if (!is.null(api_key)){
   x = object_retrieval("S1053811915002700", identifier = "pii",
   verbose = FALSE)
   df = process_object_retrieval(x)
   df = df[ grepl("image/jpeg", df$mime_type),,drop = FALSE ]
   df = df[ df$type %in% "IMAGE-HIGH-RES",,drop = FALSE ]
   res = download_object(df$url[1])
   if (interactive()) {
      browseURL(res$outfile)
   } else {
     img = res$content
     dims = dim(img)[1:2]
     mdim = max(dims)
     graphics::plot(c(0, ncol(img)), c(0, nrow(img)), type='n')
     graphics::rasterImage(img, 1, 1, ncol(img), nrow(img))
   }
}



