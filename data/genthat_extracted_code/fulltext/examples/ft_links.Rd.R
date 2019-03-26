library(fulltext)


### Name: ft_links
### Title: Get full text links
### Aliases: ft_links ft_links_ls

### ** Examples

# List publishers included
ft_links_ls()

## Not run: 
##D # Entrez
##D (res1 <- ft_search(query='ecology', from='entrez'))
##D res1$entrez$data$doi
##D ## directly from ft_search output
##D (out <- ft_links(res1))
##D out$entrez
##D out$entrez$data[[1]]
##D ## directly individual elements of ft_search output
##D (out <- ft_links(res1$entrez))
##D out$entrez
##D ## from character vector of DOIs
##D x <- c("10.1371/journal.pone.0086169", "10.1016/j.ympev.2010.07.013")
##D (out2 <- ft_links(x, from = "entrez"))
##D out2$entrez
##D 
##D # Crossref
##D (res2 <- ft_search(query='ecology', from='crossref'))
##D res2$crossref$data$doi
##D ## directly from ft_search output
##D (out <- ft_links(res2))
##D out$crossref
##D out$crossref$data[[1]]
##D ## directly individual elements of ft_search output
##D (out <- ft_links(res2$crossref))
##D out$crossref
##D ## from character vector of DOIs
##D x <- c("10.1016/s1754-5048(14)00139-1", 
##D        "10.1016/b978-0-12-378260-1.50017-8")
##D (out2 <- ft_links(x, from = "crossref"))
##D out2$crossref
##D 
##D # PLOS
##D (res3 <- ft_search(query='ecology', from='plos', plosopts=list(
##D    fl=c('id','author','eissn','journal','counter_total_all',
##D         'alm_twitterCount'))))
##D res3$plos$data$id
##D ## directly from ft_search output
##D (out <- ft_links(res3))
##D out$plos
##D out$plos$data[[1]]
##D ## directly individual elements of ft_search output
##D (out <- ft_links(res3$plos))
##D out$plos
##D ## from character vector of DOIs
##D x <- c("10.1371/journal.pone.0017342", "10.1371/journal.pone.0091497")
##D out3 <- ft_links(x, from = "plos")
##D out3$plos
##D 
##D # BMC
##D (res <- ft_search(query='ecology', from='bmc'))
##D res$bmc
##D ## directly from ft_search output
##D (out <- ft_links(res))
##D out$bmc
##D out$bmc$data[[1]]
##D ## directly individual elements of ft_search output
##D (out <- ft_links(res$bmc))
##D out$bmc
##D 
##D # Character input
##D out4 <- ft_links('10.1371/journal.pone.0086169')
##D out4$plos
##D 
##D # other publishers
##D ## elife
##D res <- ft_links(c('10.7554/eLife.03032', '10.7554/eLife.02747'))
##D res$elife
##D 
##D ## peerj
##D ft_links('10.7717/peerj.228')
##D ft_links(c('10.7717/peerj.228', '10.7717/peerj.1200'))
##D 
##D ## wiley
##D res <- ft_links('10.1006/asle.2001.0035', from = "crossref")
##D res$crossref$data[[1]]$url
##D 
##D ## informa
##D res <- ft_links('10.1174/02134749660569378', from = "crossref")
##D res$crossref$data[[1]]$url
##D 
##D ## frontiersin
##D (res <- ft_links('10.3389/fphar.2014.00109'))
##D res$frontiersin
##D 
##D ## copernicus
##D (res <- ft_links('10.5194/angeo-31-2157-2013'))
##D res$copernicus
##D 
##D ## cogent
##D (res <- ft_links('10.1080/23311916.2014.938430'))
##D res$cogent
##D 
##D ## bmc
##D (res <- ft_links('10.1186/2049-2618-2-7'))
##D res$bmc
##D (res <- ft_links('10.1186/2049-2618-2-7', from = "bmc"))
##D 
##D ## Many publishers, elife and peerj
##D res <- ft_links(c('10.7554/eLife.03032', '10.7717/peerj.228'))
##D res$elife
##D res$peerj
## End(Not run)



