library(fulltext)


### Name: ft_get
### Title: Download full text articles
### Aliases: ft_get ft_get_ls

### ** Examples

# List publishers included
ft_get_ls()

## Not run: 
##D # If you just have DOIs and don't know the publisher
##D ## PLOS
##D ft_get('10.1371/journal.pone.0086169')
##D 
##D # Collect all errors from across papers
##D #   similarly can combine from different publishers as well
##D res <- ft_get(c('10.7554/eLife.03032', '10.7554/eLife.aaaa'), from = "elife")
##D res$elife$errors
##D 
##D ## PeerJ
##D ft_get('10.7717/peerj.228')
##D ft_get('10.7717/peerj.228', type = "pdf")
##D 
##D ## eLife
##D ### xml
##D ft_get('10.7554/eLife.03032')
##D res <- ft_get(c('10.7554/eLife.03032', '10.7554/eLife.32763'), from = "elife")
##D res$elife
##D respdf <- ft_get(c('10.7554/eLife.03032', '10.7554/eLife.32763'), 
##D   from = "elife", type = "pdf")
##D respdf$elife
##D 
##D elife_xml <- ft_get('10.7554/eLife.03032', from = "elife")
##D library(magrittr)
##D elife_xml %<>% ft_collect()
##D elife_xml$elife
##D ### pdf
##D elife_pdf <- ft_get(c('10.7554/eLife.03032', '10.7554/eLife.32763'), 
##D   from = "elife", type = "pdf")
##D elife_pdf$elife
##D elife_pdf %<>% ft_collect()
##D elife_pdf %>% ft_extract()
##D 
##D ## some BMC DOIs will work, but some may not, who knows
##D ft_get(c('10.1186/2049-2618-2-7', '10.1186/2193-1801-3-7'), from = "entrez")
##D 
##D ## FrontiersIn
##D res <- ft_get(c('10.3389/fphar.2014.00109', '10.3389/feart.2015.00009'))
##D res
##D res$frontiersin
##D 
##D ## Hindawi - via Entrez
##D res <- ft_get(c('10.1155/2014/292109','10.1155/2014/162024', '10.1155/2014/249309'))
##D res
##D res$hindawi
##D res$hindawi$data$path
##D res$hindawi$data$data
##D res %>% ft_collect() %>% .$hindawi
##D 
##D ## F1000Research - via Entrez
##D x <- ft_get('10.12688/f1000research.6522.1')
##D ## Two different publishers via Entrez - retains publisher names
##D res <- ft_get(c('10.1155/2014/292109', '10.12688/f1000research.6522.1'))
##D res$hindawi
##D res$f1000research
##D 
##D ## Pensoft
##D ft_get('10.3897/mycokeys.22.12528')
##D 
##D ## Copernicus
##D out <- ft_get(c('10.5194/angeo-31-2157-2013', '10.5194/bg-12-4577-2015'))
##D out$copernicus
##D 
##D ## arXiv - only pdf, you have to pass in the from parameter
##D res <- ft_get(x='cond-mat/9309029', from = "arxiv")
##D res$arxiv
##D res %>% ft_extract  %>% .$arxiv
##D 
##D ## bioRxiv - only pdf
##D res <- ft_get(x='10.1101/012476')
##D res$biorxiv
##D 
##D ## Karger Publisher
##D (x <- ft_get('10.1159/000369331'))
##D x$karger
##D 
##D ## MDPI Publisher
##D (x <- ft_get('10.3390/nu3010063'))
##D x$mdpi
##D ft_get('10.3390/nu7085279')
##D ft_get(c('10.3390/nu3010063', '10.3390/nu7085279')) # not working, only getting 1
##D 
##D # Scientific Societies
##D ## this is a paywall article, you may not have access or you may
##D x <- ft_get("10.1094/PHYTO-04-17-0144-R")
##D x$scientificsocieties
##D 
##D # Informa
##D x <- ft_get("10.1080/03088839.2014.926032")
##D ft_get("10.1080/03088839.2013.863435")
##D 
##D ## CogentOA - part of Inform/Taylor Francis now
##D ft_get('10.1080/23311916.2014.938430')
##D 
##D library(rplos)
##D (dois <- searchplos(q="*:*", fl='id',
##D    fq=list('doc_type:full',"article_type:\"research article\""), limit=5)$data$id)
##D ft_get(dois, from='plos')
##D ft_get(c('10.7717/peerj.228','10.7717/peerj.234'), from='entrez')
##D 
##D # elife
##D ft_get('10.7554/eLife.04300', from='elife')
##D ft_get(c('10.7554/eLife.04300', '10.7554/eLife.03032'), from='elife')
##D ## search for elife papers via Entrez
##D dois <- ft_search("elife[journal]", from = "entrez")
##D ft_get(dois)
##D 
##D # Frontiers in Pharmacology (publisher: Frontiers)
##D doi <- '10.3389/fphar.2014.00109'
##D ft_get(doi, from="entrez")
##D 
##D # Hindawi Journals
##D ft_get(c('10.1155/2014/292109','10.1155/2014/162024','10.1155/2014/249309'), from='entrez')
##D res <- ft_search(query='ecology', from='crossref', limit=50,
##D                  crossrefopts = list(filter=list(has_full_text = TRUE,
##D                                                  member=98,
##D                                                  type='journal-article')))
##D 
##D out <- ft_get(res$crossref$data$DOI[1:20], from='entrez')
##D 
##D # Frontiers Publisher - Frontiers in Aging Nueroscience
##D res <- ft_get("10.3389/fnagi.2014.00130", from='entrez')
##D res$entrez
##D 
##D # Search entrez, get some DOIs
##D (res <- ft_search(query='ecology', from='entrez'))
##D res$entrez$data$doi
##D ft_get(res$entrez$data$doi[1], from='entrez')
##D ft_get(res$entrez$data$doi[1:3], from='entrez')
##D 
##D # Search entrez, and pass to ft_get()
##D (res <- ft_search(query='ecology', from='entrez'))
##D ft_get(res)
##D 
##D # elsevier, ugh
##D ## set an environment variable like Sys.setenv(CROSSREF_TDM = "your key")
##D ft_get(x = "10.1016/j.trac.2016.01.027", from = "elsevier")
##D 
##D # wiley, ugh
##D ## Wiley has only PDF, so type parameter doesn't do anything
##D ft_get(x = "10.1006/asle.2001.0035", from = "wiley")
##D 
##D # IEEE, ugh
##D ft_get('10.1109/TCSVT.2012.2221191', type = "pdf")
##D 
##D # AIP Publishing
##D ft_get('10.1063/1.4967823', try_unknown = TRUE)
##D 
##D # PNAS
##D ft_get('10.1073/pnas.1708584115', try_unknown = TRUE)
##D 
##D # American Society for Microbiology
##D ft_get('10.1128/cvi.00178-17')
##D 
##D # American Society of Clinical Oncology
##D ft_get('10.1200/JCO.18.00454')
##D 
##D # American Institute of Physics
##D ft_get('10.1063/1.4895527')
##D 
##D # American Chemical Society
##D ft_get(c('10.1021/la903074z', '10.1021/jp048806z'))
##D 
##D 
##D # From ft_links output
##D ## Crossref
##D (res2 <- ft_search(query = 'ecology', from = 'crossref', limit = 3))
##D (out <- ft_links(res2))
##D (ress <- ft_get(x = out, type = "pdf"))
##D ress$crossref
##D 
##D (x <- ft_links("10.1111/2041-210X.12656", "crossref"))
##D (y <- ft_get(x))
##D 
##D ## PLOS
##D (res2 <- ft_search(query = 'ecology', from = 'plos', limit = 4))
##D (out <- ft_links(res2))
##D out$plos
##D (ress <- ft_get(x = out, type = "pdf"))
##D ress$plos
##D ress$plos$dois
##D ress$plos$data
##D ress$plos$data$path$`10.1371/journal.pone.0059813`
##D 
##D ## No publisher plugin provided yet
##D ft_get('10.1037/10740-005')
##D ### no link available for this DOI
##D res <- ft_get('10.1037/10740-005', try_unknown = TRUE)
##D res$crossref
##D 
##D # Get a progress bar - off by default
##D library(rplos)
##D (dois <- searchplos(q="*:*", fl='id',
##D    fq=list('doc_type:full',"article_type:\"research article\""), limit=5)$data$id)
##D ## when articles not already downloaded you see the progress bar
##D b <- ft_get(dois, from='plos', progress = TRUE)
##D ## if articles already downloaded/cached, normally we through messages saying so
##D b <- ft_get(dois, from='plos', progress = FALSE)
##D ## but if a progress bar is requested, then the messages are suppressed
##D b <- ft_get(dois, from='plos', progress = TRUE)
## End(Not run)



