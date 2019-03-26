library(polmineR)


### Name: weigh
### Title: Apply Weight to Matrix
### Aliases: weigh weigh,TermDocumentMatrix-method
###   weigh,DocumentTermMatrix-method weigh,count-method
###   weigh,count_bundle-method

### ** Examples

## Not run: 
##D library(data.table)
##D if (require("zoo") && require("devtools") && require("magrittr")){
##D 
##D # Source in function 'get_sentiws' from a GitHub gist
##D gist_url <- file.path(
##D   "gist.githubusercontent.com",
##D   "PolMine",
##D   "70eeb095328070c18bd00ee087272adf",
##D   "raw",
##D   "c2eee2f48b11e6d893c19089b444f25b452d2adb",
##D   "sentiws.R"
##D  )
##D   
##D devtools::source_url(sprintf("https://%s", gist_url))
##D SentiWS <- get_sentiws()
##D 
##D # Do the statistical word context analysis
##D use("GermaParl")
##D options("polmineR.left" = 10L)
##D options("polmineR.right" = 10L)
##D df <- context("GERMAPARL", query = "Islam", p_attribute = c("word", "pos")) %>%
##D   partition_bundle(node = FALSE) %>% 
##D   set_names(s_attributes(., s_attribute = "date")) %>%
##D   weigh(with = SentiWS) %>%
##D   summary()
##D 
##D # Aggregate by year
##D df[["year"]] <- as.Date(df[["name"]]) %>% format("%Y-01-01")
##D df_year <- aggregate(df[,c("size", "positive_n", "negative_n")], list(df[["year"]]), sum)
##D colnames(df_year)[1] <- "year"
##D 
##D # Use shares instead of absolute counts 
##D df_year$negative_share <- df_year$negative_n / df_year$size
##D df_year$positive_share <- df_year$positive_n / df_year$size
##D 
##D # Turn it into zoo object, and plot it
##D Z <- zoo(
##D   x = df_year[, c("positive_share", "negative_share")],
##D   order.by = as.Date(df_year[,"year"])
##D )
##D plot(
##D   Z, ylab = "polarity", xlab = "year",
##D   main = "Word context of 'Islam': Share of positive/negative vocabulary",
##D   cex = 0.8,
##D   cex.main = 0.8
##D )
##D 
##D # Note that we can uses the kwic-method to check for the validity of our findings
##D words_positive <- SentiWS[weight > 0][["word"]]
##D words_negative <- SentiWS[weight < 0][["word"]]
##D kwic("GERMAPARL", query = "Islam", positivelist = c(words_positive, words_negative)) %>%
##D   highlight(lightgreen = words_positive, orange = words_negative) %>%
##D   tooltips(setNames(SentiWS[["word"]], SentiWS[["weight"]]))
##D   
##D }
## End(Not run)



