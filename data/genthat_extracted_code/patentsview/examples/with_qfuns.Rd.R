library(patentsview)


### Name: with_qfuns
### Title: With qry_funs
### Aliases: with_qfuns

### ** Examples

# Without with_qfuns, we have to do:
qry_funs$and(
  qry_funs$gte(patent_date = "2007-01-01"),
  qry_funs$text_phrase(patent_abstract = c("computer program")),
  qry_funs$or(
    qry_funs$eq(inventor_last_name = "ihaka"),
    qry_funs$eq(inventor_first_name = "chris")
  )
)

#...With it, this becomes:
with_qfuns(
 and(
   gte(patent_date = "2007-01-01"),
   text_phrase(patent_abstract = c("computer program")),
   or(
     eq(inventor_last_name = "ihaka"),
     eq(inventor_first_name = "chris")
   )
 )
)




