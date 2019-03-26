library(geometa)


### Name: ISOKeywords
### Title: ISOKeywords
### Aliases: ISOKeywords
### Keywords: ISO keywords

### ** Examples

  #a basic keyword set
  md <- ISOKeywords$new()
  md$addKeyword("keyword1")
  md$addKeyword("keyword2")
  md$setKeywordType("theme")
  th <- ISOCitation$new()
  th$setTitle("General")
  md$setThesaurusName(th)
  xml <- md$encode()
  
  #a keyword set with anchors
  md <- ISOKeywords$new()
  kwd1 <- ISOAnchor$new(
    name = "keyword1",
    href = "http://myvocabulary.geometa/keyword1"
  )
  md$addKeyword(kwd1)
  kwd2 <- ISOAnchor$new(
    name = "keyword2",
    href = "http://myvocabulary.geometa/keyword2"
  )
  md$addKeyword(kwd2)
  md$setKeywordType("theme")
  xml <- md$encode()
  
  #Example for INSPIRE (GEMET Spatial Data Theme)
  inspire_kwd <- ISOKeywords$new()
  anc1 <- ISOAnchor$new(
    name = "Environmental monitoring facilities",
    href = "http://inspire.ec.europa.eu/theme/ef"
  )
  inspire_kwd$addKeyword(anc1)
  inspire_kwd$setKeywordType("theme")
  th <- ISOCitation$new()
  th$setTitle(
    ISOAnchor$new(
     name = "GEMET - INSPIRE themes, version 1.0",
     href="http://www.eionet.europa.eu/gemet/inspire_themes"
    )
  )
  inspire_date <- ISODate$new()
  inspire_date$setDate("2008-06-01")
  inspire_date$setDateType("publication")
  th$addDate(inspire_date)
  inspire_kwd$setThesaurusName(th)
  



