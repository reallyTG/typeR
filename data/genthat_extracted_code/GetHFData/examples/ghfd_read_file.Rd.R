library(GetHFData)


### Name: ghfd_read_file
### Title: Reads zip file downloaded from Bovespa ftp (trades or orders)
### Aliases: ghfd_read_file

### ** Examples


my.assets <- c('ABEVA20', 'PETRL78')

## getting data from local file (in practice it would be downloaded from ftp)
out.file <- system.file("extdata", 'NEG_OPCOES_20151126.zip', package = "GetHFData")

df.out <- ghfd_read_file(out.file, my.assets)
print(head(df.out))



