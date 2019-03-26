library(mdftracks)


### Name: write.mdf
### Title: Write an MTrackJ Data File ('.mdf')
### Aliases: write.mdf

### ** Examples

## Not run: 
##D # Output to file
##D write.mdf(mdftracks.example.data, '~/example.mdf', id.column = 'uid',
##D           time.column = 't', pos.columns = letters[24:26])
## End(Not run)

# Output to stdout with cluster column
write.mdf(mdftracks.example.data, cluster.column = 'cl',
          id.column = 'id', time.column = 't', pos.columns = letters[24:26])

# Output to stdout using data in (id, t, x, y, z) format
write.mdf(mdftracks.example.data[, c('uid', 't', letters[24:26])])




