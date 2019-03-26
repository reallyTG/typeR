library(Rcrawler)


### Name: LinkNormalization
### Title: Link Normalization
### Aliases: LinkNormalization

### ** Examples


# Normalize a set of links

links<-c("http://www.twitter.com/share?url=http://glofile.com/page.html",
         "/finance/banks/page-2017.html",
         "./section/subscription.php",
         "//section/",
         "www.glofile.com/home/",
         "IndexEn.aspx",
         "glofile.com/sport/foot/page.html",
         "sub.glofile.com/index.php",
         "http://glofile.com/page.html#1",
         "?tags%5B%5D=votingrights&amp;sort=popular"
                   )

links<-LinkNormalization(links,"http://glofile.com" )

links





