library(rplos)


### Name: searchplos
### Title: Base function to search PLoS Journals
### Aliases: searchplos

### ** Examples

## Not run: 
##D searchplos(q='ecology', fl=c('id','publication_date'), limit = 2)
##D searchplos('ecology', fl=c('id','publication_date'), limit = 2)
##D searchplos('ecology', c('id','title'), limit = 2)
##D 
##D # Get only full article DOIs
##D out <- searchplos(q="*:*", fl='id', fq='doc_type:full', start=0, limit=250)
##D head(out$data)
##D 
##D # Get DOIs for only PLoS One articles
##D out <- searchplos(q="*:*", fl='id', fq='journal_key:PLoSONE', start=0, limit=15)
##D out$data
##D 
##D # Get DOIs for full article in PLoS One
##D out <- searchplos(q="*:*", fl='id', fq=list('journal_key:PLoSONE',
##D    'doc_type:full'), limit=50)
##D out$data
##D 
##D # Serch for many q
##D q <- c('ecology','evolution','science')
##D lapply(q, function(x) searchplos(x, limit=2))
##D 
##D # Query to get some PLOS article-level metrics, notice difference between two outputs
##D out <- searchplos(q="*:*", fl=c('id','counter_total_all','alm_twitterCount'),fq='doc_type:full')
##D out_sorted <- searchplos(q="*:*", fl=c('id','counter_total_all','alm_twitterCount'),
##D    fq='doc_type:full', sort='counter_total_all desc')
##D out$data
##D out_sorted$data
##D 
##D # Show me all articles that have these two words less then about 15 words apart.
##D searchplos(q='everything:"sports alcohol"~15', fl='title', fq='doc_type:full')
##D 
##D # Now let's try to narrow our results to 7 words apart. Here I'm changing the ~15 to ~7
##D searchplos(q='everything:"sports alcohol"~7', fl='title', fq='doc_type:full')
##D 
##D # A list of articles about social networks that are popular on a social network
##D searchplos(q="*:*",fl=c('id','alm_twitterCount'),
##D    fq=list('doc_type:full','subject:"Social networks"','alm_twitterCount:[100 TO 10000]'),
##D    sort='counter_total_month desc')
##D 
##D # Now, lets also only look at articles that have seen some activity on twitter.
##D # Add "fq=alm_twitterCount:[1 TO *]" as a parameter within the fq argument.
##D searchplos(q='everything:"sports alcohol"~7', fl=c('alm_twitterCount','title'),
##D    fq=list('doc_type:full','alm_twitterCount:[1 TO *]'))
##D searchplos(q='everything:"sports alcohol"~7', fl=c('alm_twitterCount','title'),
##D    fq=list('doc_type:full','alm_twitterCount:[1 TO *]'),
##D    sort='counter_total_month desc')
##D 
##D # Return partial doc parts
##D ## Return Abstracts only
##D out <- searchplos(q='*:*', fl=c('doc_partial_body','doc_partial_parent_id'),
##D    fq=list('doc_type:partial', 'doc_partial_type:Abstract'), limit=3)
##D ## Return Title's only
##D out <- searchplos(q='*:*', fl=c('doc_partial_body','doc_partial_parent_id'),
##D    fq=list('doc_type:partial', 'doc_partial_type:Title'), limit=3)
##D 
##D # Remove DOIs for annotations (i.e., corrections)
##D searchplos(q='*:*', fl=c('id','article_type'),
##D    fq='-article_type:correction', limit=100)
##D 
##D # Remove DOIs for annotations (i.e., corrections) and Viewpoints articles
##D searchplos(q='*:*', fl=c('id','article_type'),
##D    fq=list('-article_type:correction','-article_type:viewpoints'), limit=100)
##D 
##D # Get eissn codes
##D searchplos(q='*:*', fl=c('id','journal','eissn','cross_published_journal_eissn'),
##D    fq="doc_type:full", limit = 60)
##D 
##D searchplos(q='*:*', fl=c('id','journal','eissn','cross_published_journal_eissn'),
##D    limit = 2000)
## End(Not run)



