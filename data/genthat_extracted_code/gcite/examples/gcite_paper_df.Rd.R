library(gcite)


### Name: gcite_paper_df
### Title: Get Paper Data Frame from Title URLs
### Aliases: gcite_paper_df

### ** Examples

if (!is_travis()) {
L = gcite_user_info(user = "uERvKpYAAAAJ", 
read_citations = FALSE)
urls = L$all_papers$title_link
paper_df = gcite_paper_df(urls = urls, force = TRUE)
} 



