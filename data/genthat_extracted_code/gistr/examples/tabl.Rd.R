library(gistr)


### Name: tabl
### Title: Make a table from gist or commit class or a list of either
### Aliases: tabl tabl_data

### ** Examples

## Not run: 
##D # from a gist object
##D x <- as.gist('f1403260eb92f5dfa7e1')
##D res <- tabl(x)
##D res$data
##D res$forks
##D res$history
##D 
##D # from a list
##D ss <- gists('minepublic')
##D tabl(ss[1:3])
##D lapply(tabl(ss[1:3]), "[[", "data")
##D # index to data slots, but also make single data.frame
##D tabl_data(tabl(ss[1:3]))
##D ## manipulate with dplyr
##D library("dplyr")
##D tabl_data(tabl(ss[1:30])) %>% 
##D   select(id, description, owner_login) %>% 
##D   filter(grepl("gist gist gist", description))
##D 
##D # commits
##D x <- gists()[[2]] %>% commits()
##D tabl(x[[1]])
##D 
##D ## many
##D x <- sapply(gists(per_page = 100), commits)
##D tabl(x) %>%
##D   select(id, login, change_status.total, url) %>% 
##D   filter(change_status.total > 50)
##D   
##D # pass in a url
##D gist("https://gist.github.com/expersso/4ac33b9c00751fddc7f8") %>% tabl
##D ## many
##D gg <- gists()
##D (urls <- vapply(gg, "[[", "", "html_url"))
##D lapply(urls[1:5], as.gist) %>% tabl()
##D 
##D # gist with forks and history
##D gist('1642874') %>% tabl
##D 
##D # gist with history, no forks
##D gist('c96d2e453c95d0166408') %>% tabl 
## End(Not run)



