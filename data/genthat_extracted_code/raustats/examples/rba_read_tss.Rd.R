library(raustats)


### Name: rba_read_tss
### Title: Read RBA statistical time series spreadsheet
### Aliases: rba_read_tss

### ** Examples

 ## No test: 
   rba_urls <- rba_search(pattern = "Liabilities and Assets")$url
   rba_files <- sapply(rba_urls, rba_file_download)
   data <- rba_read_tss(rba_files);
 
## End(No test)



