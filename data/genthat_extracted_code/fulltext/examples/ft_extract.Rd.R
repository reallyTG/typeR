library(fulltext)


### Name: ft_extract
### Title: Extract text from a single pdf document
### Aliases: ft_extract

### ** Examples

## Not run: 
##D path <- system.file("examples", "example1.pdf", package = "fulltext")
##D (res <- ft_extract(path))
##D 
##D # use on output of ft_get() to extract pdf to text
##D ## arxiv
##D res <- ft_get('cond-mat/9309029', from = "arxiv")
##D res2 <- ft_extract(res)
##D res$arxiv$data
##D res2$arxiv$data
##D 
##D ## biorxiv
##D res <- ft_get('10.1101/012476')
##D res2 <- ft_extract(res)
##D res$biorxiv$data
##D res2$biorxiv$data
## End(Not run)



