library(haploR)


### Name: queryRegulome
### Title: This function queries RegulomeDB <URL: www.regulomedb.org>
###   web-based tool and returns results in a data frame.
### Aliases: queryRegulome

### ** Examples

data <- queryRegulome(c("rs4791078","rs10048158"))
head(data[["res.table"]])
head(data[["bad.snp.id"]])



