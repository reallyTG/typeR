library(TextForecast)


### Name: get_collocations
### Title: get_collocations function
### Aliases: get_collocations

### ** Examples

## No test: 
st_year=2017
end_year=2018
path_name=system.file("news",package="TextForecast")
qt=paste0(sort(rep(seq(from=st_year,to=end_year,by=1),12)),
c("m1","m2","m3","m4","m5","m6","m7","m8","m9","m10","m11","m12"))
z_coll=get_collocations(corpus_dates=qt[1:23],path_name=path_name,
ntrms=500,ngrams_number=3,min_freq=10)
## End(No test)
path_name=system.file("news",package="TextForecast")
days=c("2019-30-01","2019-31-01")
z_coll=get_collocations(corpus_dates=days[1],path_name=path_name,
ntrms=500,ngrams_number=3,min_freq=1)




