library(GetDFPData)


### Name: gdfpd.download.file
### Title: Downalods files from the internet
### Aliases: gdfpd.download.file

### ** Examples


my.url <- paste0('http://www.rad.cvm.gov.br/enetconsulta/',
                  'frmDownloadDocumento.aspx?CodigoInstituicao=2',
                  '&NumeroSequencialDocumento=46133')

## Not run: 
##D  # keep CHECK fast
##D dl.status <- gdfpd.download.file(my.url, 'tempfile.zip', 10)
## End(Not run)



