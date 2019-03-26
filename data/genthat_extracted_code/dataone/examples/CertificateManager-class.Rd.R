library(dataone)


### Name: CertificateManager-class
### Title: CertficateManager provides mechanisms to obtain, load, verify,
###   and display X509 certificates.
### Aliases: CertificateManager-class
### Keywords: classes

### ** Examples

## Not run: 
##D cm <- suppressWarnings(CertificateManager())
##D cert <- getCertLocation(cm)
##D subject <- showClientSubject(cm)
##D expires <- getCertExpires(cm)
##D isExpired <- isCertExpired(cm)
##D cm <- obscureCert(cm)
##D cm <- restoreCert(cm)
## End(Not run)



