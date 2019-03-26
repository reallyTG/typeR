library(GetHFData)


### Name: ghfd_get_available_tickers_from_file
### Title: Function to get available tickers from downloaded zip file
### Aliases: ghfd_get_available_tickers_from_file

### ** Examples


## get file from package (usually this would be been downloaded from the ftp)
out.file <- system.file("extdata", 'NEG_OPCOES_20151126.zip', package = "GetHFData")

df.tickers <- ghfd_get_available_tickers_from_file(out.file)

print(head(df.tickers))



