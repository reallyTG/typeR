library(pvar)


### Name: %.%
### Title: Concatenate strings
### Aliases: %.%

### ** Examples

paste('I ', 'love ', 'R.', sep='')
'I ' %.% 'love ' %.% 'R.'

x = c(2,1,6,7,9)
paste('The length of vector (', paste(x , sep='', collapse =','), ') is ', length(x) , sep='')
'The length of vector (' %.% paste(x , sep='', collapse =',') %.% ') is ' %.% length(x)



