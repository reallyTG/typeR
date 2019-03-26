library(TextForecast)


### Name: get_terms
### Title: Title
### Aliases: get_terms

### ** Examples

## No test: 
st_year=2017
end_year=2018
path_name=system.file("news",package="TextForecast")
qt=paste0(sort(rep(seq(from=st_year,to=end_year,by=1),12)),
c("m1","m2","m3","m4","m5","m6","m7","m8","m9","m10","m11","m12"))
z_terms=get_terms(corpus_dates=qt[1:23],path.name=path_name,
ntrms_words=500,ngrams_number=3,st=0,ntrms_collocation=500,min_freq=10)
## End(No test)
path_name=system.file("news",package="TextForecast")
days=c("2019-30-01","2019-31-01")
z_terms=get_terms(corpus_dates=days[1],path.name=path_name,
ntrms_words=500,ngrams_number=3,st=0,ntrms_collocation=500,min_freq=1)




