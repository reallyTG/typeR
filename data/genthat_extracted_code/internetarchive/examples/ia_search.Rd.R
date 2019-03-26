library(internetarchive)


### Name: ia_search
### Title: Search the Internet Archive
### Aliases: ia_search

### ** Examples

query1 <- c("title" = "damnation of theron ware")
ia_search(query1)
query2 <- c("title" = "damnation of theron ware",
            "contributor" = "gutenberg")
ia_search(query2)



