library(dwapi)


### Name: append_data_frame_to_stream
### Title: Append an R data frame to a data.world stream.
### Aliases: append_data_frame_to_stream

### ** Examples

## Not run: 
##D   aDf <- data.frame(ID=1:2, Value=c('One', 'Two'), stringsAsFactors = FALSE)
##D   dwapi::append_data_frame_to_stream(owner_id = 'user',
##D     dataset_id = 'dataset', stream_id = 'mystream',
##D     aDf)
##D   aDf <- data.frame(ID=1:2, Value=c('One', 'Two'), stringsAsFactors = FALSE)
##D   dwapi::append_data_frame_to_stream(owner_id = 'user',
##D     dataset_id = 'dataset', stream_id = 'mystream',
##D     aDf, retry_times = 10, retry_quiet = TRUE)
## End(Not run)



