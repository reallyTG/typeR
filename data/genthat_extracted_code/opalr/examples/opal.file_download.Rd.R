library(opalr)


### Name: opal.file_download
### Title: Download a file
### Aliases: opal.file_download

### ** Examples

## Not run: 
##D o <- opal.login('administrator','password','https://opal-demo.obiba.org')
##D # download a file
##D opal.file_download(o, '/home/administrator/joins/join-src-3.csv')
##D # download a file encrypted by a key: resulting file is a zip with an encrypted content
##D opal.file_download(o, '/home/administrator/export/some-data.csv', 
##D                       destination='some-data.zip', key='AZF57893FBDE')
##D # download, create destination folder and rename file
##D opal.file_download(o, '/home/administrator/spss/DatabaseTest.sav', 'spss/test.sav')
##D # download a folder
##D opal.file_download(o, '/home/administrator/export', 'export.zip')
##D opal.logout(o)
## End(Not run)



