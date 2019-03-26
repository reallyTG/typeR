library(plotprotein)


### Name: site_data
### Title: downloading protein site
### Aliases: site_data
### Keywords: site_data file

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function () 
{
    library(XML)
    library(plyr)
    protein = read.table("Protein.txt", sep = "\t", stringsAsFactors = F)
    name = protein[2]
    url_p = "http://www.uniprot.org/uniprot/"
    url_s = "#showFeatures"
    url_w = paste(url_p, name, url_s, sep = "")
    url = url_w
    doc <- htmlParse(url)
 position_s = xpathSApply (doc, "//table[@id= 'sitesAnno_section'] 
  /tr/td/  a[@class = 'position tooltipped']",  
        xmlValue)
    name_s = xpathSApply (doc, "//table[@id= 'sitesAnno_section']/tr/td/span[@property='text']", 
        xmlValue)
    s_s <- c()
    for (i in 1:length(position_s)) {
        s_s[i] <- gsub(pattern = "//D", replacement = "x", position_s[i])
    }
    s_s <- strsplit(s_s, "xxx")
    d1_s <- laply(s_s, function(x) x[1])
    d2_s <- laply(s_s, function(x) x[2])
    r1_site = d1_s
    r2_site = name_s
    dfrm_site = data.frame(r1_site, r2_site)
    write.table(dfrm_site, file = "Site.txt", sep = "/t", quote = FALSE, 
        row.names = F, col.names = F)
  }



