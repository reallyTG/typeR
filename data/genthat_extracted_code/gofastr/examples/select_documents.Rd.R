library(gofastr)


### Name: select_documents
### Title: Select Documents rom a TermDocumentMatrix/DocumentTermMatrix
### Aliases: select_documents

### ** Examples

(x <-with(presidential_debates_2012, q_dtm(dialogue, paste(time, person, sep = "_"))))
select_documents(x, 'romney', ignore.case=TRUE)
select_documents(x, '^(?!.*romney).*$', ignore.case = TRUE)      # regex way to invert
select_documents(x, 'romney', ignore.case = TRUE, invert = TRUE) # easier way to invert
(y <- with(presidential_debates_2012, q_tdm(dialogue, paste(time, person, sep = "_"))))
select_documents(y, '[2-3]')



