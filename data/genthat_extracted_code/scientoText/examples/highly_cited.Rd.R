library(scientoText)


### Name: highly_cited
### Title: Highly Cited Instances
### Aliases: highly_cited

### ** Examples

citations<-c(2,0,12,3,1,1,4,5,8,2)
pub_years<-c(2011,2011,2012,2011,2013,2011,2011,2012,2011,2013)
ref_citations<-c(3,0,12,3,1,1,41,5,8,2,2,0,12,30,1,1,4,5,8,12)
ref_pub_years<-c(2012,2011,2012,2013,2013,2011,2011,2012,
2011,2013,2011,2011,2012,2011,2013,2011,2011,2012,2011,2013)
highly_cited(citations,pub_years,ref_citations,ref_pub_years,10)
highly_cited(citations,pub_years,year_lim = list(c(2011, 2012, 2013), c(41, 12, 12)))



