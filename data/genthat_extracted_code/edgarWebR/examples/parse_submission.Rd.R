library(edgarWebR)


### Name: parse_submission
### Title: Parse Submission
### Aliases: parse_submission

### ** Examples

parse_submission(paste0('https://www.sec.gov/Archives/edgar/data/',
                 '37996/000003799617000084/0000037996-17-000084.txt'))[ ,
                   c('SEQUENCE', 'TYPE', 'DESCRIPTION', 'FILENAME')]



