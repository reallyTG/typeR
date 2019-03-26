library(Autoplotprotein)


### Name: domain_data
### Title: downloading protein length
### Aliases: domain_data
### Keywords: domain data file

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
    position_d = xpathSApply (doc, "//table[@id= 'domainsAnno_section'] 
  /tr/td/  a[@class = 'position tooltipped']",  
        xmlValue)
    name_d = xpathSApply (doc, "//table[@id= 'domainsAnno_section']/tr/td/span[@property='text']", 
        xmlValue)
    s_d = c()
    for (i in 1:length(position_d)) {
        s_d[i] <- gsub(pattern = "//D", replacement = "x", position_d[i])
    }
    s_d <- strsplit(s_d, "xxx")
    d1_d <- laply(s_d, function(x) x[1])
    d2_d <- laply(s_d, function(x) x[2])
    r1_d = d1_d
    r2_d = d2_d
    r3_d = name_d
    dfrm_d = data.frame(r1_d, r2_d, r3_d)
    write.table(dfrm_d, file = "Domain.txt", sep = "/t", quote = FALSE, 
        row.names = F, col.names = F)
  }



