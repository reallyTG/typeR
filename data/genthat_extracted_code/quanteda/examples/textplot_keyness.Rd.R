library(quanteda)


### Name: textplot_keyness
### Title: Plot word keyness
### Aliases: textplot_keyness
### Keywords: textplot

### ** Examples

# compare Trump speeches to other Presidents by chi^2
dem_dfm <- data_corpus_inaugural %>%
     corpus_subset(Year > 1980) %>%
     dfm(groups = "President", remove = stopwords("english"), remove_punct = TRUE)
dem_key <- textstat_keyness(dem_dfm, target = "Trump")
textplot_keyness(dem_key, margin = 0.2, n = 10)

# compare contemporary Democrats v. Republicans
pres_corp <- data_corpus_inaugural %>%
    corpus_subset(Year > 1960)
docvars(pres_corp, "party") <-
    ifelse(docvars(pres_corp, "President") %in% c("Nixon", "Reagan", "Bush", "Trump"),
           "Republican", "Democrat")
pres_dfm <- dfm(pres_corp, groups = "party", remove = stopwords("english"),
                remove_punct = TRUE)
pres_key <- textstat_keyness(pres_dfm, target = "Democrat", measure = "lr")
textplot_keyness(pres_key, color = c("blue", "red"), n = 10)




