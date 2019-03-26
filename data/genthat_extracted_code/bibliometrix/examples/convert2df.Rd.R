library(bibliometrix)


### Name: convert2df
### Title: Convert a Clarivate Analytics WoS, SCOPUS and COCHRANE Database
###   Export files or RISmed PubMed/MedLine object into a data frame
### Aliases: convert2df

### ** Examples

# An ISI or SCOPUS Export file can be read using \code{readLines} function:

# D <- readFiles('filename1.txt','filename2.txt','filename3.txt')

# filename1.txt, filename2.txt and filename3.txt are WoS or SCOPUS Export file 
# in plain text or bibtex format.

#  biblio <- readFiles('http://www.bibliometrix.org/datasets/bibliometrics_articles.txt')

data(biblio)

biblio_df_df <- convert2df(file = biblio, dbsource = "isi", format = "bibtex")




